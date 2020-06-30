package com.gdou.controller;

import com.gdou.model.*;
import com.gdou.others.Layui;
import com.gdou.service.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/")
public class MainController {

    @Resource
    private RoomService roomService;

    @Resource
    private LodgerService lodgerService;

    @Resource
    private CheckOutService checkOutService;

    @Resource
    private CheckInService checkInService;

    @Resource
    private ExpenditureService expenditureService;

    @RequestMapping("/index")
    public String initIndex(HttpSession session){
        return "index";
    }

    @RequestMapping("/test")
    public String test()
    {
        return "test";
    }

    @RequestMapping("/performance")
    public String performance()
    {
        return "performance";
    }

    @RequestMapping("/rentOwed")
    public String rentOwed()
    {
        return "rentOwed";
    }

    @RequestMapping("/imitateAppoint")
    public String imitateAppoint()
    {
        return "imitateAppoint";
    }

    @RequestMapping("/imitate")
    public String imitate()
    {
        return "imitate";
    }

    @RequestMapping("/appointList")
    public String appointList()
    {
        return "appointList";
    }

    @ResponseBody
    @RequestMapping(value="/getAppointList",method= RequestMethod.GET,produces="application/json;charset=UTF-8")
    public Layui getAppointList(@RequestParam(required=false,defaultValue="1") int page, @RequestParam(required=false) int limit) {
        PageHelper.startPage(page, limit);
        // 查询列表数据
        List<RoomCheckin> appointList = checkInService.selectAllAppoint();
        // 使用pageInfo包装查询
        PageInfo<RoomCheckin> rolePageInfo = new PageInfo<>(appointList);
        return Layui.data(rolePageInfo.getTotal(),rolePageInfo.getList());
    }

    @ResponseBody
    @RequestMapping(value="/passAppoint",method= RequestMethod.GET,produces="application/json;charset=UTF-8")
    public int passAppoint(String roomNumber,String passType) {
        Room room = roomService.selectByNum(roomNumber);
        RoomCheckin checkIn = checkInService.selectByRoomNum(roomNumber);
        if (passType.equals("0")){
            room.setRoomStatus(1);
            //    设置登记时间
            Date date = new Date();
            Timestamp timeStamp = new Timestamp(date.getTime());
            checkIn.setCheckinTime(timeStamp);
            if (roomService.updateRoom(room) && checkInService.update(checkIn)){
                return 1;
            }
        } else {
            room.setRoomStatus(0);
            if (roomService.updateRoom(room)){
                return 1;
            }
        }
        return 0;
    }

    @ResponseBody
    @RequestMapping(value="/appointAction",method= RequestMethod.GET,produces="application/json;charset=UTF-8")
    public int appointAction(String roomNumber, Lodger roomer, String adminName, RoomCheckin roomCheckin) {
        Room room = roomService.selectByNum(roomNumber);
        if (room.getRoomStatus() == 0){
            if (lodgerService.selectByRoomerId(roomer.getRoomerId()) == null) {
                lodgerService.insertLodger(roomer);
            }
            roomCheckin.getRoom().setRoomNumber(roomNumber);
            roomCheckin.getLodger().setId(lodgerService.selectByRoomerId(roomer.getRoomerId()).getId());
            roomCheckin.setCheckinRegisterant(adminName);
            roomCheckin.setPaymentStatus(0);
            // 设置登记人
            try{
                //  解决中文乱码
                roomCheckin.setCheckinRegisterant(URLDecoder.decode(adminName,"UTF-8"));
            } catch (Exception e){
                e.printStackTrace();
            }
//            设置登记时间
            Date date = new Date();
            Timestamp timeStamp = new Timestamp(date.getTime());
            roomCheckin.setCheckinTime(timeStamp);
            if (checkInService.insertCheckin(roomCheckin)){
                room.setRoomStatus(2);
                if (roomService.updateRoom(room)){
                    return 1;
                }
            }
        }
        return 0;
    }

