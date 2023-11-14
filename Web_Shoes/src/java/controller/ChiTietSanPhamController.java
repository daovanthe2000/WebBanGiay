/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ChiTietSanPhamDAO;
import dao.KichThuocDAO;
import dao.MauSacDAO;
import dao.SanPhamDao;
import entities.ChiTietSPJoin;

import entities.ChiTietSanPham;
import entities.ChiTietSize;
import entities.ChiTietSp;
import entities.HoaDon;
import entities.MauSanPham;
import entities.SanPham;
import entities.SizeSan;

import entities.SizeSanPham;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author PC
 */
@Controller
@RequestMapping(value = "admin/chitietsanpham")
public class ChiTietSanPhamController {

    ChiTietSanPhamDAO ct = null;
    SanPhamDao spd = null;
    MauSacDAO ms = null;

    KichThuocDAO ktd = null;

    private checkUrl c;

    public ChiTietSanPhamController() {
        ct = new ChiTietSanPhamDAO();
        spd = new SanPhamDao();
        ms = new MauSacDAO();

        ktd = new KichThuocDAO();
        c = new checkUrl();
    }

    @RequestMapping(value = "listChiTietSanPham", method = RequestMethod.GET)
    public String colorView(Model model, HttpSession session, int maSanPham) {
        if (c.checkadminnhanvien(session)) {

            List<ChiTietSPJoin> lctsp = ct.getByIdChiTietSpanh(maSanPham);
            model.addAttribute("san", spd.getByIdSp(maSanPham));
            //chuyển ra view
            model.addAttribute("ctsanPhams", lctsp);

            List<Integer> maSize = new ArrayList<>();
            for (SizeSanPham siz : ktd.getAlls()) {

                maSize.add(siz.getMaSize());
            }

            int[] example1 = maSize.stream().mapToInt(i -> i).toArray();

            List<MauSanPham> mauSpp = new ArrayList<>();
            for (MauSanPham mauSpp1 : ms.getAlls()) {

                if (ms.getLayMau(maSanPham, mauSpp1.getMaMau(), example1) == null) {

                    mauSpp.add(mauSpp1);

                }
            }

            model.addAttribute("mau", mauSpp);
            return "admin/chitietsanpham/listChiTietSanPham";
        } else {
            session.removeAttribute("user");
            return "admin/login";
        }
    }

    @RequestMapping(value = "/laysize", method = RequestMethod.GET)
    @ResponseBody
    public List<SizeSan> SuaSanPham(@RequestParam int sanpham, @RequestParam int mau) {

//        List<Integer> maSize = new ArrayList<>();
//        for (ChiTietSize siz : ktd.getSizes(sanpham, mau)) {
//
//            maSize.add(siz.getMaSize());
//        }
//        
//        int[] example1 = maSize.stream().mapToInt(i -> i).toArray();
        List<SizeSan> size = ktd.getAll1s(sanpham, mau);

        return size;

    }

    @RequestMapping(value = "/laysizea", method = RequestMethod.GET)
    @ResponseBody
    public List<ChiTietSPJoin> SuaSanPhama(@RequestParam int sanpham) {

//        List<Integer> maSize = new ArrayList<>();
//        for (ChiTietSize siz : ktd.getSizes(sanpham, mau)) {
//
//            maSize.add(siz.getMaSize());
//        }
//        
//        int[] example1 = maSize.stream().mapToInt(i -> i).toArray();
        List<ChiTietSPJoin> lctsp = ct.getByIdChiTietSpanh(sanpham);

        return lctsp;

    }

    @RequestMapping(value = "/updategia", method = RequestMethod.GET)
    @ResponseBody
    public void updategia(@RequestParam int idChiTietSP, @RequestParam int giatien) {

        ct.updategia(idChiTietSP, giatien);

    }

    @RequestMapping(value = "/updatesoluong", method = RequestMethod.GET)
    @ResponseBody
    public void updatesoluong(@RequestParam int idChiTietSP, @RequestParam int soluong) {
        boolean status = true;
        ct.updatesoluong(idChiTietSP, soluong, status);

    }

    @RequestMapping(value = "/updateanh", method = RequestMethod.POST)
    public String updateanh(int idChiTietSP, MultipartFile anhBannerURL, String anhChinh, HttpSession session, HttpServletRequest request) {
        if (!anhBannerURL.isEmpty()) {
            ChiTietSanPham sp = new ChiTietSanPham();
            try {
                String uploadRootPath = request.getServletContext().getRealPath("/") + "images/";
                File destination = new File(uploadRootPath + "/" + anhBannerURL.getOriginalFilename());
                anhBannerURL.transferTo(destination);
                sp.setAnhChinh(anhBannerURL.getOriginalFilename());

            } catch (IOException | IllegalStateException ex) {
                Logger.getLogger(NhanHangController.class.getName()).log(Level.SEVERE, null, ex);
            }

            ct.updateanh(idChiTietSP, sp.getAnhChinh());
        } else {

            ct.updateanh(idChiTietSP, anhChinh);
        }

        return "redirect:" + request.getHeader("Referer");

    }
@RequestMapping(value = "/updatetintrang")
    @ResponseBody
    public Boolean updatetintrang(@RequestParam int idChitiet,@RequestParam boolean status, ModelMap mm, HttpSession session
    ) {

        
        boolean result = ct.updatestatus(idChitiet,status);

        return result;
        

    }
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Boolean delete(@RequestParam int idchitiet
    ) {

        if (ct.delete(idchitiet)) {
            return true;
        } else {
            return false;
        }

    }

    @RequestMapping(value = "insertChiTietSanPham", method = RequestMethod.POST)
    public String insert(Model model, HttpServletRequest request, int idChiTietSP, int maSanPham, int maMau, String[] maSize, double giaTien, int soLuong, MultipartFile anhBannerURL, HttpSession session) {
        if (c.checkadminnhanvien(session)) {
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            Date date = new Date();
            String strDate = formatter.format(date);

            for (int i = 0; i < maSize.length; i++) {
                ChiTietSanPham cp = new ChiTietSanPham();
                cp.setIdChiTietSP(idChiTietSP);
                SanPham sp = new SanPham();
                sp.setMaSanPham(maSanPham);

                MauSanPham mauspp = new MauSanPham();
                mauspp.setMaMau(maMau);
                cp.setMaSanPham(sp);

                try {
                    String uploadRootPath = request.getServletContext().getRealPath("/") + "images/";
                    File destination = new File(uploadRootPath + "/" + anhBannerURL.getOriginalFilename());
                    anhBannerURL.transferTo(destination);
                    cp.setAnhChinh(anhBannerURL.getOriginalFilename());
                } catch (IOException | IllegalStateException ex) {
                    Logger.getLogger(NhanHangController.class.getName()).log(Level.SEVERE, null, ex);
                }
                SizeSanPham szp = new SizeSanPham();
                szp.setMaSize(Integer.valueOf(maSize[i]));
                cp.setMaSize(szp);

                cp.setMaMau(mauspp);

                cp.setGiaTien(giaTien);
                cp.setSoLuong(soLuong);
                cp.setStatus(true);
                cp.setNgayTao(strDate);
                ct.Insert(cp);
            }

            return "redirect:" + request.getHeader("Referer");
        } else {
            session.removeAttribute("user");
            return "admin/login";
        }
    }

}
