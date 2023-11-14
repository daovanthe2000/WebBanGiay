/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author DELL
 */
import dao.BannerDAO;
import dao.ChiTietSanPhamDAO;
import dao.DanhMucDAO;
import dao.HoaDonDao;
import dao.KhacHangDao;
import dao.KichThuocDAO;
import dao.MauSacDAO;
import dao.NhanhangDao;
import dao.NhanvienDao;
import dao.SanPhamDao;

import entities.Banner;
import entities.ChiTietHoaDon;
import entities.ChiTietHoaDonPK;
import entities.ChiTietSPJoin;
import entities.ChiTietSanPham;
import entities.ChiTietSanPhanJoin;
import entities.DanhMucSanPham;
import entities.GioHang;
import entities.HoaDon;
import entities.KhachHang;
import entities.MauSanPham;
import entities.NhanHang;
import entities.NhanVien;
import entities.SanPham;
import entities.SizeSanPham;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import unit.XuLyTien;

@Controller
public class FrontEndController {

    DanhMucDAO dmuc = null;
    SanPhamDao spdao = null;
    MauSacDAO mdao = null;
    KichThuocDAO kdao = null;
    HoaDonDao hdao = null;
    BannerDAO bndao;
    KhacHangDao khdao=null;

    ChiTietSanPhamDAO ct = null;
    private NhanvienDao nhanviendao;
    NhanhangDao nhan = null;

    public FrontEndController() {
        khdao=new KhacHangDao();
        dmuc = new DanhMucDAO();
        spdao = new SanPhamDao();
        mdao = new MauSacDAO();
        kdao = new KichThuocDAO();
        hdao = new HoaDonDao();
        bndao = new BannerDAO();
        nhanviendao = new NhanvienDao();
        nhan = new NhanhangDao();
        ct = new ChiTietSanPhamDAO();

    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(Model model, HttpSession session) {
        session.setAttribute("danhmuc", dmuc.getAlls());
        List<NhanHang> list = nhan.getAlls();

        List<SanPham> spall = spdao.getSanPham();
        List<SanPham> oderby = spdao.oderById(20);
        for (SanPham spall1 : spall) {
            if (spall1.getKhuyenMaiCollection().size() > 0) {
                model.addAttribute("sa", spall1);
                break;
            }
        }
        List<Banner> banners = bndao.getAlls();

        model.addAttribute("banners", banners);
        model.addAttribute("spoderby", oderby);
        model.addAttribute("nhan", list);
        model.addAttribute("spall", spall);
        int soluong = 0;
        if (null != session.getAttribute("giohang")) {
            List<GioHang> gioHangs = (List<GioHang>) session.getAttribute("giohang");
            for (GioHang gioHang : gioHangs) {
                soluong += gioHang.getSoluong();
            }
        }
        model.addAttribute("soluong", soluong);
        return "frontend/index";
    }

    @RequestMapping(value = "DanhMuc", method = RequestMethod.GET)
    public String DanhMuc(Model model, DanhMucSanPham maDanhMuc, HttpSession session, HttpServletRequest request) {
        List<SanPham> danhmuc = spdao.getDanhMuc(maDanhMuc);
        List<SanPham> oderby = spdao.oderById(20);
        int page, numberPage = 9;
        int size = danhmuc.size();
        int num = (size % 9 == 0 ? (size / 9) : (size / 9)) + 1;

        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }

        int start, end;
        start = (page - 1) * numberPage;
        end = Math.min(page * numberPage, size);

        List<SanPham> list = spdao.getListByPage(danhmuc, start, end);

        model.addAttribute("num", num);
        model.addAttribute("page", page);
        int soluong = 0;
        if (null != session.getAttribute("giohang")) {
            List<GioHang> gioHangs = (List<GioHang>) session.getAttribute("giohang");
            for (GioHang gioHang : gioHangs) {
                soluong += gioHang.getSoluong();
            }
        }

        model.addAttribute("dm", maDanhMuc);
        model.addAttribute("danhmuc", dmuc.getAlls());
        model.addAttribute("mau", mdao.getAlls());
        model.addAttribute("size", kdao.getAlls());
        model.addAttribute("nhan", nhan.getAlls());
        model.addAttribute("spoderby", oderby);
        model.addAttribute("soluong", soluong);
        model.addAttribute("sanpham", list);
        return "frontend/product";
    }

