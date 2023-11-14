/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dao.HibernateUtil;
import entities.ChiTietHoaDon;
import entities.ChiTietHoaDonJoin;
import entities.ChiTietHoaDonPK;
import entities.HoaDon;
import entities.HoaDonJoin;
import entities.SanPham;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author DELL
 */
public class HoaDonDao {

    Session ss = null;

    public HoaDonDao() {
//         ss = HibernateUtil.getSessionFactory().openSession();
    }

    public List<HoaDonJoin> getAlls() {
        ss = HibernateUtil.getSessionFactory().openSession();
        SQLQuery q = ss.createSQLQuery("select * from HoaDon where tinhTrang=1");
        List<HoaDonJoin> dm = q.addEntity(HoaDonJoin.class).list();
        ss.close();

        return dm;
    }

    public List<HoaDonJoin> getHoadonDaDuyet() {
        ss = HibernateUtil.getSessionFactory().openSession();
        SQLQuery q = ss.createSQLQuery("select * from HoaDon where tinhTrang=2");
        List<HoaDonJoin> dm = q.addEntity(HoaDonJoin.class).list();
        ss.close();
        return dm;
    }

    public List<HoaDonJoin> getHoadonDangGiao() {
        ss = HibernateUtil.getSessionFactory().openSession();
        SQLQuery q = ss.createSQLQuery("select * from HoaDon where tinhTrang=3");
        List<HoaDonJoin> dm = q.addEntity(HoaDonJoin.class).list();
        ss.close();
        return dm;
    }

    public List<HoaDonJoin> getHoadonDaGiao() {
        ss = HibernateUtil.getSessionFactory().openSession();
        SQLQuery q = ss.createSQLQuery("select * from HoaDon where tinhTrang=4");
        List<HoaDonJoin> dm = q.addEntity(HoaDonJoin.class).list();
        ss.close();
        return dm;
    }

    public List<HoaDonJoin> getHoadonDaHuy() {
        ss = HibernateUtil.getSessionFactory().openSession();
        SQLQuery q = ss.createSQLQuery("select * from HoaDon where tinhTrang=0");
        List<HoaDonJoin> dm = q.addEntity(HoaDonJoin.class).list();
        ss.close();
        return dm;
    }

    public int getMaHoaDon() {
        ss = HibernateUtil.getSessionFactory().openSession();
        SQLQuery query = ss.createSQLQuery("SELECT IDENT_CURRENT('HoaDon')");
        int results = Integer.parseInt(query.uniqueResult().toString());
        ss.close();
        return results;
    }

    public List<ChiTietHoaDonJoin> detail(int maHoaDon) {

        ss = HibernateUtil.getSessionFactory().openSession();
        SQLQuery query = ss.createSQLQuery(
                "Select ch.*, s.TenSanPham as TenSanPham ,m.TenMau as TenMau  ,sz.Size as Size  from ChiTietHoaDOn ch "
                + "INNER JOIN ChiTietSanPham ct ON ch.IdChiTietSP = ct.IdChiTietSP "
                + "INNER JOIN SanPham s ON s.MaSanPham = ct.MaSanPham "
                + "INNER JOIN MauSanPham m ON m.MaMau = ct.MaMau "
                + "INNER JOIN SizeSanPham sz ON sz.MaSize = ct.MaSize "
                + "where ch.MaHoaDon = :maHoaDon ");
        query.addEntity(ChiTietHoaDonJoin.class);
        query.setParameter("maHoaDon", maHoaDon);
        List<ChiTietHoaDonJoin> products = query.list();
        ss.close();
        return products;
    }

    public HoaDon getById(int maHoaDon) {
        ss = HibernateUtil.getSessionFactory().openSession();
        return (HoaDon) ss.get(HoaDon.class, maHoaDon);
    }

    public int getLatestDonHang() {
        ss = HibernateUtil.getSessionFactory().openSession();
        Query q = ss.createQuery("select maHoaDon from HoaDon order by maHoaDon desc");
        int maHoaDon = (int) q.list().get(0);
        ss.close();

        return maHoaDon;
    }

    public int getIdAnhMoiNhat() {
        ss = HibernateUtil.getSessionFactory().openSession();
        SQLQuery query = ss.createSQLQuery("SELECT IDENT_CURRENT('HoaDon')");
        int results = Integer.parseInt(query.uniqueResult().toString());
        ss.close();
        return results;
    }

    public void Insert(HoaDon sp) {
        System.out.println(sp);
        ss = HibernateUtil.getSessionFactory().openSession();
        ss.getTransaction().begin();
        ss.save(sp);
        ss.getTransaction().commit();
        ss.close();
    }

    public void insertHoaDon(String tenKhachHang, String soDT, String diaChiGiaoHang, int tinhTrang, Date ngayLap, int tongTien, int maKhachHang) {
        ss = HibernateUtil.getSessionFactory().openSession();
        SQLQuery query = ss.createSQLQuery("insert HoaDon VALUES(:tenKhachHang,:soDT,:diaChiGiaoHang,:tinhTrang,:ngayLap,:tongTien,:maKhachHang) ");
        query.setParameter("tenKhachHang", tenKhachHang);
        query.setParameter("soDT", soDT);
        query.setParameter("diaChiGiaoHang", diaChiGiaoHang);
        query.setParameter("tinhTrang", tinhTrang);
        query.setParameter("ngayLap", ngayLap);
        query.setParameter("tongTien", tongTien);
        query.setParameter("maKhachHang", maKhachHang);
        ss.getTransaction().begin();
        query.executeUpdate();
        ss.getTransaction().commit();
        ss.close();
    }

    public boolean Insertchitiet(ChiTietHoaDon sp) {
        ss = HibernateUtil.getSessionFactory().openSession();
        ss.getTransaction().begin();
        ChiTietHoaDonPK id = (ChiTietHoaDonPK) ss.save(sp);
        ss.getTransaction().commit();
        ss.close();
        if (null != id) {
            return true;
        } else {
            return false;
        }

    }

    public void Update(HoaDon s) {
        ss = HibernateUtil.getSessionFactory().openSession();
        ss.getTransaction().begin();
        ss.update(s);
        ss.getTransaction().commit();

    }

    public boolean updatestatus(int maHoaDon, int tinhTrang) {
        ss = HibernateUtil.getSessionFactory().openSession();
        SQLQuery q = ss.createSQLQuery("UPDATE HoaDon SET tinhTrang = :tinhTrang where maHoaDon=:maHoaDon");
        q.setParameter("tinhTrang", tinhTrang);
        q.setParameter("maHoaDon", maHoaDon);
        ss.getTransaction().begin();
        q.executeUpdate();
        ss.getTransaction().commit();
        ss.close();
        return true;

    }

    public void Delete(int id) {
        ss = HibernateUtil.getSessionFactory().openSession();
        HoaDon kt = getById(id);
        ss.getTransaction().begin();
        ss.delete(kt);
        ss.getTransaction().commit();
    }
}
