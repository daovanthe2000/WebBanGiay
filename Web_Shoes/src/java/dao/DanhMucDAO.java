/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dao.HibernateUtil;
import entities.DanhMucSanPham;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.transform.Transformers;

/**
 *
 * @author Admin
 */
public class DanhMucDAO {

    Session ss = null;

    public DanhMucDAO() {
//         ss = HibernateUtil.getSessionFactory().openSession();
    }

    public List<DanhMucSanPham> getAlls() {
         ss = HibernateUtil.getSessionFactory().openSession();
        Query q = ss.createQuery("from DanhMucSanPham");
        List<DanhMucSanPham> dm = q.list();
        ss.close();
        return dm;
    }
public List<DanhMucSanPham> getAllss() {

        List<DanhMucSanPham> product = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            SQLQuery q = session.createSQLQuery("SELECT * from DanhMucSanPham");
        product=q.addEntity(DanhMucSanPham.class).list();
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

   

    public DanhMucSanPham getById(int maDanhMuc) {
        ss = HibernateUtil.getSessionFactory().openSession();
        return (DanhMucSanPham) ss.get(DanhMucSanPham.class, maDanhMuc);
    }

    public void Insert(DanhMucSanPham dmuc) {
        ss = HibernateUtil.getSessionFactory().openSession();
        ss.getTransaction().begin();
        ss.save(dmuc);
        ss.getTransaction().commit();
    }

    public void Update(DanhMucSanPham danhmuc) {
        ss = HibernateUtil.getSessionFactory().openSession();
        ss.getTransaction().begin();
        ss.update(danhmuc);
        ss.getTransaction().commit();
    }

    public boolean delete(int maDanhMuc) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            SQLQuery query = session.createSQLQuery("DELETE FROM DanhMucSanPham WHERE maDanhMuc = :maDanhMuc");
            query.setParameter("maDanhMuc", maDanhMuc);

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
