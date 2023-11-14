/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.NhanvienDao;
import entities.ChucVu;
import org.springframework.stereotype.Controller;
import entities.NhanVien;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author DELL
 */
@Controller
@RequestMapping(value = "admin")
public class LoginBackendController {

    private NhanvienDao nhanviendao;
    

    public LoginBackendController() {
        nhanviendao = new NhanvienDao();

    }

    @RequestMapping(value = "/taotaikhoan")
    public String taotaikhoan(Model model) {
        model.addAttribute("chucvu",nhanviendao.getAllsa());
        return "admin/taikhoan/taotaikhoan";
    }
    @RequestMapping(value = "/login")
    public String initBackendLogin(Model model) {
        
        return "admin/login";
    }
    @RequestMapping(value = "/checkname")
    @ResponseBody
    public Boolean checkname(@RequestParam String name, ModelMap mm, HttpSession session
    ) {

        Boolean result = nhanviendao.checkNametontai(name);

        
        return result;

    }
    @RequestMapping(value = "/checksoDT")
    @ResponseBody
    public Boolean checksoDT(@RequestParam String soDT, ModelMap mm, HttpSession session
    ) {

        Boolean result = nhanviendao.checkSoDTtontai(soDT);

        
        return result;

    }
    @RequestMapping(value = "/checkemail")
    @ResponseBody
    public Boolean checkemail(@RequestParam String email, ModelMap mm, HttpSession session
    ) {

        Boolean result = nhanviendao.checkEmailtontai(email);

        
        return result;

    }

    @RequestMapping(value = "/backendLogin")
    public String loginBackend(String tenDangNhap,String matKhau, ModelMap mm, HttpSession session) {
        boolean result = false;
        
        result = nhanviendao.loginStudent(tenDangNhap,matKhau);
        

        if (result) {
            NhanVien nhanVien=new NhanVien();
            session.setAttribute("user", tenDangNhap);
            String name = (String) session.getAttribute("user");

            nhanVien = nhanviendao.checkName(name);
          
            if (nhanVien.getStatus()==true) {
               return "redirect: index";
            } else {
                mm.put("message", "tài khoản của bạn đã bị khóa");
                return "admin/login";
            }

        } else {
            mm.put("message", "Sai thông tin đăng nhập.");
            return "admin/login";
        }
    }

    @RequestMapping(value = "/backendSigup", method = RequestMethod.POST)
    public String backendSigup(ModelMap mm,String hoTen,String diaChi,String gioiTinh,String cmnd,String soDT,int maChucVu,String email,String tenDangNhap,String matKhau,HttpServletRequest request) {
       
               
               boolean result=nhanviendao.insertHoaDon(hoTen, diaChi, gioiTinh, cmnd, soDT, maChucVu, email, tenDangNhap, matKhau, true);
                
               
                if(result){
                     mm.put("success", "tạo tài khoản thành công");
                   
                }else{
                    mm.put("error", "tạo tài khoản thất bại");
                     
                }
            
       return "redirect:taikhoan/listTaiKhoan";
    }

    @RequestMapping(value = "/logoutBackend")
    public String logoutBackend( HttpSession session, ModelMap mm, HttpServletRequest request) {

        if (session.getAttribute("user") != null) {
            session.removeAttribute("user");
        }
        return "admin/login";
    }
    
}
