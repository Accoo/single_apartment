package com.gdou.controller;

import com.gdou.model.Room;
import com.gdou.model.RoomCheckin;
import com.gdou.others.Layui;
import com.gdou.service.CheckInService;
import com.gdou.service.LodgerService;
import com.gdou.service.RoomService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/")
public class RoomController {

    @Resource
    private RoomService roomService;

    @Resource
    private CheckInService checkInService;

    @RequestMapping("/addRoom")
    public String addRoom() {
        return "addRoom";
    }

    @RequestMapping("/roomList")
    public String getRoomList() {
        return "roomList";
    }

    @RequestMapping("/room")
    public String setRoom() {
        return "room";
    }

    @RequestMapping("/roomInfo")
    public String getRoomInfo() {
        return "roomInfo";
    }

    @RequestMapping("/exchangeRoom")
    public String getExchangeRoom() {
        return "exchangeRoom";
    }


    @ResponseBody
    @RequestMapping(value="/deleteRoom",method= RequestMethod.GET,produces="application/json;charset=UTF-8")
    public int deleteRoom(String roomNumber) {
//        System.out.println(id);
        if (roomService.deleteByRoomNum(roomNumber)){
            return 1;
        }
        return 0;
    }

    @ResponseBody
    @RequestMapping(value = "/getRoom",method= RequestMethod.GET,produces="application/json;charset=UTF-8")
    public int getRoom(String roomNumber,HttpSession session) {
        Room room = roomService.selectByNum(roomNumber);
        if(room != null){
            session.setAttribute("room", room);
            return 1;
        }
        return 0;
    }

    @ResponseBody
    @RequestMapping(value = "/getRoomStatus",method= RequestMethod.GET,produces="application/json;charset=UTF-8")
    public int getRoomStatus(String roomNumber,String adminName,HttpSession session) {
        Room room = roomService.selectByNum(roomNumber);
        if(room.getRoomStatus() == 0){
            session.setAttribute("room", room);
            session.setAttribute("adminName",adminName);
            return 1;
        }
        return 0;
    }

    @ResponseBody
    @RequestMapping(value = "/exchangeRomAction")
    public int exchangeRoom(String roomNumber,String exchangeRoomNum) {
        int checkinId = checkInService.selectByRoomNum(roomNumber).getCheckinId();
        RoomCheckin excheckin = checkInService.selectByRoomNum(exchangeRoomNum);
        RoomCheckin checkin = checkInService.selectById(checkinId);
        if(excheckin != null){
            excheckin.getRoom().setRoomNumber(roomNumber);
            checkin.getRoom().setRoomNumber(exchangeRoomNum);
            if (checkInService.update(excheckin) && checkInService.update(checkin)){
                return 1;
            }
        } else {
            checkin.getRoom().setRoomNumber(exchangeRoomNum);
            if (checkInService.update(checkin)){
                Room exRoom = roomService.selectByNum(exchangeRoomNum);
                Room room = roomService.selectByNum(roomNumber);
                exRoom.setRoomStatus(1);
                room.setRoomStatus(0);
                if (roomService.updateRoom(exRoom) && roomService.updateRoom(room)){
                    return 1;
                }
            }
        }
        return 0;
    }

    @ResponseBody
    @RequestMapping(value="/editRoom",method= RequestMethod.GET,produces="application/json;charset=UTF-8")
    public int editRoom(Room room,String typeId) {
        room.getRoomType().setTypeid(Integer.parseInt(typeId));
        if (roomService.updateRoom(room)){
            return 1;
        }
        return 0;
    }

    @ResponseBody
    @RequestMapping(value="/addRoomAction",method= RequestMethod.GET,produces="application/json;charset=UTF-8")
    public int insertRoom(Room room,String typeId,String adminName) {
//        String admin = (String) session.getAttribute("login");
//        System.out.println(room.getRoomType().getTypeid());
        room.setRoomStatus(0);
        room.getRoomType().setTypeid(Integer.parseInt(typeId));
//        设置登记时间
        Date date = new Date();
        Timestamp timeStamp = new Timestamp(date.getTime());
        room.setRegisterTime(timeStamp);
        try{
//         解决中文乱码
            room.setRegistrant(URLDecoder.decode(adminName,"UTF-8"));
        } catch (Exception e){
            e.printStackTrace();
        }
        if (roomService.selectByNum(room.getRoomNumber())==null && roomService.insertRoom(room)){
            return 1;
        }
        return 0;
    }

    @ResponseBody
    @RequestMapping(value="/room/search",method= RequestMethod.GET,produces="application/json;charset=UTF-8")
    public Layui search(String roomNumber,String typeId,String roomStatus,@RequestParam(required=false,defaultValue="1") int page, @RequestParam(required=false) int limit) {
        Room room = new Room();
        PageHelper.startPage(page, limit);
        room.setRoomNumber(roomNumber);
        if (typeId != null && !(typeId.equals(""))){
            room.getRoomType().setTypeid(Integer.parseInt(typeId));
        }
        if (roomStatus != null && !(roomStatus.equals(""))){
            room.setRoomStatus(Integer.parseInt(roomStatus));
        }
        // 查询列表数据
        List<Room> roomList = roomService.search(room);
        // 使用pageInfo包装查询
        PageInfo<Room> rolePageInfo = new PageInfo<>(roomList);
        return Layui.data(rolePageInfo.getTotal(),rolePageInfo.getList());
    }
}
