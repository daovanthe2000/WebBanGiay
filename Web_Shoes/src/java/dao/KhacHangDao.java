/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.KhachHang;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;

/**
 *
 * @author DELL
 */
public class KhacHangDao {
    Session ss;

    public KhacHangDao() {
    }

    public boolean loginStudent(String tenDangNhap, String password) {

        ss = HibernateUtil.getSessionFactory().openSession();
        boolean userFound = false;

        Query query = ss.createQuery("from KhachHang n where n.tenDangNhap =? and n.matKhau = ?");
        query.setParameter(0, tenDangNhap);
        query.setParameter(1, password);
        List<KhachHang> list = query.list();
        if ((list != null) && (list.size() > 0)) {

            userFound = true;
        }

        ss.close();
        return userFound;

    }

    public KhachHang checkName(String nhan) {
        ss = HibernateUtil.getSessionFactory().openSession();
        try {

            List<KhachHang> users = new ArrayList<KhachHang>();
            users = ss.createQuery("from KhachHang n where n.tenDangNhap =?")
                    .setParameter(0, nhan).list();
            if (users.size() > 0) {
                return users.get(0);
            }
        } catch (HibernateException e) {
            e.printStackTrace();
        }finally{
            ss.close();
        }
        return null;
    }
    public boolean updatestatus(int maKhachHang, boolean status) {
        ss = HibernateUtil.getSessionFactory().openSession();
        SQLQuery q = ss.createSQLQuery("UPDATE KhachHang SET status = :status where maKhachHang=:maKhachHang");
        q.setParameter("status", status);
        q.setParameter("maKhachHang", maKhachHang);
        ss.getTransaction().begin();
        q.executeUpdate();
        ss.getTransaction().commit();
        ss.close();
        return true;

    }
    public boolean checkNametontai(String nhan) {

        ss = HibernateUtil.getSessionFactory().openSession();
        boolean userFound = false;

        Query query = ss.createQuery("from KhachHang n where n.tenDangNhap =?");
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

        Query query = ss.createQuery("from KhachHang n where n.soDT =?");
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

        Query query = ss.createQuery("from KhachHang n where n.email =?");
        query.setParameter(0, email);
       
        List list = query.list();
        if ((list != null) && (list.size() > 0)) {

            userFound = true;
        }

        ss.close();
        return userFound;
   
      
    }
public List<KhachHang> getAlls() {
         ss = HibernateUtil.getSessionFactory().openSession();
        Query q = ss.createQuery("from KhachHang");
        List<KhachHang> dm = q.list();
        ss.close();
        return dm;
    }
     public boolean insertHoaDon(String hoTen,String diaChi,String gioiTinh,String cmnd,String soDT, String email, String tenDangNhap,String matKhau,boolean status) {
        ss = HibernateUtil.getSessionFactory().openSession();
        SQLQuery query = ss.createSQLQuery("insert KhachHang VALUES(:hoTen,:diaChi,:gioiTinh,:cmnd,:soDT,:email,:tenDangNhap,:matKhau,:status) ");
        query.setParameter("hoTen", hoTen);
       
        query.setParameter("diaChi", diaChi);
         query.setParameter("gioiTinh", gioiTinh);
         query.setParameter("cmnd", cmnd);
          query.setParameter("soDT", soDT);

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
}
