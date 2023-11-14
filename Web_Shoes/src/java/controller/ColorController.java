/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.MauSacDAO;
import entities.MauSanPham;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author Admin
 */
@Controller
@RequestMapping(value = "admin/color")
public class ColorController {

    MauSacDAO ms = null;
    private checkUrl c;

    public ColorController() {
        ms = new MauSacDAO();
        c = new checkUrl();
    }

    @RequestMapping(value = "listColor", method = RequestMethod.GET)
    public String colorView(Model model, HttpSession session) {
        if (c.checkadminnhanvien(session)) {
            model.addAttribute("ms", ms.getAlls());
            return "admin/color/listColor";
        } else {
            session.removeAttribute("user");
            return "admin/login";
        }
    }

    @RequestMapping(value = "/saveColor", method = RequestMethod.POST)
    public String saveColor(Model model, HttpSession session, MauSanPham msp) {

        if (c.checkadminnhanvien(session)) {
            if (msp.getMaMau() == 0) {
                ms.Insert(msp);
            } else {
                ms.Update(msp);
            }
            return "redirect:listColor";
        } else {
            session.removeAttribute("user");
            return "admin/login";
        }
    }
    @RequestMapping(value = "/delete")
        @ResponseBody
        public Boolean delete
        (@RequestParam
        int maMau
        
            ) {

        if (ms.delete(maMau)) {
                return true;
            } else {
                return false;
            }

        }
}
