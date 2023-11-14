/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dao.HibernateUtil;
import entities.ChucVu;
import entities.NhanVien;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.NoResultException;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author DELL
 */
public class NhanvienDao {

    Session ss;

    public NhanvienDao() {
    }
    
    public boolean loginStudent(String tenDangNhap, String password) {

        ss = HibernateUtil.getSessionFactory().openSession();
        boolean userFound = false;

        Query query = ss.createQuery("from NhanVien n where n.tenDangNhap =? and n.matKhau = ?");
        query.setParameter(0, tenDangNhap);
        query.setParameter(1, password);
        List<NhanVien> list = query.list();
        if ((list != null) && (list.size() > 0)) {

            userFound = true;
        }

        ss.close();
        return userFound;

    }
    public boolean updatestatus(int maNhanVien, boolean status) {
        ss = HibernateUtil.getSessionFactory().openSession();
        SQLQuery q = ss.createSQLQuery("UPDATE NhanVien SET status = :status where maNhanVien=:maNhanVien");
        q.setParameter("status", status);
        q.setParameter("maNhanVien", maNhanVien);
        ss.getTransaction().begin();
        q.executeUpdate();
        ss.getTransaction().commit();
        ss.close();
        return true;

    }

    public NhanVien checkName(String nhan) {
        ss = HibernateUtil.getSessionFactory().openSession();
        try {

            List<NhanVien> users = new ArrayList<NhanVien>();
            users = ss.createQuery("from NhanVien n where n.tenDangNhap =?")
                    .setParameter(0, nhan).list();
            if (users.size() > 0) {
                return users.get(0);
            }
        } catch (HibernateException e) {
            e.printStackTrace();
        }
        return null;
    }
    public boolean checkNametontai(String nhan) {

        ss = HibernateUtil.getSessionFactory().openSession();
        boolean userFound = false;

        Query query = ss.createQuery("from NhanVien n where n.tenDangNhap =?");
        query.setParameter(0, nhan);
       
        List list = query.list();
        if ((list != null) && (list.size() > 0)) {

            userFound = true;
        }

        ss.close();
        return userFound;
   
      
    }
    public boolean checkSoDTtontai(String soDT) {

        ss = HibernateUtil.getSessionFactory().openSession();
        boolean userFound = false;

        Query query = ss.createQuery("from NhanVien n where n.soDT =?");
        query.setParameter(0, soDT);
       
        List list = query.list();
        if ((list != null) && (list.size() > 0)) {

            userFound = true;
        }

        ss.close();
        return userFound;
   
      
    }
    public boolean checkEmailtontai(String email) {

        ss = HibernateUtil.getSessionFactory().openSession();
        boolean userFound = false;

        Query query = ss.createQuery("from NhanVien n where n.email =?");
        query.setParameter(0, email);
       
        List list = query.list();
        if ((list != null) && (list.size() > 0)) {

            userFound = true;
        }

        ss.close();
        return userFound;
   
      
    }
public List<NhanVien> getAlls() {
         ss = HibernateUtil.getSessionFactory().openSession();
        Query q = ss.createQuery("from NhanVien");
        List<NhanVien> dm = q.list();
        ss.close();
        return dm;
    }
public List<ChucVu> getAllsa() {
         ss = HibernateUtil.getSessionFactory().openSession();
        Query q = ss.createQuery("from ChucVu");
        List<ChucVu> dm = q.list();
        ss.close();
        return dm;
    }
public NhanVien getAllss(int maNhanVien) {
         ss = HibernateUtil.getSessionFactory().openSession();
        Query q = ss.createQuery("from NhanVien where maNhanVien=:maNhanVien");
        NhanVien dm = (NhanVien) q.setParameter("maNhanVien", maNhanVien).uniqueResult();
        ss.close();
        return dm;
    }
public boolean insertHoaDon(String hoTen,String diaChi,String gioiTinh,String cmnd,String soDT, int maChucVu,String email, String tenDangNhap,String matKhau,boolean status) {
        ss = HibernateUtil.getSessionFactory().openSession();
        SQLQuery query = ss.createSQLQuery("insert NhanVien VALUES(:hoTen,:diaChi,:gioiTinh,:cmnd,:soDT,:maChucVu,:email,:tenDangNhap,:matKhau,:status) ");
        query.setParameter("hoTen", hoTen);
       
        query.setParameter("diaChi", diaChi);
         query.setParameter("gioiTinh", gioiTinh);
         query.setParameter("cmnd", cmnd);
          query.setParameter("soDT", soDT);
 query.setParameter("maChucVu", maChucVu);
        query.setParameter("email", email);
        query.setParameter("tenDangNhap", tenDangNhap);
        query.setParameter("matKhau", matKhau);
        query.setParameter("status", status);
        ss.getTransaction().begin();
        query.executeUpdate();
        ss.getTransaction().commit();
        ss.close();
        return true;
    }
    public boolean Insert(NhanVien nhanvien) {
       
        ss = HibernateUtil.getSessionFactory().openSession();
        ss.beginTransaction();
       ChucVu chucVu=new ChucVu();
       chucVu.setMaChucVu(2);
        nhanvien.setMaChucVu(chucVu);
        ss.save(nhanvien);
        ss.getTransaction().commit();
        ss.close();
        return true;
    

//        ss = HibernateUtil.getSessionFactory().openSession();
//        Transaction transaction = null;
//        try {
//            transaction = ss.beginTransaction();
//           nhanvien.setMaChucVu(2);
//            ss.save(nhanvien);
//            transaction.commit();
//            return true;
//        } catch (Exception e) {
//            if (transaction != null) {
//                transaction.rollback();
//            }
//        } finally {
//            ss.close();
//        }
//        return false;
    }

}
