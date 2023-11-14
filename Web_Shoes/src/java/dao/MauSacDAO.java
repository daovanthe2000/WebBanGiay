/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dao.HibernateUtil;
import entities.ChiTietSize;
import entities.ChiTietSp;
import entities.MauSanPham;
import entities.SanPham;
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
public class MauSacDAO {
        Session ss = null;

    public MauSacDAO() {
    }
public List<ChiTietSp> getAll1s(int maSanPham) {
//        ss = HibernateUtil.getSessionFactory().openSession();
//        SQLQuery q = ss.createSQLQuery("SELECT DISTINCT MaMau  FROM ChiTietSanPham where maSanPham=:maSanPham");
//        List<ChiTietSp> ms = q.addEntity(ChiTietSp.class).setParameter("maSanPham", maSanPham).list();
//        ss.close();
//        return ms;
        List<ChiTietSp> product = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
        SQLQuery q = session.createSQLQuery("SELECT DISTINCT MaMau  FROM ChiTietSanPham where maSanPham=:maSanPham");
        product = q.addEntity(ChiTietSp.class).setParameter("maSanPham", maSanPham).list();
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
public ChiTietSp getLayMau(int maSanPham,int maMau,int[] maSize) {

        ChiTietSp product = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
        SQLQuery q = session.createSQLQuery("SELECT DISTINCT MaMau  FROM ChiTietSanPham where maSanPham=:maSanPham and maMau=:maMau and maSize in (:maSize)");
        q.addEntity(ChiTietSp.class);
        q.setParameter("maSanPham", maSanPham);
        q.setParameter("maMau", maMau);
        q.setParameter("maSize", maSize);
        product = (ChiTietSp) q.uniqueResult();
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
    public List<MauSanPham> getAlls() {
        ss = HibernateUtil.getSessionFactory().openSession();
        Query q = ss.createQuery("from MauSanPham");
        List<MauSanPham> ms = q.list();
        ss.close();
         ss = HibernateUtil.getSessionFactory().openSession();
        return ms;
    }
    public List<MauSanPham> getAllss() {

        List<MauSanPham> product = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
        SQLQuery q = session.createSQLQuery("SELECT * from MauSanPham");
        product=q.addEntity(MauSanPham.class).list();
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
     
    public MauSanPham getByIdMau(int maMau) {
        MauSanPham product = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            product = (MauSanPham) session
                    .createQuery("from MauSanPham where maMau=:maMau").setParameter("maMau", maMau).uniqueResult();
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

    public MauSanPham getById(int maMau) {
        ss = HibernateUtil.getSessionFactory().openSession();
        return (MauSanPham) ss.get(MauSanPham.class, maMau);
    }

    public void Insert(MauSanPham ms) {
        ss = HibernateUtil.getSessionFactory().openSession();
        ss.getTransaction().begin();
        ss.save(ms);
        ss.getTransaction().commit();
    }

    public void Update(MauSanPham ms) {
        ss = HibernateUtil.getSessionFactory().openSession();
        ss.getTransaction().begin();
        ss.update(ms);
        ss.getTransaction().commit();
    }

    public boolean delete(int maMau) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            SQLQuery query = session.createSQLQuery("DELETE FROM MauSanPham WHERE maMau = :maMau");
            query.setParameter("maMau", maMau);

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
