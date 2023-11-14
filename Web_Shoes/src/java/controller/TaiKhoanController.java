/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.KhacHangDao;
import dao.NhanvienDao;
import entities.NhanVien;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author DELL
 */
@Controller
@RequestMapping(value = "admin/taikhoan")
public class TaiKhoanController {
    NhanvienDao bn = null;
    KhacHangDao kdao = null;
    private checkUrl c;
    public TaiKhoanController() {
        bn = new NhanvienDao();
        c = new checkUrl();
        kdao=new KhacHangDao();
    }
    @RequestMapping(value = "/listTaiKhoan", method = RequestMethod.GET)
    public String listTaiKhoan(Model model,HttpSession session) {
        if (c.check(session)) {model.addAttribute("bn", bn.getAlls());
        return "admin/taikhoan/listTaiKhoan";
        } else {
            session.removeAttribute("user");
            return "admin/login";
        }
    }
    @RequestMapping(value = "/listTaiKhoanKhachHang", method = RequestMethod.GET)
    public String listTaiKhoanKhachHang(Model model,HttpSession session) {
        if (c.check(session)) {model.addAttribute("bn", kdao.getAlls());
        return "admin/taikhoan/listTaiKhanKhachHang";
        } else {
            session.removeAttribute("user");
            return "admin/login";
        }
    }
    @RequestMapping(value = "/updatetintrang")
    @ResponseBody
    public Boolean updatetintrang(@RequestParam int maNhanVien,@RequestParam boolean status, ModelMap mm, HttpSession session
    ) {

        NhanVien nhanvien=bn.getAllss(maNhanVien);
        if(nhanvien.getMaChucVu().getMaChucVu()!=1){
        boolean result = bn.updatestatus(maNhanVien,status);

        return result;
        }else{
            return false;
        }
        

    }
    @RequestMapping(value = "/updatetintrangkh")
    @ResponseBody
    public Boolean updatetintrangkh(@RequestParam int maKhachHang,@RequestParam boolean status, ModelMap mm, HttpSession session
    ) {

        boolean result = kdao.updatestatus(maKhachHang,status);
       
        return result;
}
}
