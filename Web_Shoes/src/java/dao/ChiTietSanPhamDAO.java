/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dao.*;
import entities.ChiTietSPJoin;
import entities.ChiTietSanPham;
import entities.ChiTietSanPhanJoin;
import entities.ChiTietSp;
import entities.SanPham;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author PC
 */
public class ChiTietSanPhamDAO {

    Session ss = null;

    public ChiTietSanPhamDAO() {
    }

    public List<ChiTietSanPham> getAlls() {
        ss = HibernateUtil.getSessionFactory().openSession();
        Query q = ss.createQuery("from ChiTietSanPham");
        List<ChiTietSanPham> ls = q.list();
        ss.close();
        return ls;
    }

    public List<ChiTietSp> getAll1s(int maSanPham) {
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

    public boolean delete(int idChiTietSP) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            SQLQuery query = session.createSQLQuery("DELETE FROM ChiTietSanPham WHERE idChiTietSP = :idChiTietSP");
            query.setParameter("idChiTietSP", idChiTietSP);
           
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

    public void updategia(int idChiTietSP, int giaTien) {
        ss = HibernateUtil.getSessionFactory().openSession();
        SQLQuery q = ss.createSQLQuery("UPDATE ChiTietSanPham SET giaTien = :giaTien where idChiTietSP=:idChiTietSP ");
        q.setParameter("giaTien", giaTien);
        q.setParameter("idChiTietSP", idChiTietSP);
        ss.getTransaction().begin();
        q.executeUpdate();
        ss.getTransaction().commit();
        ss.close();

    }
public boolean updatestatus(int idChiTietSP, boolean status) {
        ss = HibernateUtil.getSessionFactory().openSession();
        SQLQuery q = ss.createSQLQuery("UPDATE ChiTietSanPham SET status = :status where idChiTietSP=:idChiTietSP ");
        q.setParameter("status", status);
        q.setParameter("idChiTietSP", idChiTietSP);
        ss.getTransaction().begin();
        q.executeUpdate();
        ss.getTransaction().commit();
        ss.close();
        return true;

    }
    public void updateanh(int idChiTietSP, String anhChinh) {
        ss = HibernateUtil.getSessionFactory().openSession();
        SQLQuery q = ss.createSQLQuery("UPDATE ChiTietSanPham SET anhChinh = :anhChinh where idChiTietSP=:idChiTietSP ");
        q.setParameter("anhChinh", anhChinh);
        q.setParameter("idChiTietSP", idChiTietSP);
        ss.getTransaction().begin();
        q.executeUpdate();
        ss.getTransaction().commit();
        ss.close();

    }

    public void updatesoluong(int idChiTietSP, int soLuong, boolean status) {
        ss = HibernateUtil.getSessionFactory().openSession();
        SQLQuery q = ss.createSQLQuery("UPDATE ChiTietSanPham SET soLuong = :soLuong,status=:status where idChiTietSP=:idChiTietSP ");
        q.setParameter("soLuong", soLuong);
        q.setParameter("idChiTietSP", idChiTietSP);
        q.setParameter("status", status);
        ss.getTransaction().begin();
        q.executeUpdate();
        ss.getTransaction().commit();
        ss.close();

    }
    public List<ChiTietSPJoin> getByIdChiTietSpL(int maSanPham) {
        List<ChiTietSPJoin> dm = null;
        ss = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = ss.beginTransaction();
            SQLQuery q = ss.createSQLQuery("Select ct.*,s.tenSanPham,m.tenMau,sz.size FROM ChiTietSanPham ct,SanPham s,MauSanPham m,SizeSanPham sz where ct.maSanPham=:maSanPham and ct.maSanPham=s.maSanPham and ct.maMau=m.maMau and ct.maSize=sz.maSize and giaTien>0");
            dm = q.addEntity(ChiTietSPJoin.class).setParameter("maSanPham", maSanPham).list();
            System.out.println(dm);
            transaction.commit();

        } catch (Exception e) {
            dm = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            ss.close();
        }
        return dm;
    }
 public List<ChiTietSPJoin> getByIdChiTietSpanh(int maSanPham) {
        List<ChiTietSPJoin> dm = null;
        ss = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = ss.beginTransaction();
            SQLQuery q = ss.createSQLQuery("Select ct.*,s.tenSanPham,m.tenMau,sz.size FROM ChiTietSanPham ct,SanPham s,MauSanPham m,SizeSanPham sz where ct.maSanPham=:maSanPham and ct.maSanPham=s.maSanPham and ct.maMau=m.maMau and ct.maSize=sz.maSize");
            dm = q.addEntity(ChiTietSPJoin.class).setParameter("maSanPham", maSanPham).list();

            transaction.commit();

        } catch (Exception e) {
            dm = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            ss.close();
        }
        return dm;
    }
 public List<ChiTietSPJoin> getByIdCTSP(int maSanPham) {
        List<ChiTietSPJoin> dm = null;
        ss = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = ss.beginTransaction();
            SQLQuery q = ss.createSQLQuery("Select ct.*,s.tenSanPham,m.tenMau,sz.size FROM ChiTietSanPham ct,SanPham s,MauSanPham m,SizeSanPham sz where ct.maSanPham=:maSanPham and ct.maSanPham=s.maSanPham and ct.maMau=m.maMau and ct.maSize=sz.maSize and anhChinh IS NOT NULL and giaTien>0");
            dm = q.addEntity(ChiTietSPJoin.class).setParameter("maSanPham", maSanPham).list();

            transaction.commit();

        } catch (Exception e) {
            dm = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            ss.close();
        }
        return dm;
    }
 public ChiTietSPJoin getByIdChiTiet(int idChiTietSP) {
        ChiTietSPJoin dm = null;
        ss = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = ss.beginTransaction();
            SQLQuery q = ss.createSQLQuery("Select ct.*,s.tenSanPham,m.tenMau,sz.size FROM ChiTietSanPham ct,SanPham s,MauSanPham m,SizeSanPham sz where ct.idChiTietSP=:idChiTietSP and ct.maSanPham=s.maSanPham and ct.maMau=m.maMau and ct.maSize=sz.maSize");
            dm = (ChiTietSPJoin) q.addEntity(ChiTietSPJoin.class).setParameter("idChiTietSP", idChiTietSP).uniqueResult();

            transaction.commit();

        } catch (Exception e) {
            dm = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            ss.close();
        }
        return dm;
    }
   
    public List<ChiTietSPJoin> getByIdChiTietSpMau(int maSanPham,int maMau) {
        List<ChiTietSPJoin> dm = null;
        ss = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = ss.beginTransaction();
            SQLQuery q = ss.createSQLQuery("Select ct.*,s.tenSanPham,m.tenMau,sz.size FROM ChiTietSanPham ct,SanPham s,MauSanPham m,SizeSanPham sz where ct.maSanPham=:maSanPham and ct.maMau=:maMau and ct.maSanPham=s.maSanPham and ct.maMau=m.maMau and ct.maSize=sz.maSize ");
            dm = q.addEntity(ChiTietSPJoin.class).setParameter("maSanPham", maSanPham).setParameter("maMau", maMau).list();

            transaction.commit();

        } catch (Exception e) {
            dm = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            ss.close();
        }
        return dm;
    }
    

    public ChiTietSanPham getById(int idChiTietSP) {
        ss = HibernateUtil.getSessionFactory().openSession();
        return (ChiTietSanPham) ss.get(ChiTietSanPham.class, idChiTietSP);
    }

    public void Insert(ChiTietSanPham cp) {
        ss = HibernateUtil.getSessionFactory().openSession();
        ss.getTransaction().begin();
        ss.save(cp);
        ss.getTransaction().commit();
        ss.close();
    }

    public void Update(ChiTietSanPham danhmuc) {
        ss = HibernateUtil.getSessionFactory().openSession();
        ss.getTransaction().begin();
        ss.update(danhmuc);
        ss.getTransaction().commit();
    }

    public boolean Delete(int idChiTietSP) {
        ss = HibernateUtil.getSessionFactory().openSession();
        SQLQuery query = ss.createSQLQuery("DELETE FROM ChiTietSanPham WHERE idChiTietSP = :idChiTietSP");
        query.setParameter("idChiTietSP", idChiTietSP);
        ss.getTransaction().begin();
        query.executeUpdate();
        ss.getTransaction().commit();
        return true;
    }
}
