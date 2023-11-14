/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.HoaDonDao;
import entities.ChiTietHoaDon;
import entities.ChiTietHoaDonJoin;
import entities.HoaDon;
import entities.HoaDonJoin;
import java.util.List;
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
@RequestMapping(value = "admin/hoadon")
public class HoaDonController {

    HoaDonDao hdDao = null;
private checkUrl c;
    public HoaDonController() {
        hdDao = new HoaDonDao();
        c = new checkUrl();
    }

    @RequestMapping(value = "listHoaDonDXL", method = RequestMethod.GET)
    public String listHoaDonDXL(Model model,HttpSession session) {
        if (c.check(session)) {
        List<HoaDonJoin> list = hdDao.getAlls();

        model.addAttribute("hoadon", list);

        return "admin/hoadon/listHoaDonDXL";} else {
            session.removeAttribute("user");
            return "admin/login";
        }
    }
    @RequestMapping(value = "listHuyDon", method = RequestMethod.GET)
    public String listHuyDon(Model model,HttpSession session) {
        if (c.check(session)) {
        List<HoaDonJoin> list = hdDao.getHoadonDaHuy();

        model.addAttribute("hoadon", list);

        return "admin/hoadon/listDonDaHuy";} else {
            session.removeAttribute("user");
            return "admin/login";
        }
    }
    @RequestMapping(value = "lisDonDaDuyet", method = RequestMethod.GET)
    public String lisDonDaDuyet(Model model,HttpSession session) {
        if (c.check(session)) {List<HoaDonJoin> list = hdDao.getHoadonDaDuyet();

        model.addAttribute("hoadon", list);

        return "admin/hoadon/listDonDaDuyet";} else {
            session.removeAttribute("user");
            return "admin/login";
        }
    }
    @RequestMapping(value = "listDonDangGiao", method = RequestMethod.GET)
    public String ListDonDangGiao(Model model,HttpSession session) {
        if (c.check(session)) {List<HoaDonJoin> list= hdDao.getHoadonDangGiao();

        model.addAttribute("hoadon", list);

        return "admin/hoadon/listDonDangGiao";} else {
            session.removeAttribute("user");
            return "admin/login";
        }
    }
    @RequestMapping(value = "listDonDaGiao", method = RequestMethod.GET)
    public String ListDonDaGiao(Model model,HttpSession session) {
        if (c.check(session)) {List<HoaDonJoin> list = hdDao.getHoadonDaGiao();

        model.addAttribute("hoadon", list);

        return "admin/hoadon/listDonDaGiaoThanhCong";} else {
            session.removeAttribute("user");
            return "admin/login";
        }
    }

    @RequestMapping(value = "/updatetintrang")
    @ResponseBody
    public Boolean updatetintrang(@RequestParam int maHoaDon, @RequestParam int tinhTrang, ModelMap mm, HttpSession session
    ) {
boolean result=false;
       
        if (tinhTrang == 0) {
            result = hdDao.updatestatus(maHoaDon, 0);
        } else if (tinhTrang == 1) {
           result = hdDao.updatestatus(maHoaDon, 2);
        } else if (tinhTrang == 2) {
           result = hdDao.updatestatus(maHoaDon, 3);
        } else if (tinhTrang == 3) {
            result = hdDao.updatestatus(maHoaDon, 4);
        }
       

        return result;
        

    }
    @RequestMapping(value = "HoaDonDetail", method = RequestMethod.GET)
    public String HoaDonDetail(Model model, int maHoaDon, HttpSession session) {
        if (c.check(session)) {
            List<ChiTietHoaDonJoin> hoaDon=hdDao.detail(maHoaDon);
          
        model.addAttribute("ha",hoaDon);

        return "admin/hoadon/DetailHoaDon";
        } else {
            session.removeAttribute("user");
            return "admin/login";
        }
    }

}
