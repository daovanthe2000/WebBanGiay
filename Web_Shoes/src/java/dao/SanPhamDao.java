/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dao.HibernateUtil;
import entities.ChiTietSanPham;
import entities.DanhMucSanPham;
import entities.KhuyenMai;
import entities.NhanHang;
import entities.SanPham;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import org.hibernate.Query;
import org.hibernate.SQLQuery;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.transform.Transformers;

/**
 *
 * @author DELL
 */
public class SanPhamDao {

    Session ss = null;

    public SanPhamDao() {
//         ss = HibernateUtil.getSessionFactory().openSession();
    }

    public List<SanPham> getAlls() {
        List<SanPham> dm = null;
        ss = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = ss.beginTransaction();
            SQLQuery q = ss.createSQLQuery("select * from SanPham where maSanPham in (select distinct ct.maSanPham from ChiTietSanPham ct,SanPham s where ct.maSanPham=s.maSanPham and anhChinh IS NOT NULL and giaTien>0)");
            dm = q.addEntity(SanPham.class).list();
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

    public List<SanPham> getAllss() {
        ss = HibernateUtil.getSessionFactory().openSession();
        Query q = ss.createQuery("from SanPham");
        List<SanPham> dm = q.list();
        ss.close();
        return dm;
    }

    public SanPham getKiemTra(int maSanPham, boolean status) {
        SanPham dm = null;
        ss = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = ss.beginTransaction();
            SQLQuery q = ss.createSQLQuery("select * from SanPham where maSanPham in (select distinct maSanPham from ChiTietSanPham where maSanPham=:maSanPham and status=:status)");
            dm = (SanPham) q.addEntity(SanPham.class).setParameter("maSanPham", maSanPham).setParameter("status", status).uniqueResult();

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

    public SanPham getKiemTraAnh(int maSanPham) {
        SanPham dm = null;
        ss = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = ss.beginTransaction();
            SQLQuery q = ss.createSQLQuery("select * from SanPham where maSanPham in (select distinct maSanPham from ChiTietSanPham where maSanPham=:maSanPham and anhChinh IS NOT NULL and giaTien>0)");
            dm = (SanPham) q.addEntity(SanPham.class).setParameter("maSanPham", maSanPham).uniqueResult();

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

    public List<SanPham> getListByPage(List<SanPham> list, int start, int end) {
        ArrayList<SanPham> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        
        return arr;
    }

    public SanPham getById(int maSanPham) {
        ss = HibernateUtil.getSessionFactory().openSession();
        return (SanPham) ss.get(SanPham.class, maSanPham);
    }

    public void Insert(SanPham sp) {
        ss = HibernateUtil.getSessionFactory().openSession();
        ss.getTransaction().begin();
        ss.save(sp);
        ss.getTransaction().commit();
        ss.close();
    }

    public void Update(SanPham s) {
        ss = HibernateUtil.getSessionFactory().openSession();
        ss.getTransaction().begin();
        ss.update(s);
        ss.getTransaction().commit();
    }

    public boolean delete(int maSanPham) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            SQLQuery query = session.createSQLQuery("DELETE FROM SanPham WHERE maSanPham = :maSanPham");
            query.setParameter("maSanPham", maSanPham);

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

    public int getSPMoi() {
        ss = HibernateUtil.getSessionFactory().openSession();
        Query q = ss.createQuery("FROM SanPham ORDER BY maSanPham DESC").setMaxResults(1);
        List<SanPham> result = q.list();
        SanPham result2 = (SanPham) q.uniqueResult();
        String check = "" + result2;
        int id2;
        if (!check.equals("null")) {
            id2 = result2.getMaSanPham();
        } else {
            id2 = 0;
        }
        ss.close();
        return id2;
    }

    public List<SanPham> getSanPham() {

        ss = HibernateUtil.getSessionFactory().openSession();
        SQLQuery q = ss.createSQLQuery("select * from SanPham where maSanPham in (select distinct ct.maSanPham from ChiTietSanPham ct,SanPham s where ct.maSanPham=s.maSanPham and anhChinh IS NOT NULL and giaTien>0)");
        List dm = q.addEntity(SanPham.class).list();
        ss.close();
        return dm;
    }

    public List<SanPham> oderById(int n) {
        List<SanPham> products = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            SQLQuery query = session
                    .createSQLQuery("select * from SanPham where maSanPham in (select distinct ct.maSanPham from ChiTietSanPham ct,SanPham s where ct.maSanPham=s.maSanPham and anhChinh IS NOT NULL and giaTien>0) ORDER BY maSanPham DESC");
            query.addEntity(SanPham.class).setMaxResults(n);
            products = query.list();
            transaction.commit();
        } catch (Exception e) {
            products = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return products;

    }

    public List<SanPham> search(String name) {
        List<SanPham> products = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            SQLQuery q = session.createSQLQuery("select * from SanPham where tenSanPham like :name and maSanPham in (select distinct ct.maSanPham from ChiTietSanPham ct,SanPham s where ct.maSanPham=s.maSanPham and anhChinh IS NOT NULL and giaTien>0)");
            q.addEntity(SanPham.class).setParameter("name", "%" + name + "%");
            products = q.list();
            transaction.commit();
        } catch (Exception e) {
            products = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return products;
    }

    public List<SanPham> limit(int maNhanHang, int n) {
        List<SanPham> products = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            SQLQuery query = session
                    .createSQLQuery("select * from SanPham where maNhanHang=:maNhanHang and maSanPham in (select distinct ct.maSanPham from ChiTietSanPham ct,SanPham s where ct.maSanPham=s.maSanPham and anhChinh IS NOT NULL and giaTien>0 )");
            query.addEntity(SanPham.class).setParameter("maNhanHang", maNhanHang).setMaxResults(n);
            products = query.list();
            transaction.commit();
        } catch (Exception e) {
            products = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return products;
    }

    public List<SanPham> SanPhamLienQuan(int maSanPham, DanhMucSanPham maDanhMuc) {
        List<SanPham> products = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            SQLQuery q = session
                    .createSQLQuery("select * from SanPham where not maSanPham=:maSanPham and  maDanhMuc=:maDanhMuc and maSanPham in (select distinct ct.maSanPham from ChiTietSanPham ct,SanPham s where ct.maSanPham=s.MaSanPham and anhChinh IS NOT NULL and giaTien>0)");
            q.addEntity(SanPham.class).setParameter("maSanPham", maSanPham);
            q.setParameter("maDanhMuc", maDanhMuc);
            q.setMaxResults(20);
            products = q.list();

            transaction.commit();
        } catch (Exception e) {
            products = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return products;
    }

    public List<SanPham> filterproduct(List<String> maNhanHang,int giamin,int giamax) {
        List<SanPham> products = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            String sql = "select * from SanPham where maNhanHang in (:maNhanHang) and maSanPham in (select distinct ct.maSanPham from ChiTietSanPham ct,SanPham s where ct.maSanPham=s.maSanPham and (giaTien BETWEEN :giamin and :giamax) and anhChinh IS NOT NULL)"; 
                    SQLQuery q = session
                    .createSQLQuery(sql);
            q.addEntity(SanPham.class).setParameterList("maNhanHang", maNhanHang).setParameter("giamin", giamin).setParameter("giamax", giamax);
         

            products = q.list();

            transaction.commit();
        } catch (Exception e) {
            products = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return products;
    }
    public List<SanPham> filterproductdanhmuc(List<String> maDanhMuc,int giamin, int giamax) {
        
        
        List<SanPham> products = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            String sql = "select * from SanPham where maDanhMuc in (:maDanhMuc) and maSanPham in (select distinct ct.maSanPham from ChiTietSanPham ct,SanPham s where ct.maSanPham=s.maSanPham and (giaTien BETWEEN :giamin and :giamax) and anhChinh IS NOT NULL)"; 
                    SQLQuery q = session
                    .createSQLQuery(sql);
            q.addEntity(SanPham.class).setParameterList("maDanhMuc", maDanhMuc).setParameter("giamin", giamin).setParameter("giamax", giamax);
         

            products = q.list();

            transaction.commit();
        } catch (Exception e) {
            products = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return products;
    }
    public List<SanPham> filterproductdanhmucmau(List<String> maDanhMuc,List<String> maMau,int giamin, int giamax) {
        
        
        List<SanPham> products = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            String sql = "select * from SanPham where maDanhMuc in (:maDanhMuc) and maSanPham in (select distinct ct.maSanPham from ChiTietSanPham ct,SanPham s where ct.maSanPham=s.maSanPham and maMau in(:maMau) and (giaTien BETWEEN :giamin and :giamax) and anhChinh IS NOT NULL)"; 
                    SQLQuery q = session
                    .createSQLQuery(sql);
            q.addEntity(SanPham.class).setParameterList("maDanhMuc", maDanhMuc).setParameterList("maMau", maMau).setParameter("giamin", giamin).setParameter("giamax", giamax);
         

            products = q.list();

            transaction.commit();
        } catch (Exception e) {
            products = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return products;
    }
    public List<SanPham> filterproductdanhmucsize(List<String> maDanhMuc,List<String> maSize,int giamin, int giamax) {
        
        
        List<SanPham> products = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            String sql = "select * from SanPham where maDanhMuc in (:maDanhMuc) and maSanPham in (select distinct ct.maSanPham from ChiTietSanPham ct,SanPham s where ct.maSanPham=s.maSanPham and maSize in(:maSize) and (giaTien BETWEEN :giamin and :giamax) and anhChinh IS NOT NULL)"; 
                    SQLQuery q = session
                    .createSQLQuery(sql);
            q.addEntity(SanPham.class).setParameterList("maDanhMuc", maDanhMuc).setParameterList("maSize", maSize).setParameter("giamin", giamin).setParameter("giamax", giamax);
         

            products = q.list();

            transaction.commit();
        } catch (Exception e) {
            products = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return products;
    }
     public List<SanPham> filterproductdanhmucsizemau(List<String> maDanhMuc,List<String> maSize,List<String> maMau,int giamin, int giamax) {
        
        
        List<SanPham> products = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            String sql = "select * from SanPham where maDanhMuc in (:maDanhMuc) and maSanPham in (select distinct ct.maSanPham from ChiTietSanPham ct,SanPham s where ct.maSanPham=s.maSanPham and maSize in(:maSize) and maMau in(:maMau) and (giaTien BETWEEN :giamin and :giamax) and anhChinh IS NOT NULL)"; 
                    SQLQuery q = session
                    .createSQLQuery(sql);
            q.addEntity(SanPham.class).setParameterList("maDanhMuc", maDanhMuc).setParameterList("maSize", maSize).setParameterList("maMau", maMau).setParameter("giamin", giamin).setParameter("giamax", giamax);
         

            products = q.list();

            transaction.commit();
        } catch (Exception e) {
            products = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return products;
    }
     public List<SanPham> filterproductnhanmau(List<String> maNhanHang,List<String> maMau,int giamin, int giamax) {
        
        
        List<SanPham> products = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            String sql = "select * from SanPham where maNhanHang in (:maNhanHang) and maSanPham in (select distinct ct.maSanPham from ChiTietSanPham ct,SanPham s where ct.maSanPham=s.maSanPham and maMau in(:maMau) and (giaTien BETWEEN :giamin and :giamax) and anhChinh IS NOT NULL)"; 
                    SQLQuery q = session
                    .createSQLQuery(sql);
            q.addEntity(SanPham.class).setParameterList("maNhanHang", maNhanHang).setParameterList("maMau", maMau).setParameter("giamin", giamin).setParameter("giamax", giamax);
         

            products = q.list();

            transaction.commit();
        } catch (Exception e) {
            products = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return products;
    }
    public List<SanPham> filterproductnhansize(List<String> maNhanHang,List<String> maSize,int giamin, int giamax) {
        
        
        List<SanPham> products = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            String sql = "select * from SanPham where maNhanHang in (:maNhanHang) and maSanPham in (select distinct ct.maSanPham from ChiTietSanPham ct,SanPham s where ct.maSanPham=s.maSanPham and maSize in(:maSize) and (giaTien BETWEEN :giamin and :giamax) and anhChinh IS NOT NULL)"; 
                    SQLQuery q = session
                    .createSQLQuery(sql);
            q.addEntity(SanPham.class).setParameterList("maNhanHang", maNhanHang).setParameterList("maSize", maSize).setParameter("giamin", giamin).setParameter("giamax", giamax);
         

            products = q.list();

            transaction.commit();
        } catch (Exception e) {
            products = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return products;
    }
     public List<SanPham> filterproductnhansizemau(List<String> maNhanHang,List<String> maSize,List<String> maMau,int giamin, int giamax) {
        
        
        List<SanPham> products = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            String sql = "select * from SanPham where maNhanHang in (:maNhanHang) and maSanPham in (select distinct ct.maSanPham from ChiTietSanPham ct,SanPham s where ct.maSanPham=s.maSanPham and maSize in(:maSize) and maMau in(:maMau) and (giaTien BETWEEN :giamin and :giamax) and anhChinh IS NOT NULL)"; 
                    SQLQuery q = session
                    .createSQLQuery(sql);
            q.addEntity(SanPham.class).setParameterList("maNhanHang", maNhanHang).setParameterList("maSize", maSize).setParameterList("maMau", maMau).setParameter("giamin", giamin).setParameter("giamax", giamax);
         

            products = q.list();

            transaction.commit();
        } catch (Exception e) {
            products = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return products;
    }
     public List<SanPham> filterproductnhansizemaus(List<String> maNhanHang,List<String> maDanhMuc,List<String> maSize,List<String> maMau,int giamin, int giamax) {
        
        
        List<SanPham> products = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
             String sql = "select * from SanPham where maNhanHang in (:maNhanHang) and maDanhMuc in (:maDanhMuc) and maSanPham in (select distinct ct.maSanPham from ChiTietSanPham ct,SanPham s where ct.maSanPham=s.maSanPham and maSize in(:maSize) and maMau in(:maMau) and (giaTien BETWEEN :giamin and :giamax) and anhChinh IS NOT NULL)"; 
                    SQLQuery q = session
                    .createSQLQuery(sql);
            q.addEntity(SanPham.class).setParameterList("maNhanHang", maNhanHang).setParameterList("maDanhMuc", maDanhMuc).setParameterList("maSize", maSize).setParameterList("maMau", maMau).setParameter("giamin", giamin).setParameter("giamax", giamax);
         

            products = q.list();

            transaction.commit();
        } catch (Exception e) {
            products = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return products;
    }
    public List<SanPham> filterproductdanhmucnah(List<String> maNhanHang,List<String> maDanhMuc,int giamin, int giamax) {
        
        List<SanPham> products = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            String sql = "select * from SanPham where maNhanHang in (:maNhanHang) and maDanhMuc in (:maDanhMuc) and maSanPham in (select distinct ct.maSanPham from ChiTietSanPham ct,SanPham s where ct.maSanPham=s.maSanPham and (giaTien BETWEEN :giamin and :giamax) and anhChinh IS NOT NULL)"; 
                    SQLQuery q = session
                    .createSQLQuery(sql);
            q.addEntity(SanPham.class).setParameterList("maNhanHang", maNhanHang).setParameterList("maDanhMuc", maDanhMuc).setParameter("giamin", giamin).setParameter("giamax", giamax);
         

            products = q.list();

            transaction.commit();
        } catch (Exception e) {
            products = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return products;
    }
    public List<SanPham> filterproductdanhmucnhannuze(List<String> maNhanHang,List<String> maDanhMuc,List<String> maSize,int giamin, int giamax) {
        
        List<SanPham> products = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            String sql = "select * from SanPham where maNhanHang in (:maNhanHang) and maDanhMuc in (:maDanhMuc) and maSanPham in (select distinct ct.maSanPham from ChiTietSanPham ct,SanPham s where ct.maSanPham=s.maSanPham and maSize in (:maSize) and (giaTien BETWEEN :giamin and :giamax) and anhChinh IS NOT NULL)"; 
                    SQLQuery q = session
                    .createSQLQuery(sql);
            q.addEntity(SanPham.class).setParameterList("maNhanHang", maNhanHang).setParameterList("maDanhMuc", maDanhMuc).setParameterList("maSize", maSize).setParameter("giamin", giamin).setParameter("giamax", giamax);
         

            products = q.list();

            transaction.commit();
        } catch (Exception e) {
            products = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return products;
    }
    public List<SanPham> filterproductdanhmucnahs(List<String> maNhanHang,List<String> maDanhMuc,List<String> maMau,int giamin, int giamax) {
        
        List<SanPham> products = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            String sql = "select * from SanPham where maNhanHang in (:maNhanHang) and maDanhMuc in (:maDanhMuc) and maSanPham in (select distinct ct.maSanPham from ChiTietSanPham ct,SanPham s where ct.maSanPham=s.maSanPham and maMau in (:maMau) and (giaTien BETWEEN :giamin and :giamax) and anhChinh IS NOT NULL)"; 
                    SQLQuery q = session
                    .createSQLQuery(sql);
            q.addEntity(SanPham.class).setParameterList("maNhanHang", maNhanHang).setParameterList("maDanhMuc", maDanhMuc).setParameterList("maMau", maMau).setParameter("giamin", giamin).setParameter("giamax", giamax);
         

            products = q.list();

            transaction.commit();
        } catch (Exception e) {
            products = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return products;
    }
    public List<SanPham> filterproductsize(List<String> maSize,int giamin, int giamax) {
        
        List<SanPham> products = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            String sql = "select * from SanPham where maSanPham in (select distinct ct.maSanPham from ChiTietSanPham ct,SanPham s where ct.maSanPham=s.maSanPham and maSize=(:maSize) and (giaTien BETWEEN :giamin and :giamax) and anhChinh IS NOT NULL)"; 
                    SQLQuery q = session
                    .createSQLQuery(sql);
            q.addEntity(SanPham.class).setParameterList("maSize", maSize).setParameter("giamin", giamin).setParameter("giamax", giamax);
         

            products = q.list();

            transaction.commit();
        } catch (Exception e) {
            products = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return products;
    }
    public List<SanPham> filterproducmau(List<String> maMau,int giamin, int giamax) {
       
        List<SanPham> products = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            String sql = "select * from SanPham where maSanPham in (select distinct ct.maSanPham from ChiTietSanPham ct,SanPham s where ct.maSanPham=s.maSanPham and maMau=(:maMau) and (giaTien BETWEEN :giamin and :giamax) and anhChinh IS NOT NULL)"; 
                    SQLQuery q = session
                    .createSQLQuery(sql);
            q.addEntity(SanPham.class).setParameterList("maMau", maMau).setParameter("giamin", giamin).setParameter("giamax", giamax);
         

            products = q.list();

            transaction.commit();
        } catch (Exception e) {
            products = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return products;
    }
 public List<SanPham> filterproducmausize(List<String> maSize,List<String> maMau,int giamin, int giamax) {
        
        
        List<SanPham> products = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            String sql = "select * from SanPham where maSanPham in (select distinct ct.maSanPham from ChiTietSanPham ct,SanPham s where ct.maSanPham=s.maSanPham and maMau=(:maMau) and maSize=(:maSize) and (giaTien BETWEEN :giamin and :giamax) and anhChinh IS NOT NULL)"; 
                    SQLQuery q = session
                    .createSQLQuery(sql);
            q.addEntity(SanPham.class).setParameterList("maMau", maMau).setParameterList("maSize", maSize).setParameter("giamin", giamin).setParameter("giamax", giamax);
         

            products = q.list();

            transaction.commit();
        } catch (Exception e) {
            products = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return products;
    }

    

    public List<SanPham> getDanhMuc(DanhMucSanPham maDanhMuc) {
        List<SanPham> products = null;
        Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            transaction = session.beginTransaction();
            SQLQuery q = session
                    .createSQLQuery("select * from SanPham where maDanhMuc=:maDanhMuc and maSanPham in (select distinct ct.maSanPham from ChiTietSanPham ct,SanPham s where ct.maSanPham=s.maSanPham and anhChinh IS NOT NULL and giaTien>0)");
            q.addEntity(SanPham.class).setParameter("maDanhMuc", maDanhMuc);
            products = q.list();
            transaction.commit();
        } catch (Exception e) {
            products = null;
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
        }
        return products;
    }

    public SanPham getByIdSp(int maSanPham) {
        SanPham dm = null;
        ss = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = ss.beginTransaction();
            SQLQuery q = ss.createSQLQuery("select * from SanPham where maSanPham=:maSanPham");
            dm = (SanPham) q.addEntity(SanPham.class).setParameter("maSanPham", maSanPham).uniqueResult();

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

    public List<KhuyenMai> getKhuyenMai() {

        ss = HibernateUtil.getSessionFactory().openSession();
        Query q = ss.createQuery("from KhuyenMai");
        List dm = q.list();
        ss.close();
        return dm;
    }

    public List<SanPham> getByIdDanhMuc(DanhMucSanPham maDanhMuc) {
        List<SanPham> dm = null;
        ss = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = ss.beginTransaction();
            dm = ss.createQuery("from SanPham where maDanhMuc=:maDanhMuc").setParameter("maDanhMuc", maDanhMuc)
                    .list();

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

    public boolean checkNametontai(String nhan) {

        ss = HibernateUtil.getSessionFactory().openSession();
        boolean userFound = false;

        Query query = ss.createQuery("from SanPham where tenSanPham=?");
        query.setParameter(0, nhan);

        List list = query.list();
        if ((list != null) && (list.size() > 0)) {

            userFound = true;
        }

        ss.close();
        return userFound;

    }

    public SanPham CheckName(String tenSanPham) {
        SanPham dm = null;
        ss = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = ss.beginTransaction();
            dm = (SanPham) ss.createQuery("from SanPham where tenSanPham=:tenSanPham").setParameter("tenSanPham", tenSanPham)
                    .uniqueResult();

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

}
