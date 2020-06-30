package com.gdou.controller;

import com.gdou.model.Room;
import com.gdou.model.RoomCheckin;
import com.gdou.model.RoomCheckout;
import com.gdou.service.CheckInService;
import com.gdou.service.CheckOutService;
import com.gdou.service.RoomService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.Date;

@Controller
@RequestMapping("/")
public class CheckOutController {

    @Resource
    private CheckOutService checkOutService;

    @Resource
    private CheckInService checkInService;

    @Resource
    private RoomService roomService;

    @RequestMapping("/checkout")
    public String getCheckout() {
        return "checkout";
    }

    @RequestMapping("/waterElectric")
    public String getWaterElectric() {
        return "waterElectric";
    }

    @ResponseBody
    @RequestMapping(value = "/getWater",method= RequestMethod.GET,produces="application/json;charset=UTF-8")
    public int getWater(String roomNumber,String checkoutType, HttpSession session) {
        RoomCheckin checkin = checkInService.selectByRoomNum(roomNumber);
        System.out.println(checkoutType);
        if(checkin.getRoom().getRoomStatus() != 0){
            session.setAttribute("checkin", checkin);
            session.setAttribute("checkoutType", checkoutType);
            return 1;
        }
        return 0;
    }

    @ResponseBody
    @RequestMapping(value = "/checkoutAction")
    public int checkout(RoomCheckout roomCheckout,String roomNumber,String waterStart,String electricStart,String lodgerId,String payrentTimes) {
//        设置登记时间
        Date date = new Date();
        Timestamp timeStamp = new Timestamp(date.getTime());
        roomCheckout.setCheckoutDate(timeStamp);
        roomCheckout.setRefundDate(timeStamp);
        roomCheckout.getRoom().setRoomNumber(roomNumber);
        roomCheckout.getLodger().setId(Integer.parseInt(lodgerId));
        RoomCheckin checkin = checkInService.selectByRoomNum(roomNumber);
//        交租次数累加
        int status = checkin.getPaymentStatus()+Integer.parseInt(payrentTimes);
//        插入新的交租或退房单
        if(checkOutService.insert(roomCheckout)){
//            退房:交租付数为零
            if (payrentTimes.equals("0")){
                checkin.setPaymentStatus(-1);
                Room room = roomService.selectByNum(roomNumber);
                room.setWaterStart(Float.parseFloat(waterStart));
                room.setElectricStart(Float.parseFloat(electricStart));
                room.setRoomStatus(0);

                if (checkInService.update(checkin) && roomService.updateRoom(room)){
                    return 1;
                }
//                交租
            } else {
                checkin.setPaymentStatus(status);
                Room room = roomService.selectByNum(roomNumber);
                room.setWaterStart(Float.parseFloat(waterStart));
                room.setElectricStart(Float.parseFloat(electricStart));
                room.setRoomStatus(1);
                if (checkInService.update(checkin) && roomService.updateRoom(room)){
                    return 1;
                }
            }
        }
        return 0;
    }

    @ResponseBody
    @RequestMapping(value = "/getCheckout")
    public int getCheckout(String roomNumber,String waterNow,String perWater,String electricNow,String perElectric,String checkoutType,String payrentTimes, HttpSession session) {
        RoomCheckin checkin = checkInService.selectByRoomNum(roomNumber);
        Room room = new Room();
        if((checkin.getRoom().getRoomStatus() != 0) && checkin.getPaymentStatus() >= 0){
            RoomCheckout checkout = new RoomCheckout();
//            计算水电费，（现在水电表数-上次记录水电表数）*水电费单价
            Float sum1 = (Float.parseFloat(waterNow)-checkin.getRoom().getWaterStart())*Float.parseFloat(perWater);
            Float sum2 = (Float.parseFloat(electricNow)-checkin.getRoom().getElectricStart())*Float.parseFloat(perElectric);
            int payType = checkin.getPaymentType();
            int payStates = checkin.getPaymentStatus();
            int length = checkin.getCheckinLength();
            Float roomRent = checkin.getRoom().getRoomType().getRoomRent();
            Float sum3 = 0f;
            Float sum4 = 0f;
//            交房租
            if (checkoutType.equals("0") && !(payrentTimes.equals(""))){
//                应交房租=月租*付租数量*付租类型
                sum4 = roomRent*(Integer.parseInt(payrentTimes))*payType;
                session.setAttribute("payrentTimes",payrentTimes);
//            退房
            } else if (checkoutType.equals("1")){
//                获取押金
                sum3 = checkin.getRoom().getRoomType().getRoomDeposit();
//                计算未交房租=月租*（租用时长-已交租时长）
                sum4 = roomRent*(length - (payType * payStates));
                session.setAttribute("payrentTimes","0");
            }
            checkout.setWaterMoney(sum1);
            checkout.setElectricMoney(sum2);
            checkout.setCheckoutDeposit(sum3);
            checkout.setHireMoney(sum4);
            checkout.setCheckoutMoey(sum1+sum2-sum3+sum4);
//            水电费
            room.setWaterStart(Float.parseFloat(waterNow));
            room.setElectricStart(Float.parseFloat(electricNow));
            session.setAttribute("checkin", checkin);
            session.setAttribute("checkout",checkout);
            session.setAttribute("room",room);
            return 1;
        }
        return 0;
    }
}