    @RequestMapping(value = "Product", method = RequestMethod.GET)
    public String Product(Model model, HttpSession session, HttpServletRequest request) {
        List<SanPham> danhmuc = spdao.getAlls();
        List<SanPham> oderby = spdao.oderById(20);

        int page, numberPage = 9;
        int size = danhmuc.size();
        int num = (size % 9 == 0 ? (size / 9) : (size / 9)) + 1;

        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }

        int start, end;
        start = (page - 1) * numberPage;
        end = Math.min(page * numberPage, size);

        List<SanPham> list = spdao.getListByPage(danhmuc, start, end);

        model.addAttribute("num", num);
        int soluong = 0;
        if (null != session.getAttribute("giohang")) {
            List<GioHang> gioHangs = (List<GioHang>) session.getAttribute("giohang");
            for (GioHang gioHang : gioHangs) {
                soluong += gioHang.getSoluong();
            }
        }
        model.addAttribute("danhmuc", dmuc.getAlls());
        model.addAttribute("mau", mdao.getAlls());
        model.addAttribute("size", kdao.getAlls());
        model.addAttribute("nhan", nhan.getAlls());
        model.addAttribute("soluong", soluong);
        model.addAttribute("sanpham", list);
        model.addAttribute("spoderby", oderby);
        model.addAttribute("page", page);
        return "frontend/product";
    }

    @RequestMapping(value = "producta", method = RequestMethod.GET)
    public String Producta(
            Model model, HttpSession session,
            @RequestParam(value = "nhanhangs", required = false) List<String> nhanhangs,
            @RequestParam(value = "danhmucs", required = false) List<String> danhmucs,
            @RequestParam(value = "maus", required = false) List<String> maus,
            @RequestParam(value = "sizes", required = false) List<String> sizes,
            @RequestParam(value = "pages", required = false) int pages,
            @RequestParam(value = "giamin", required = false) int giamin,
            @RequestParam(value = "giamax", required = false) int giamax,
            @RequestParam(value = "loaiSapXep", required = false) int loaiSapXep) {
        List<SanPham> oderby = spdao.oderById(20);
        List<SanPham> sanpham = null;
       
        
         if (nhanhangs == null && danhmucs != null && maus == null && sizes == null) {
                
                sanpham = spdao.filterproductdanhmuc(danhmucs, giamin, giamax);
            } else if (nhanhangs != null && danhmucs == null && maus == null && sizes == null) {
                sanpham = spdao.filterproduct(nhanhangs, giamin, giamax);
            }
            if (nhanhangs != null && danhmucs != null && maus == null && sizes == null) {
                
                sanpham = spdao.filterproductdanhmucnah(nhanhangs,danhmucs, giamin, giamax);
                
            } else if (nhanhangs != null && danhmucs == null && maus != null && sizes == null) {
                sanpham = spdao.filterproductnhanmau(nhanhangs,maus, giamin, giamax);
            } else if (nhanhangs != null && danhmucs == null && maus == null && sizes != null) {
                sanpham = spdao.filterproductnhansize(nhanhangs,sizes, giamin, giamax);
            } else if (nhanhangs != null && danhmucs == null && maus != null && sizes != null) {
                sanpham = spdao.filterproductnhansizemau(nhanhangs,sizes,maus, giamin, giamax);
            }  else if (nhanhangs == null && danhmucs != null && maus != null && sizes == null) {
                sanpham = spdao.filterproductdanhmucmau(danhmucs,maus, giamin, giamax);
            } else if (nhanhangs == null && danhmucs != null && maus == null && sizes != null) {
                sanpham = spdao.filterproductdanhmucsize(danhmucs,sizes, giamin, giamax);
            } else if (nhanhangs == null && danhmucs != null && maus != null && sizes != null) {
                sanpham = spdao.filterproductdanhmucsizemau(danhmucs,sizes,maus, giamin, giamax);
            } else if (nhanhangs == null && danhmucs == null && maus == null && sizes != null) {
                sanpham = spdao.filterproductsize(sizes, giamin, giamax);
            }else if (nhanhangs == null && danhmucs == null && maus != null && sizes == null) {
                sanpham = spdao.filterproducmau(maus, giamin, giamax);
            } else if (nhanhangs == null && danhmucs == null && maus != null && sizes != null) {
                sanpham = spdao.filterproducmausize(sizes,maus, giamin, giamax);
            } else if (nhanhangs != null && danhmucs != null && maus != null && sizes != null){
                
                sanpham = spdao.filterproductnhansizemaus(nhanhangs, danhmucs, sizes, maus, giamin, giamax);
            }else if (nhanhangs != null && danhmucs != null && maus != null && sizes == null) {
                
                sanpham = spdao.filterproductdanhmucnahs(nhanhangs,danhmucs,maus, giamin, giamax);
                
            }else if (nhanhangs != null && danhmucs != null && maus == null && sizes != null) {
                
                sanpham = spdao.filterproductdanhmucnhannuze(nhanhangs,danhmucs,sizes, giamin, giamax);
                
            }else if (nhanhangs == null && danhmucs == null && maus == null && sizes == null) {
            sanpham = spdao.getAlls();
               
            
        }
            

       
        
       
        
        if(!sanpham.isEmpty()){
             int page, numberPage = 9;
        int size = sanpham.size();
        
        int num = size / 9;
        if (size % 9 != 0) {
            num++;
        }

        page = pages;

        int start, end;
        start = (page - 1) * numberPage;
        end = Math.min(page * numberPage, size);
        
        List<SanPham> list = spdao.getListByPage(sanpham, start, end);

        model.addAttribute("num", num);
        model.addAttribute("page", page);
        if (loaiSapXep == 0) {
            model.addAttribute("sanpham", list);
            
        } else if (loaiSapXep == 1) {
            Collections.sort(list, new Comparator<SanPham>() {

                @Override
                public int compare(SanPham o1, SanPham o2) {
                    return o1.getTenSanPham().compareTo(o2.getTenSanPham());
                }
            });
            model.addAttribute("sanpham", list);
        } else if (loaiSapXep == 2) {
            Collections.sort(list, new Comparator<SanPham>() {

                @Override
                public int compare(SanPham o1, SanPham o2) {
                    return o2.getTenSanPham().compareTo(o1.getTenSanPham());
                }
            });
            model.addAttribute("sanpham", list);
        } else if (loaiSapXep == 3) {
            Collections.sort(list, new Comparator<SanPham>() {

                @Override
                public int compare(SanPham o1, SanPham o2) {
                    return (int) (o1.tinhtien() - o2.tinhtien());
                }
            });
            model.addAttribute("sanpham", list);
        } else if (loaiSapXep == 4) {
            Collections.sort(list, new Comparator<SanPham>() {

                @Override
                public int compare(SanPham o1, SanPham o2) {
                    return (int) (o2.tinhtien() - o2.tinhtien());
                }
            });
            model.addAttribute("sanpham", list);
        }
        }else{
           
            model.addAttribute("sanpham", sanpham);
             
        }
        

        model.addAttribute("danhmuc", dmuc.getAllss());
        model.addAttribute("mau", mdao.getAllss());
        model.addAttribute("size", kdao.getAllss());
        model.addAttribute("nhan", nhan.getAllss());
        model.addAttribute("spoderby", oderby);
        return "frontend/productfilter";
    }

    @RequestMapping(value = "search", method = RequestMethod.GET)
    public String search(Model model, String name, HttpServletRequest request, HttpSession session) {
        List<SanPham> search = spdao.search(name);
        List<SanPham> oderby = spdao.oderById(20);
        int page, numberPage = 9;
        int size = search.size();
        int num = (size % 9 == 0 ? (size / 9) : (size / 9)) + 1;

        String xpage = request.getParameter("page");
        if (xpage == null) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }

        int start, end;
        start = (page - 1) * numberPage;
        end = Math.min(page * numberPage, size);

        List<SanPham> list = spdao.getListByPage(search, start, end);
        int soluong = 0;
        if (null != session.getAttribute("giohang")) {
            List<GioHang> gioHangs = (List<GioHang>) session.getAttribute("giohang");
            for (GioHang gioHang : gioHangs) {
                soluong += gioHang.getSoluong();
            }
        }
        model.addAttribute("danhmuc", dmuc.getAlls());
        model.addAttribute("mau", mdao.getAlls());
        model.addAttribute("size", kdao.getAlls());
        model.addAttribute("nhan", nhan.getAlls());
        model.addAttribute("spoderby", oderby);
        model.addAttribute("soluong", soluong);
        return "frontend/product";
    }

    @RequestMapping(value = "SanPhamDetail", method = RequestMethod.GET)
    public String SanPhamDetail(Model model, int maSanPham, int maMau, DanhMucSanPham maDanhMuc, HttpSession session) {
        SanPham sanpham = spdao.getByIdSp(maSanPham);
        List<ChiTietSPJoin> lctsp = ct.getByIdChiTietSpMau(maSanPham, maMau);
        List<SanPham> sanphamlq = spdao.SanPhamLienQuan(maSanPham, maDanhMuc);
        Collections.sort(lctsp, new Comparator<ChiTietSPJoin>() {

            @Override
            public int compare(ChiTietSPJoin o1, ChiTietSPJoin o2) {
                return o1.getSize().compareTo(o2.getSize());
            }

        });
        model.addAttribute("sp", sanphamlq);
        model.addAttribute("lctsp", lctsp);
        for (ChiTietSPJoin ctjoin : lctsp) {
            if (ctjoin.getStatus() == true) {
                model.addAttribute("ctjoin", ctjoin);
                break;
            }
        }

        model.addAttribute("maMau", maMau);
        model.addAttribute("sanpham", sanpham);
        int soluong = 0;
        if (null != session.getAttribute("giohang")) {
            List<GioHang> gioHangs = (List<GioHang>) session.getAttribute("giohang");
            for (GioHang gioHang : gioHangs) {
                soluong += gioHang.getSoluong();
            }
        }

        model.addAttribute("soluong", soluong);
        return "frontend/productDetail";
    }

    @RequestMapping(value = "ThemGioHang")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> ThemGioHang(@RequestParam int idChiTietSP, @RequestParam int quantity, @RequestParam int gia, @RequestParam String anh, HttpSession session) {
        ChiTietSPJoin ctsp = ct.getByIdChiTiet(idChiTietSP);
        Map<String, Object> response = new HashMap<>();
        if (null == session.getAttribute("giohang")) {
            List<GioHang> list = new ArrayList<>();
            GioHang gio = new GioHang();
            gio.setIdChiTietSP(idChiTietSP);
            gio.setMaSanPham(ctsp.getMaSanPham());
            gio.setTenSanPham(ctsp.getTenSanPham());
            gio.setMaMau(ctsp.getMaMau());
            gio.setTenMau(ctsp.getTenMau());
            gio.setSize(ctsp.getSize());
            gio.setMaSize(ctsp.getMaSize());

            gio.setAnh(anh);
            int soluong = 0;

            if (quantity > ctsp.getSoLuong()) {
                response.put("status", false);
                response.put("soluong", soluong);
                response.put("quantity", ctsp.getSoLuong());
                return new ResponseEntity<>(response, HttpStatus.OK);
            }

            gio.setGiaTien(gia);
            gio.setSoluong(quantity);
            list.add(gio);
            int soluong1 = 0;
            for (GioHang gioHang : list) {
                soluong1 += gioHang.getSoluong();
            }
            session.setAttribute("giohang", list);

            response.put("status", true);
            response.put("soluong", soluong1);

            return new ResponseEntity<>(response, HttpStatus.OK);
        } else {
            List<GioHang> lsGioHangs = (List<GioHang>) session.getAttribute("giohang");
            int vitri = kiemtraSanPhamdatontai(lsGioHangs, session, idChiTietSP);

            if (vitri == -1) {
                GioHang gio = new GioHang();
                gio.setIdChiTietSP(idChiTietSP);
                gio.setMaSanPham(ctsp.getMaSanPham());
                gio.setTenSanPham(ctsp.getTenSanPham());
                gio.setMaMau(ctsp.getMaMau());
                gio.setTenMau(ctsp.getTenMau());
                gio.setSize(ctsp.getSize());
                gio.setMaSize(ctsp.getMaSize());

                gio.setAnh(anh);
                gio.setGiaTien(gia);
                gio.setSoluong(quantity);
                int soluong = 0;

                for (GioHang gioHang : lsGioHangs) {
                    soluong += gioHang.getSoluong();
                }
                if (quantity > ctsp.getSoLuong()) {
                    response.put("status", false);
                    response.put("soluong", soluong);
                    response.put("quantity", ctsp.getSoLuong());
                    return new ResponseEntity<>(response, HttpStatus.OK);
                }
                lsGioHangs.add(gio);
            } else {
                int soluongmoi = lsGioHangs.get(vitri).getSoluong() + quantity;
                int soluong = 0;

                for (GioHang gioHang : lsGioHangs) {
                    soluong += gioHang.getSoluong();
                }
                if (soluongmoi > ctsp.getSoLuong()) {
                    response.put("status", false);
                    response.put("soluong", soluong);
                    response.put("quantity", ctsp.getSoLuong());
                    return new ResponseEntity<>(response, HttpStatus.OK);
                }
                lsGioHangs.get(vitri).setSoluong(soluongmoi);
            }
            int soluong = 0;

            for (GioHang gioHang : lsGioHangs) {
                soluong += gioHang.getSoluong();
            }

            response.put("status", true);
            response.put("soluong", soluong);

            return new ResponseEntity<>(response, HttpStatus.OK);
        }

    }

    @RequestMapping(value = "Capnhapsoluonggiam")
    @ResponseBody
    private ResponseEntity<Map<String, Object>> Capnhapsoluonggiam(HttpSession session, @RequestParam int idChiTietSP) {
        ChiTietSPJoin ctsp = ct.getByIdChiTiet(idChiTietSP);
        Map<String, Object> response = new HashMap<>();
        if (null != session.getAttribute("giohang")) {

            List<GioHang> gioHangs = (List<GioHang>) session.getAttribute("giohang");

            int vitri = kiemtraSanPhamdatontai(gioHangs, session, idChiTietSP);
            int soluongmoi = gioHangs.get(vitri).getSoluong() - 1;
            int soluong = 0;

            for (GioHang gioHang : gioHangs) {
                soluong += gioHang.getSoluong();
            }
            if (soluongmoi > ctsp.getSoLuong()) {
                response.put("status", false);
                response.put("soluong", soluong);

                response.put("quantity", ctsp.getSoLuong());
                return new ResponseEntity<>(response, HttpStatus.OK);
            }
            gioHangs.get(vitri).setSoluong(soluongmoi);
            int soluong1 = 0;
            for (GioHang gioHang : gioHangs) {
                soluong1 += gioHang.getSoluong();
            }
            response.put("status", true);
            response.put("soluong", soluong1);

            return new ResponseEntity<>(response, HttpStatus.OK);
        } else {

            List<GioHang> gioHangs = (List<GioHang>) session.getAttribute("giohang");
            int soluong = 0;
            for (GioHang gioHang : gioHangs) {
                soluong += gioHang.getSoluong();
            }
            response.put("status", true);
            response.put("soluong", soluong);

            return new ResponseEntity<>(response, HttpStatus.OK);
        }

    }

    @RequestMapping(value = "Capnhapsoluongtang")
    @ResponseBody
    private ResponseEntity<Map<String, Object>> Capnhapsoluongtang(HttpSession session, @RequestParam int idChiTietSP) {
        Map<String, Object> response = new HashMap<>();
        ChiTietSPJoin ctsp = ct.getByIdChiTiet(idChiTietSP);
        if (null != session.getAttribute("giohang")) {
            List<GioHang> gioHangs = (List<GioHang>) session.getAttribute("giohang");

            int vitri = kiemtraSanPhamdatontai(gioHangs, session, idChiTietSP);
            int soluongmoi = gioHangs.get(vitri).getSoluong() + 1;
            int soluong = 0;
            int so = 0;
            String gia = "";
            for (GioHang gioHang : gioHangs) {
                soluong += gioHang.getSoluong();
                if (gioHang.getIdChiTietSP() == idChiTietSP) {
                    gia = gioHang.getTinhTongtien();
                    so = gioHang.getSoluong();
                }
            }

            if (soluongmoi > ctsp.getSoLuong()) {
                response.put("status", false);
                response.put("soluong", soluong);
                response.put("gia", gia);
                response.put("so", so);
                response.put("chitiet", ctsp.getIdChiTietSP());
                response.put("quantity", ctsp.getSoLuong());
                return new ResponseEntity<>(response, HttpStatus.OK);
            }
            gioHangs.get(vitri).setSoluong(soluongmoi);
            int soluong1 = 0;
            for (GioHang gioHang : gioHangs) {
                soluong1 += gioHang.getSoluong();
            }
            response.put("status", true);
            response.put("soluong", soluong1);

            return new ResponseEntity<>(response, HttpStatus.OK);
        } else {

            List<GioHang> gioHangs = (List<GioHang>) session.getAttribute("giohang");
            int soluong = 0;
            for (GioHang gioHang : gioHangs) {
                soluong += gioHang.getSoluong();
            }
            response.put("status", true);
            response.put("soluong", soluong);

            return new ResponseEntity<>(response, HttpStatus.OK);
        }
    }

    @RequestMapping(value = "Capnhapsoluong")
    @ResponseBody
    private ResponseEntity<Map<String, Object>> Capnhapsoluong(HttpSession session, @RequestParam int idChiTietSP, @RequestParam int quantity) {
        Map<String, Object> response = new HashMap<>();
        ChiTietSPJoin ctsp = ct.getByIdChiTiet(idChiTietSP);
        if (null != session.getAttribute("giohang")) {
            List<GioHang> gioHangs = (List<GioHang>) session.getAttribute("giohang");

            int vitri = kiemtraSanPhamdatontai(gioHangs, session, idChiTietSP);
            int soluong = 0;
            int so = 0;
            String gia = "";
            for (GioHang gioHang : gioHangs) {
                soluong += gioHang.getSoluong();
                if (gioHang.getIdChiTietSP() == idChiTietSP) {
                    gia = gioHang.getTinhTongtien();
                    so = gioHang.getSoluong();
                }
            }

            if (quantity > ctsp.getSoLuong()) {
                response.put("status", false);
                response.put("soluong", soluong);
                response.put("gia", gia);
                response.put("so", so);
                response.put("chitiet", ctsp.getIdChiTietSP());
                response.put("quantity", ctsp.getSoLuong());
                return new ResponseEntity<>(response, HttpStatus.OK);
            }
            gioHangs.get(vitri).setSoluong(quantity);
            int soluong1 = 0;
            for (GioHang gioHang : gioHangs) {
                soluong1 += gioHang.getSoluong();
            }
            response.put("status", true);
            response.put("soluong", soluong1);

            return new ResponseEntity<>(response, HttpStatus.OK);
        } else {

            List<GioHang> gioHangs = (List<GioHang>) session.getAttribute("giohang");
            int soluong = 0;
            for (GioHang gioHang : gioHangs) {
                soluong += gioHang.getSoluong();
            }
            response.put("status", true);
            response.put("soluong", soluong);

            return new ResponseEntity<>(response, HttpStatus.OK);
        }

    }

    @RequestMapping(value = "xoagiohang")
    @ResponseBody
    private String xoagiohang(HttpSession session, @RequestParam int idChiTietSP) {
        if (null != session.getAttribute("giohang")) {
            List<GioHang> gioHangs = (List<GioHang>) session.getAttribute("giohang");

            int vitri = kiemtraSanPhamdatontai(gioHangs, session, idChiTietSP);

            gioHangs.remove(vitri);
        }
        int soluong = 0;
        List<GioHang> gioHangs = (List<GioHang>) session.getAttribute("giohang");
        for (GioHang gioHang : gioHangs) {
            soluong += gioHang.getSoluong();
        }
        return soluong + "";
    }

    private int kiemtraSanPhamdatontai(List<GioHang> lsGioHangs, HttpSession session, int idChiTietSP) {

        for (int i = 0; i < lsGioHangs.size(); i++) {
            if (lsGioHangs.get(i).getIdChiTietSP() == idChiTietSP) {
                return i;
            }
        }
        return -1;
    }

    @RequestMapping(value = "giohang", method = RequestMethod.GET)
    public String giohang(Model model, HttpSession session) {

        int soluong = 0;
        int tongtien = 0;
        if (null != session.getAttribute("giohang")) {
            List<GioHang> gioHangs = (List<GioHang>) session.getAttribute("giohang");

            for (GioHang gioHang : gioHangs) {
                soluong += gioHang.getSoluong();
                tongtien += gioHang.tinhTongtien();
            }
            session.setAttribute("gioHangs", gioHangs);
        }
        session.setAttribute("soluong", soluong);

        session.setAttribute("tongtien", XuLyTien.dinhDangTien(tongtien));
        return "frontend/cart";
    }

    @RequestMapping(value = "checkout", method = RequestMethod.GET)
    public String checkout(Model model, HttpSession session, ModelMap mm) {
        if (session.getAttribute("accout") != null) {
            int soluong = 0;
            int tongtien = 0;
            if (null != session.getAttribute("giohang")) {
                List<GioHang> gioHangs = (List<GioHang>) session.getAttribute("giohang");
                for (GioHang gioHang : gioHangs) {
                    soluong += gioHang.getSoluong();
                    tongtien += gioHang.tinhTongtien();
                }
                model.addAttribute("gioHangs", gioHangs);

            }
            model.addAttribute("soluong", soluong);

            model.addAttribute("tongtien", XuLyTien.dinhDangTien(tongtien));
            String name = (String) session.getAttribute("accout");

            KhachHang nvien = khdao.checkName(name);
            model.addAttribute("khachhang", nvien);
            return "frontend/checkout";
        } else {
            mm.put("message", "vui lòng đăng nhập để tiếp tục mua hàng");
            return "frontend/login";
        }

    }

    @RequestMapping(value = "/ThemHoaDon", method = RequestMethod.POST)
    public String ThemHoaDon(Integer maHoaDon, String tenKhachHang, String soDT, String diaChiGiaoHang, ModelMap mm, Model model, HttpSession session) throws ParseException {

        HoaDon hoaDon = new HoaDon();

        hoaDon.setMaHoaDon(maHoaDon);
        hoaDon.setTenKhachHang(tenKhachHang);
        hoaDon.setSoDT(soDT);
        hoaDon.setDiaChiGiaoHang(diaChiGiaoHang);
        String date = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
        SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
        Date ngayLap = format.parse(date);
        hoaDon.setNgayLap(ngayLap);
        hoaDon.setTinhTrang(1);
        String name = (String) session.getAttribute("accout");

        KhachHang nvien = khdao.checkName(name);
        int tongtien = 0;
        hoaDon.setMaKhachHang(nvien);
        

        if (null != session.getAttribute("giohang")) {
            List<GioHang> gioHangs = (List<GioHang>) session.getAttribute("giohang");
            for (GioHang gioHang : gioHangs) {
                tongtien += gioHang.tinhTongtien();
                ChiTietSPJoin so = ct.getByIdChiTiet(gioHang.getIdChiTietSP());
                    if (so.getSoLuong() < gioHang.getSoluong()) {
                       mm.put("error", "đặt hàng thất bại do sản phẩm " +gioHang.getTenSanPham()+"-"+gioHang.getSize()+"-"+gioHang.getTenMau()+" chỉ còn lại số lượng là " +so.getSoLuong());
                        return "frontend/cart";
                    }
                
            }
        }
        hoaDon.setTongTien(tongtien);
       
        hdao.insertHoaDon(tenKhachHang,soDT,diaChiGiaoHang,1,ngayLap,tongtien,nvien.getMaKhachHang());
        if (hdao.getIdAnhMoiNhat() > 0) {
            if (null != session.getAttribute("giohang")) {
                List<GioHang> gioHangs = (List<GioHang>) session.getAttribute("giohang");
                for (GioHang gioHang : gioHangs) {

                    ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
                    ChiTietHoaDonPK chiTietHoaDonpk = new ChiTietHoaDonPK();
                    chiTietHoaDonpk.setMaHoaDon(hdao.getIdAnhMoiNhat());
                    
                    chiTietHoaDonpk.setIdChiTietSP(gioHang.getIdChiTietSP());
                    chiTietHoaDon.setChiTietHoaDonPK(chiTietHoaDonpk);
                    chiTietHoaDon.setSoLuong(gioHang.getSoluong());
                    chiTietHoaDon.setGiaTien(gioHang.getGiaTien());
                    chiTietHoaDon.setThanhTien(gioHang.tinhTongtien());
                    ChiTietSPJoin so = ct.getByIdChiTiet(gioHang.getIdChiTietSP());
                    ChiTietSanPham sa=new ChiTietSanPham();
                   
                    int soluong = so.getSoLuong() - gioHang.getSoluong();
                    if (soluong <= 0) {
                        ct.updatesoluong(gioHang.getIdChiTietSP(), soluong, false);
                    } else {
                        ct.updatesoluong(gioHang.getIdChiTietSP(), soluong, true);
                    }
                    
                    hdao.Insertchitiet(chiTietHoaDon);

                }

            }
            session.removeAttribute("gioHangs");
        
        session.removeAttribute("soluong");

        session.removeAttribute("tongtien");
            session.removeAttribute("giohang");
            return "frontend/dathangthanhcong";
        } else {
            if (session.getAttribute("accout") != null) {
                int soluong = 0;
                int tongtien1 = 0;
                if (null != session.getAttribute("giohang")) {
                    List<GioHang> gioHangs = (List<GioHang>) session.getAttribute("giohang");
                    for (GioHang gioHang : gioHangs) {
                        soluong += gioHang.getSoluong();
                        tongtien1 += gioHang.tinhTongtien();
                    }
                    model.addAttribute("gioHangs", gioHangs);

                }
                model.addAttribute("soluong", soluong);

                model.addAttribute("tongtien", XuLyTien.dinhDangTien(tongtien1));

                model.addAttribute("nhanvien", nvien);
                return "frontend/checkout";
            }
            return null;
        }

    }

    @RequestMapping(value = "login")
    public String initBackendLogin() {
        return "frontend/login";
    }

    @RequestMapping(value = "/backendLogin")
    public String loginBackend(String tenDangNhap,String matKhau, ModelMap mm, HttpSession session,HttpServletRequest request
    ) {
        boolean result = false;
        System.out.println(tenDangNhap);
        System.out.println(matKhau);
        result = khdao.loginStudent(tenDangNhap,matKhau);
        System.out.println(result);

        if (result) {
            
            session.setAttribute("accout", tenDangNhap);
            String name = (String) session.getAttribute("accout");

            KhachHang nvien = khdao.checkName(name);
            session.setAttribute("ten", nvien.getHoTen());
            if (nvien.getStatus()==true) {
                            return "redirect:" + request.getHeader("Referer");

            } else {
                mm.put("message", "tài khoản của bạn đã bị khóa");
                return "admin/login";
            }

        } else {
            mm.put("message", "Sai thông tin đăng nhập.");
            return "frontend/login";
        }
    }

    @RequestMapping(value = "/checkname")
    @ResponseBody
    public Boolean checkname(@RequestParam String name, ModelMap mm, HttpSession session
    ) {

        Boolean result = khdao.checkNametontai(name);

        
        return result;

    }
    @RequestMapping(value = "/checksoDT")
    @ResponseBody
    public Boolean checksoDT(@RequestParam String soDT, ModelMap mm, HttpSession session
    ) {

        Boolean result = khdao.checkSoDTtontai(soDT);

        
        return result;

    }
    @RequestMapping(value = "/checkemail")
    @ResponseBody
    public Boolean checkemail(@RequestParam String email, ModelMap mm, HttpSession session
    ) {

        Boolean result = khdao.checkEmailtontai(email);

        
        return result;

    }

    @RequestMapping(value = "/backendSigup", method = RequestMethod.POST)
    public String backendSigup(ModelMap mm, KhachHang khachHang
    ) {
        khachHang.setStatus(true);
        boolean result = khdao.insertHoaDon(khachHang.getHoTen(),khachHang.getDiaChi(),khachHang.getGioiTinh(),khachHang.getCmnd(),khachHang.getSoDT(),khachHang.getEmail(),khachHang.getTenDangNhap(),khachHang.getMatKhau(),true);

        if (result) {
            mm.put("success", "tạo tài khoản thành công");

        } else {
            mm.put("error", "tạo tài khoản thất bại");

        }

        return "frontend/login";
    }

    @RequestMapping(value = "/logoutBackend")
    public String logoutBackend(HttpSession session, ModelMap mm, HttpServletRequest request
    ) {

        if (session.getAttribute("accout") != null || session.getAttribute("ten") != null) {
            session.removeAttribute("accout");
            session.removeAttribute("ten");
        }
        return "redirect:";
    }
}
