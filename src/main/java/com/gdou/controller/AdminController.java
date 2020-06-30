package com.gdou.controller;

import com.gdou.model.Administrator;
import com.gdou.others.Layui;
import com.gdou.service.AdminService;
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
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/")
public class AdminController {

    public void setAdminService(AdminService adminService){
        this.adminService = adminService;
    }

    @Resource
    private AdminService adminService;

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    @RequestMapping("/admin")
    public  String openAdmin(){
        return "admin";
    }

    @ResponseBody
    @RequestMapping(value = "/getAdmin")
    public String getAdmin(String adminAccount,HttpSession session) {
        Administrator administrator = adminService.selectByAccount(adminAccount);
        if(administrator != null){
            session.setAttribute("getAdmin", administrator);
        }
        return "admin";
    }

    @ResponseBody
    @RequestMapping(value = "/getOneAdmin")
    public String getOneAdmin(String adminAccount, HttpSession session, HttpServletResponse response) throws IOException {
        Administrator administrator = adminService.selectByAccount(adminAccount);
        if(administrator != null){
            session.setAttribute("getAdmin", administrator);
            //重定向
            response.sendRedirect("admin");
        }
        return "admin";
    }

    @RequestMapping("/adminList")
    public String list()
    {
        return "adminList";
    }

    @RequestMapping("/adminListAction")
    @ResponseBody
    public Layui adminlist(@RequestParam(required=false,defaultValue="1") int page, @RequestParam(required=false) int limit){
        // 使用Pagehelper传入当前页数和页面显示条数会自动为我们的select语句加上limit查询
        // 从他的下一条sql开始分页
        PageHelper.startPage(page, limit);
        //查询列表数据
        List<Administrator> adminList = adminService.selectall();
        // 使用pageInfo包装查询
        PageInfo<Administrator> rolePageInfo = new PageInfo<>(adminList);
        return Layui.data(rolePageInfo.getTotal(),rolePageInfo.getList());
    }

    @ResponseBody
    @RequestMapping(value = "/loginAction",method=RequestMethod.GET,produces="application/json;charset=UTF-8")
    public Administrator checkAdmin(String account, String password,HttpSession session){
        Administrator administrator = adminService.selectByAccount(account);
        if(administrator.getAdminPassword().equals(password)){
            session.setAttribute("login", administrator);
//            设置登录时间
            Date date = new Date();
            Timestamp timeStamp = new Timestamp(date.getTime());
            administrator.setLoginTime(timeStamp);
//            设置登录状态
            administrator.setLoginStatus(1);
            if(adminService.updateAdmin(administrator)){
                return administrator;
            }
        }
        return null;
    }

    @ResponseBody
    @RequestMapping(value="/registerAction",method= RequestMethod.GET,produces="application/json;charset=UTF-8")
    public int register(Administrator admin) {
//        设置注册时间
        Date date = new Date();
        // 时间戳
        Timestamp timeStamp = new Timestamp(date.getTime());
        admin.setRegisterTime(timeStamp);
//        设置登录状态
        admin.setLoginStatus(0);
        if (adminService.selectByAccount(admin.getAdminAccount())==null && adminService.register(admin)){
            return 1;
        }
        return 0;
    }

//    登出
    @RequestMapping("logoutAction")
    public String logoutAction(HttpSession session) {
        Administrator administrator = (Administrator)session.getAttribute("login");
        System.out.println(administrator.getAdminAccount());
//        设置登出时间
        Date date = new Date();
        Timestamp timeStamp = new Timestamp(date.getTime());
        administrator.setLogoutTime(timeStamp);
//        设置登录状态
        administrator.setLoginStatus(0);
        if(adminService.updateAdmin(administrator)){
            session.invalidate();
            return "login";
        }
        return "login";
    }

    @ResponseBody
    @RequestMapping(value="/editAdmin",method= RequestMethod.GET,produces="application/json;charset=UTF-8")
    public int editAdmin(Administrator administrator) {
        Administrator admin = adminService.selectByAccount(administrator.getAdminAccount());
        administrator.setId(admin.getId());
        administrator.setLoginStatus(admin.getLoginStatus());
        if (adminService.updateAdmin(administrator)){
            return 1;
        }
        return 0;
    }

    @ResponseBody
    @RequestMapping(value="/deleteAdmin",method= RequestMethod.GET,produces="application/json;charset=UTF-8")
    public int deleteAdmin(int id) {
//        System.out.println(id);
        if (adminService.deleteById(id)){
            return id;
        }
        return 0;
    }

    @ResponseBody
    @RequestMapping(value="/admin/search",method= RequestMethod.GET,produces="application/json;charset=UTF-8")
    public Layui search(String adminAccount, String adminName, String adminSex,String adminRole,String registerStart,String registerEnd,String loginStart,
                        String loginEnd, @RequestParam(required=false,defaultValue="1") int page, @RequestParam(required=false) int limit) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Administrator administrator = new Administrator();
        administrator.setAdminAccount(adminAccount);
        administrator.setAdminName(adminName);
        administrator.setAdminSex(adminSex);
        try{
            if (registerStart != null && registerStart != ""){
                administrator.setRegisterStart(sdf.parse(registerStart));
            }
            if (registerEnd != null && registerEnd != ""){
                administrator.setRegisterEnd(sdf.parse(registerEnd));
            }
            if (loginStart != null && loginStart != ""){
                administrator.setLoginStart(sdf.parse(loginStart));
            }
            if (loginEnd != null && loginEnd != ""){
                administrator.setLoginEnd(sdf.parse(loginEnd));
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        if (adminRole != null && adminRole != "" ){
            administrator.setAdminRole(Integer.parseInt(adminRole));
        }
        PageHelper.startPage(page, limit);
//        //查询列表数据
        List<Administrator> adminList = adminService.search(administrator);
//        // 使用pageInfo包装查询
        PageInfo<Administrator> rolePageInfo = new PageInfo<>(adminList);
        return Layui.data(rolePageInfo.getTotal(),rolePageInfo.getList());
    }
}
