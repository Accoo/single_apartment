package com.gdou.controller;

import com.gdou.model.Expenditure;
import com.gdou.others.Layui;
import com.gdou.service.ExpenditureService;
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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/")
public class ExpenditureController {

    @Resource
    private ExpenditureService expenditureService;

    @Resource
    private RoomService roomService;

    @RequestMapping("/expendOrder")
    public String getExpendOrder() {
        return "expendOrder";
    }

    @RequestMapping("/expendList")
    public String getExpendList() {
        return "expendList";
    }

    @RequestMapping("/expendInfo")
    public String getExpendInfo() {
        return "expendInfo";
    }

    @ResponseBody
    @RequestMapping(value="/addOrder",method= RequestMethod.GET,produces="application/json;charset=UTF-8")
    public int addOrder(Expenditure expenditure, String roomNumber,String adminName) {
        //判断房号是否存在，不存在直接返回0
        if (roomService.selectByNum(roomNumber) != null){
            expenditure.getRoom().setRoomNumber(roomNumber);
        } else{
            return 0;
        }
        // 设置登记人
        try{
            //  解决中文乱码
            expenditure.setOperator(URLDecoder.decode(adminName,"UTF-8"));
        } catch (Exception e){
            e.printStackTrace();
        }
        // 设置总费用
        expenditure.setTotalCharge(expenditure.getMaterialCharge()+expenditure.getEmployeeCharge());
        // 设置时间
        Date date = new Date();
        Timestamp timeStamp = new Timestamp(date.getTime());
        expenditure.setPayDate(timeStamp);
        // 查找该支出类型的最新订单
        Expenditure newExp = new Expenditure();
        newExp.setExpendType(expenditure.getExpendType());
        List<Expenditure> expenditures = expenditureService.search(newExp);
        //获取该支出类型最新支出单号
        String generateExpNum = generateOrderNum(expenditures,expenditure.getExpendType());
        expenditure.setExpNum(generateExpNum);
        if (expenditureService.insert(expenditure)){
            return 1;
        }
        return 0;
    }

    private static String generateOrderNum (List<Expenditure> expenditures,String expendType){
        int number = 0;
        String startTwo = "";
        String lastTwo = "";
        if (expendType.equals("维修")){
            startTwo = "WX";
        } else if (expendType.equals("装修")){
            startTwo = "ZX";
        } else {
            startTwo = "EL";
        }
        SimpleDateFormat sdf =   new SimpleDateFormat( "yyyyMMdd" );
        String str = sdf.format(new Date());
        //查找该支出类型的最新订单号
        if (expenditures.size() != 0){
            String newExpNum = expenditures.get(expenditures.size()-1).getExpNum();
//            已存在当天支出单
            if (newExpNum.substring(2,8).equals(str.substring(2))){
                lastTwo = newExpNum.substring(8);
            } else {
                lastTwo = "00";
            }
        } else {
            lastTwo = "00";
        }
        if (lastTwo.charAt(0) == '0'){
            number = Integer.parseInt(Character.toString(lastTwo.charAt(1)));
            if (number < 9){
                return startTwo + str.substring(2) +"0" +(number+1)+"";
            }
        }
        number = Integer.parseInt(lastTwo);
        return startTwo + str.substring(2) +(number+1)+"";
    }

    @ResponseBody
    @RequestMapping(value="/getOrder",method= RequestMethod.GET,produces="application/json;charset=UTF-8")
    public int getOrder(String expNum, HttpSession session) {
        Expenditure expenditure = expenditureService.selectByExpNum(expNum);
        if(expenditure != null){
            session.setAttribute("expenditure",expenditure);
            return 1;
        }
        return 0;
    }

    @ResponseBody
    @RequestMapping(value="/expenditure/search",method= RequestMethod.GET,produces="application/json;charset=UTF-8")
    public Layui search(String roomNumber,String expNum,String expendStart,String expendEnd,String expendType,@RequestParam(required=false,defaultValue="1") int page, @RequestParam(required=false) int limit) {
        Expenditure expenditure = new Expenditure();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        PageHelper.startPage(page, limit);
        expenditure.setExpNum(expNum);
        expenditure.setExpendType(expendType);
        if (roomNumber != null && roomNumber != ""){
            expenditure.getRoom().setRoomNumber(roomNumber);
        }
        try{
            if (expendStart != null && expendStart != ""){
                expenditure.setExpendStart(sdf.parse(expendStart));
            }
            if (expendEnd != null && expendEnd != ""){
                expenditure.setExpendEnd(sdf.parse(expendEnd));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
//        //查询列表数据
        List<Expenditure> expenditureList = expenditureService.search(expenditure);
//        // 使用pageInfo包装查询
        PageInfo<Expenditure> rolePageInfo = new PageInfo<>(expenditureList);
        return Layui.data(rolePageInfo.getTotal(),rolePageInfo.getList());
    }
}
