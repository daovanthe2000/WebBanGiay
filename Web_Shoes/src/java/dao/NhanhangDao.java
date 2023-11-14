/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dao.HibernateUtil;
import entities.NhanHang;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author DELL
 */
public class NhanhangDao {
    Session ss = null;

    public NhanhangDao() {
//         ss = HibernateUtil.getSessionFactory().openSession();
    }

    public List<NhanHang> getAlls() {
         ss = HibernateUtil.getSessionFactory().openSession();
        Query q = ss.createQuery("from NhanHang");
        List<NhanHang> dm = q.list();
        ss.close();
        return dm;
    }
public List<NhanHang> getAllss() {

       List<NhanHang> product = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            SQLQuery q = session.createSQLQuery("SELECT * from NhanHang");
        product=q.addEntity(NhanHang.class).list();
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

   

    public NhanHang getById(int maNhanHang) {
        ss = HibernateUtil.getSessionFactory().openSession();
        return (NhanHang) ss.get(NhanHang.class, maNhanHang);
    }

    public void Insert(NhanHang nhanhang) {
        ss = HibernateUtil.getSessionFactory().openSession();
        ss.getTransaction().begin();
        ss.save(nhanhang);
        ss.getTransaction().commit();
    }

    public void Update(NhanHang nhanhang) {
        ss = HibernateUtil.getSessionFactory().openSession();
        ss.getTransaction().begin();
        ss.update(nhanhang);
        ss.getTransaction().commit();
    }

    public boolean delete(int maNhanHang) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            SQLQuery query = session.createSQLQuery("DELETE FROM NhanHang WHERE maNhanHang = :maNhanHang");
            query.setParameter("maNhanHang", maNhanHang);

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