    @ResponseBody
    @RequestMapping(value = "/getRentOwed")
    public Layui getRentOwed(HttpSession session){
        Date today=new Date();
        Calendar payedTime = Calendar.getInstance();
        RoomCheckin checkin = new RoomCheckin();
        List<RoomCheckin> rentOwedList = new ArrayList<>();
        List<RoomCheckin> checkinList = checkInService.selectAllEffective();
        for (int i = 0;i <= checkinList.size()-1;i ++){
            checkin = checkinList.get(i);
            payedTime.setTime(checkin.getCheckinTime());
//            入住日期加已交租月数*交付类型
            payedTime.add(Calendar.MONTH,checkin.getPaymentStatus()*checkin.getPaymentType());
//            以半个月为交租标准时间
            payedTime.add(Calendar.DAY_OF_YEAR,15);
//            若今天在应交租日期之后且还未交租满租房时长则视为欠租
            if (today.after(payedTime.getTime()) && checkin.getCheckinLength()!=checkin.getPaymentStatus()*checkin.getPaymentType()){
                rentOwedList.add(checkin);
//                将房间改为欠租状态
                Room room = roomService.selectByNum(checkin.getRoom().getRoomNumber());
                room.setRoomStatus(3);
                roomService.updateRoom(room);
            }
        }
//        使用pageInfo包装
        PageInfo<RoomCheckin> rolePageInfo = new PageInfo<>(rentOwedList);
        return Layui.data(rolePageInfo.getTotal(),rolePageInfo.getList());
    }

    @ResponseBody
    @RequestMapping(value = "/getAnnual",method= RequestMethod.GET,produces="application/json;charset=UTF-8")
    public int getAnnual(HttpSession session, HttpServletResponse response) throws IOException {
        //新建数组
        Float income[] = new Float[]{0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f};
        Float expends[] = new Float[]{0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f};
        Float profit[] = new Float[]{0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f,0f};
        //全年总值
        Float incomeTotal = 0f;
        Float serviceTotal = 0f;
        Float decorationTotal = 0f;
        //查询所有退房表单和支出表单
        List<RoomCheckout> outList = new ArrayList<>();
        List<Expenditure> expList = new ArrayList<>();
        outList = checkOutService.selectAll();
        expList = expenditureService.search(new Expenditure());
        if (outList != null){
            for (int i = 0;i < outList.size();i ++){
                Float money = outList.get(i).getCheckoutMoey();
                Date checkoutDate = outList.get(i).getCheckoutDate();
                //获得的月份
                int month = Integer.parseInt((new SimpleDateFormat("MM")).format(checkoutDate));
                //相应月份的收入额累加
                income[month-1] = income[month-1] + money;
            }
        }
        if (expList != null){
            for (int j = 0;j < expList.size();j ++){
                Float expend = expList.get(j).getTotalCharge();
                Date expendDate = expList.get(j).getPayDate();
                int expendMonth = Integer.parseInt((new SimpleDateFormat("MM")).format(expendDate));
                expends[expendMonth-1] = expends[expendMonth-1] + expend;
                //计算全年维修费、装修费总值
                if (expList.get(j).getExpendType().equals("维修")){
                    serviceTotal = serviceTotal + expList.get(j).getTotalCharge();
                }else if (expList.get(j).getExpendType().equals("装修")){
                    decorationTotal = decorationTotal + expList.get(j).getTotalCharge();
                }

            }
        }
        for(int k = 0;k < profit.length;k ++){
            profit[k] = income[k] - expends[k];
            incomeTotal = incomeTotal + income[k];
        }
        session.setAttribute("serviceTotal", serviceTotal);
        session.setAttribute("decorationTotal", decorationTotal);
        session.setAttribute("incomeTotal", incomeTotal);
        //数组转化为字符串形式，便于前端处理
        session.setAttribute("income", Arrays.toString(income));
        session.setAttribute("expends", Arrays.toString(expends));
        session.setAttribute("profit", Arrays.toString(profit));
        //重定向
        response.sendRedirect("performance");
        return 0;
    }

}
