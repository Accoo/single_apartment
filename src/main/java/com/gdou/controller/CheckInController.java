package com.gdou.controller;

import com.gdou.model.Lodger;
import com.gdou.model.Room;
import com.gdou.model.RoomCheckin;
import com.gdou.service.CheckInService;
import com.gdou.service.LodgerService;
import com.gdou.service.RoomService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.util.Date;

@Controller
@RequestMapping("/")
public class CheckInController {

    @Resource
    private RoomService roomService;

    @Resource
    private LodgerService lodgerService;

    @Resource
    private CheckInService checkInService;

    @RequestMapping("/checkin")
    public String setCheckin() {
        return "checkin";
    }

    @RequestMapping("/roomerInfo")
    public String getRoomerInfo() {
        return "roomerInfo";
    }

    @ResponseBody
    @RequestMapping(value = "/getCheckin",method= RequestMethod.GET,produces="application/json;charset=UTF-8")
    public int getCheckin(String roomNumber,String checkoutType, HttpSession session) {
        RoomCheckin checkin = checkInService.selectByRoomNum(roomNumber);
        if(checkin.getRoom().getRoomStatus() != 0){
            session.setAttribute("checkin", checkin);
            session.setAttribute("checkoutType",checkoutType);
            return 1;
        }
        return 0;
    }

    @ResponseBody
    @RequestMapping(value="/checkinAction",method= RequestMethod.GET,produces="application/json;charset=UTF-8")
    public int checkin(String roomNumber, Lodger roomer,String adminName, RoomCheckin roomCheckin) {
        Room room = roomService.selectByNum(roomNumber);
        if (room.getRoomStatus() == 0){
            if (lodgerService.selectByRoomerId(roomer.getRoomerId()) == null) {
                lodgerService.insertLodger(roomer);
            }
            roomCheckin.getRoom().setRoomNumber(roomNumber);
            roomCheckin.getLodger().setId(lodgerService.selectByRoomerId(roomer.getRoomerId()).getId());
            roomCheckin.setPaymentStatus(0);
            roomCheckin.setCheckinRegisterant(adminName);
            // 设置登记人
            try{
                //  解决中文乱码
                roomCheckin.setCheckinRegisterant(URLDecoder.decode(adminName,"UTF-8"));
            } catch (Exception e){
                e.printStackTrace();
            }
            //    设置登记时间
            Date date = new Date();
            Timestamp timeStamp = new Timestamp(date.getTime());
            roomCheckin.setCheckinTime(timeStamp);
            if (checkInService.insertCheckin(roomCheckin)){
                room.setRoomStatus(1);
                if (roomService.updateRoom(room)){
                    return 1;
                }
            }
        }
        return 0;
    }
}
