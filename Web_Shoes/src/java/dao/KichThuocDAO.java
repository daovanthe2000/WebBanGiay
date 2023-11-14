/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dao.HibernateUtil;
import entities.ChiTietSize;
import entities.SizeSan;
import entities.SizeSanPham;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Admin
 */
public class KichThuocDAO {

    Session ss = null;

    public KichThuocDAO() {
    }

    public List<SizeSanPham> getAlls() {
        ss = HibernateUtil.getSessionFactory().openSession();
        Query q = ss.createQuery("from SizeSanPham");
        List<SizeSanPham> kt = q.list();
        ss.close();
        return kt;
    }
    public List<SizeSanPham> getAllss() {

        List<SizeSanPham> product = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
        SQLQuery q = session.createSQLQuery("SELECT * from SizeSanPham");
        product=q.addEntity(SizeSanPham.class).list();
            transaction.commit();
        } catch (Exception e) {
            product = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return product;
    }
public List<SizeSan> getAll1s(int maSanPham,int maMau) {
//        ss = HibernateUtil.getSessionFactory().openSession();
//        SQLQuery q = ss.createSQLQuery("SELECT DISTINCT MaMau  FROM ChiTietSanPham where maSanPham=:maSanPham");
//        List<ChiTietSp> ms = q.addEntity(ChiTietSp.class).setParameter("maSanPham", maSanPham).list();
//        ss.close();
//        return ms;
    
        List<SizeSan> product = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            SQLQuery q = session.createSQLQuery("Select * from SizeSanPham where maSize NOT IN (SELECT DISTINCT MaSize  FROM ChiTietSanPham where maSanPham=:maSanPham and maMau=:maMau)");
      product=q.addEntity(SizeSan.class).setParameter("maSanPham", maSanPham).setParameter("maMau", maMau).list();
            transaction.commit();
        } catch (Exception e) {
            product = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
      
        return product;
    }

    public SizeSanPham getById(int maSize) {
        ss = HibernateUtil.getSessionFactory().openSession();
        return (SizeSanPham) ss.get(SizeSanPham.class, maSize);
    }
 public SizeSanPham getByIdSize(int maSize) {
        SizeSanPham product = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            product = (SizeSanPham) session
                    .createQuery("from SizeSanPham where maSize=:maSize").setParameter("maSize", maSize).uniqueResult();
            transaction.commit();
        } catch (Exception e) {
            product = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return product;
    }
    public void Insert(SizeSanPham sp) {
        ss = HibernateUtil.getSessionFactory().openSession();
        ss.getTransaction().begin();
        ss.save(sp);
        ss.getTransaction().commit();
    }

    public void Update(SizeSanPham s) {
        ss = HibernateUtil.getSessionFactory().openSession();
        ss.getTransaction().begin();
        ss.update(s);
        ss.getTransaction().commit();
    }

    public boolean delete(int maSize) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            SQLQuery query = session.createSQLQuery("DELETE FROM SizeSanPham WHERE maSize = :maSize");
            query.setParameter("maSize", maSize);

            query.executeUpdate();
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return false;

    }

}
