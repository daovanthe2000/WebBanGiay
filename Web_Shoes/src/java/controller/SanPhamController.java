/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import com.sun.jersey.api.client.Client;

import dao.ChiTietSanPhamDAO;
import dao.DanhMucDAO;

import dao.KichThuocDAO;
import dao.MauSacDAO;
import dao.NhanhangDao;
import dao.SanPhamDao;

import entities.ChiTietSanPham;

import entities.DanhMucSanPham;

import entities.MauSanPham;
import entities.NhanHang;
import entities.SanPham;

import entities.SizeSanPham;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.FilenameUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author PC
 */
@Controller
@RequestMapping(value = "admin/sanpham")
public class SanPhamController {

    SanPhamDao spd = null;
    NhanhangDao nhd = null;
    DanhMucDAO dmd = null;

    MauSacDAO ms = null;
    KichThuocDAO ktd = null;
    ChiTietSanPhamDAO ctspd = null;

    private checkUrl c;

    public SanPhamController() {
        spd = new SanPhamDao();
        nhd = new NhanhangDao();
        dmd = new DanhMucDAO();

        ms = new MauSacDAO();
        ktd = new KichThuocDAO();
        ctspd = new ChiTietSanPhamDAO();

        c = new checkUrl();
    }

    @RequestMapping(value = "listSanPham", method = RequestMethod.GET)
    public String sanPhamView(Model model, HttpSession session) {

        if (c.checkadminnhanvien(session)) {
            List<SanPham> lsp = spd.getAllss();
            //chuyển ra view
            model.addAttribute("sanPhams", lsp);
            return "admin/sanpham/listSanPham";
        } else {
            session.removeAttribute("user");
            return "admin/login";
        }
    }

    @RequestMapping(value = "insertSanPham", method = RequestMethod.GET)
    public String index(Model model, HttpSession session) {
        if (c.checkadminnhanvien(session)) {
            List<NhanHang> lnhanHang = nhd.getAlls();
            List<DanhMucSanPham> ldanhmuc = dmd.getAlls();

            List<MauSanPham> msp = ms.getAlls();
            List<SizeSanPham> sizesp = ktd.getAlls();
            //chuyển ra view
            model.addAttribute("danhMucs", ldanhmuc);
            model.addAttribute("nhanHangs", lnhanHang);

            model.addAttribute("mauSanPhams", msp);
            model.addAttribute("sizeSanPhams", sizesp);
            return "admin/sanpham/insertSanPham";
        } else {
            session.removeAttribute("user");
            return "admin/login";
        }
    }


    @RequestMapping(value = "/saveProduct", method = RequestMethod.POST)
    public String saveProduct(Model model, HttpSession session, String tenSanPham, int maDanhMuc, int maNhanHang, String moTa, Integer idChiTietSP, String[] mauSanPham, String[] sizeSanPham, String mota) {
        if (c.checkadminnhanvien(session)) {
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
            Date date = new Date();
            String strDate = formatter.format(date);
            //Lấy MaSanPhamMoi
            int maSanPham = spd.getSPMoi();

            maSanPham = maSanPham + 1;
            SanPham sp = new SanPham();
            // Tạo SanPham
            sp.setMaSanPham(maSanPham);
            sp.setTenSanPham(tenSanPham);
            DanhMucSanPham anh = new DanhMucSanPham();
            anh.setMaDanhMuc(maDanhMuc);
            sp.setMaDanhMuc(anh);
            NhanHang nh = new NhanHang();
            nh.setMaNhanHang(maNhanHang);
            sp.setMaNhanHang(nh);

            sp.setMoTa(moTa);

            spd.Insert(sp);

            if (mauSanPham.length != 1) {
                for (int i = 1; i < mauSanPham.length; i++) {//tăng i = 1 vì phải thêm để Chống lỗi null của array
                    //Tạo khóa chính ChiTietSanPhamPK
                    MauSanPham mauspp = new MauSanPham();
                    mauspp.setMaMau(Integer.parseInt(mauSanPham[i]));
                    if (sizeSanPham.length != 1) {
                        for (int j = 1; j < sizeSanPham.length; j++) {

                            ChiTietSanPham cp = new ChiTietSanPham();
                            cp.setIdChiTietSP(idChiTietSP);

                            cp.setMaSanPham(sp);

                            SizeSanPham szp = new SizeSanPham();
                            szp.setMaSize(Integer.parseInt(sizeSanPham[j]));
                            cp.setMaSize(szp);

                            cp.setMaMau(mauspp);
                            cp.setGiaTien(0.0);
                            cp.setSoLuong(0);
                            cp.setStatus(false);
                            cp.setNgayTao(strDate);
                            ctspd.Insert(cp);
                        }
                    }
                }
            }

            return "redirect:/admin/sanpham/listSanPham";
        } else {
            session.removeAttribute("user");
            return "admin/login";
        }
    }


    @RequestMapping(value = "/updateProduct", method = RequestMethod.POST)
    public String updateProduct(Model model,HttpSession session, int maSanPham,String tenSanPham,int maDanhMuc,int maNhanHang,String moTa) {
        if (c.checkadminnhanvien(session)) {
            SanPham sp=new SanPham();
            sp.setMaSanPham(maSanPham);
            sp.setTenSanPham(tenSanPham);
            DanhMucSanPham anh = new DanhMucSanPham();
            anh.setMaDanhMuc(maDanhMuc);
            sp.setMaDanhMuc(anh);
            NhanHang nh = new NhanHang();
            nh.setMaNhanHang(maNhanHang);
            sp.setMaNhanHang(nh);
            sp.setMoTa(moTa);
            spd.Update(sp);
        
        return "redirect:/admin/sanpham/listSanPham";
        } else {
            session.removeAttribute("user");
            return "admin/login";
        }
    }
    
     @RequestMapping(value = "/SuaSanPham", method = RequestMethod.GET)
    public String SuaSanPham(Model model,@RequestParam int maSanPham, HttpSession session) {
        if (c.checkadminnhanvien(session)) {
            List<NhanHang> nhanHang = nhd.getAlls();
            List<DanhMucSanPham> danhmuc = dmd.getAlls();
           
            SanPham sp=spd.getByIdSp(maSanPham);
            
            //chuyển ra view
            model.addAttribute("sp", sp);
            model.addAttribute("danhMucs", danhmuc);
            model.addAttribute("nhanHangs", nhanHang);

            
            return "admin/sanpham/updateSanPham";
        } else {
            session.removeAttribute("user");
            return "admin/login";
        }
    }
        @RequestMapping(value = "/checkname")
    @ResponseBody
    public Boolean checkname(@RequestParam String name,  HttpSession session
    ) {

        Boolean result = spd.checkNametontai(name);

        
        return result;

    }
    @RequestMapping(value = "/delete")
        @ResponseBody
        public Boolean delete
        (@RequestParam
        int maSanPham
        
            ) {

        if (spd.delete(maSanPham)) {
                return true;
            } else {
                return false;
            }

        }
}
