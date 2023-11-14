/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import dao.ChiTietSanPhamDAO;
import dao.KhuyenmaiDao;
import dao.MauSacDAO;
import dao.SanPhamDao;
import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.hibernate.annotations.Where;
import unit.XuLyTien;

/**
 *
 * @author DELL
 */
@Entity
@Table(name = "SanPham")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "SanPham.findAll", query = "SELECT s FROM SanPham s"),
    @NamedQuery(name = "SanPham.findByMaSanPham", query = "SELECT s FROM SanPham s WHERE s.maSanPham = :maSanPham"),
    @NamedQuery(name = "SanPham.findByTenSanPham", query = "SELECT s FROM SanPham s WHERE s.tenSanPham = :tenSanPham"),
    @NamedQuery(name = "SanPham.findByMoTa", query = "SELECT s FROM SanPham s WHERE s.moTa = :moTa")})
public class SanPham implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "MaSanPham")
    private Integer maSanPham;
    @Size(max = 100)
    @Column(name = "TenSanPham")
    private String tenSanPham;
    @Size(max = 2147483647)
    @Column(name = "MoTa")
    private String moTa;
    @ManyToMany(fetch = FetchType.EAGER)
    @Where(clause = "status='True'")
    @JoinTable(name = "ChiTietKhuyenMai", joinColumns
            = @JoinColumn(name = "MaSanPham"), inverseJoinColumns
            = @JoinColumn(name = "MaKhuyenMai"))
    private Set<KhuyenMai> khuyenMaiCollection = new HashSet<>();
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "maSanPham")
    private Collection<ChiTietSanPham> chiTietSanPhamCollection;

    @JoinColumn(name = "MaDanhMuc", referencedColumnName = "MaDanhMuc")
    @ManyToOne
    private DanhMucSanPham maDanhMuc;
    @JoinColumn(name = "MaNhanHang", referencedColumnName = "MaNhanHang")
    @ManyToOne
    private NhanHang maNhanHang;

    public SanPham() {
    }

    public SanPham(Integer maSanPham) {
        this.maSanPham = maSanPham;
    }

    public Integer getMaSanPham() {
        return maSanPham;
    }

    public void setMaSanPham(Integer maSanPham) {
        this.maSanPham = maSanPham;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public Set<KhuyenMai> getKhuyenMaiCollection() {
        return khuyenMaiCollection;
    }

    public void setKhuyenMaiCollection(Set<KhuyenMai> khuyenMaiCollection) {
        this.khuyenMaiCollection = khuyenMaiCollection;
    }

    @XmlTransient
    public Collection<ChiTietSanPham> getChiTietSanPhamCollection() {
        return chiTietSanPhamCollection;
    }

    public void setChiTietSanPhamCollection(Collection<ChiTietSanPham> chiTietSanPhamCollection) {
        this.chiTietSanPhamCollection = chiTietSanPhamCollection;
    }

    public DanhMucSanPham getMaDanhMuc() {
        return maDanhMuc;
    }

    public void setMaDanhMuc(DanhMucSanPham maDanhMuc) {
        this.maDanhMuc = maDanhMuc;
    }

    public NhanHang getMaNhanHang() {
        return maNhanHang;
    }

    public void setMaNhanHang(NhanHang maNhanHang) {
        this.maNhanHang = maNhanHang;
    }

    public List<ChiTietSp> Count() {

        ChiTietSanPhamDAO mdao = new ChiTietSanPhamDAO();

        return mdao.getAll1s(maSanPham);
    }

    public List<ChiTietSanPham> Anh() {
        List<ChiTietSanPham> m = new ArrayList<ChiTietSanPham>();
        MauSacDAO mdao = new MauSacDAO();
        ChiTietSanPhamDAO da = new ChiTietSanPhamDAO();
        for (ChiTietSp cp : mdao.getAll1s(maSanPham)) {
            for (ChiTietSanPham chitiet : chiTietSanPhamCollection) {
                if (chitiet.getAnhChinh() != null && chitiet.getMaMau().getMaMau() == cp.getMaMau()) {
                    m.add(chitiet);
                    break;
                }
            }
        }

        return m;
    }

    public SanPham Anh1() {

        SanPhamDao da = new SanPhamDao();
        SanPham m = da.getKiemTra(maSanPham, true);

        return m;

    }

    public SanPham check() throws ParseException {
        KhuyenmaiDao kmai = new KhuyenmaiDao();
        for (KhuyenMai list1 : khuyenMaiCollection) {
            String date = new SimpleDateFormat("dd-MM-yyyy HH:mm").format(new Date());
            SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy HH:mm");
            Date batdau = format.parse(date);

            long def = batdau.getTime() - list1.getThoiGianKetThuc().getTime();

            long deff = def / (60 * 1000);

            if (deff > 0) {
                list1.setStatus(false);
                kmai.Update(list1);
            }
        }
        SanPhamDao da = new SanPhamDao();
        SanPham m = da.getKiemTraAnh(maSanPham);

        return m;

    }

    

    public ChiTietSanPham min() {
        List<ChiTietSanPham> sanpham = new ArrayList<>();
        for (ChiTietSanPham chitiet : chiTietSanPhamCollection) {
            if (chitiet.getGiaTien() > 0) {
                sanpham.add(chitiet);
            }
        }
        
        ChiTietSanPham anh = Collections.min(sanpham, Comparator.comparing(ChiTietSanPham::getGiaTien));

        return anh;
    }

    public ChiTietSanPham max() {
        ChiTietSanPham anh = Collections.max(chiTietSanPhamCollection, Comparator.comparing(ChiTietSanPham::getGiaTien));

        return anh;
    }

    public double tinhtien() {
        
        for (KhuyenMai anhSanPhamCollection1 : khuyenMaiCollection) {

            return min().getGiaTien() - ((min().getGiaTien() / 100) * anhSanPhamCollection1.getGiaGiam());
        }
        return min().getGiaTien();
    }

    public String getGiaMin() {
        return XuLyTien.dinhDangTien(tinhtien());
    }

    public double tinhtienmax() {
        
        for (KhuyenMai anhSanPhamCollection1 : khuyenMaiCollection) {

            return max().getGiaTien() - ((max().getGiaTien() / 100) * anhSanPhamCollection1.getGiaGiam());
        }
        return max().getGiaTien();
    }

    public String getGiaMax() {
        return XuLyTien.dinhDangTien(tinhtienmax());
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (maSanPham != null ? maSanPham.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof SanPham)) {
            return false;
        }
        SanPham other = (SanPham) object;
        if ((this.maSanPham == null && other.maSanPham != null) || (this.maSanPham != null && !this.maSanPham.equals(other.maSanPham))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.SanPham[ maSanPham=" + maSanPham + " ]";
    }

}
