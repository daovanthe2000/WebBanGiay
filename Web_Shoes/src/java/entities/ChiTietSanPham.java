/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import unit.XuLyTien;

/**
 *
 * @author DELL
 */
@Entity
@Table(name = "ChiTietSanPham")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ChiTietSanPham.findAll", query = "SELECT c FROM ChiTietSanPham c"),
    @NamedQuery(name = "ChiTietSanPham.findByIdChiTietSP", query = "SELECT c FROM ChiTietSanPham c WHERE c.idChiTietSP = :idChiTietSP"),
    @NamedQuery(name = "ChiTietSanPham.findByGiaTien", query = "SELECT c FROM ChiTietSanPham c WHERE c.giaTien = :giaTien"),
    @NamedQuery(name = "ChiTietSanPham.findByNgayTao", query = "SELECT c FROM ChiTietSanPham c WHERE c.ngayTao = :ngayTao"),
    @NamedQuery(name = "ChiTietSanPham.findBySoLuong", query = "SELECT c FROM ChiTietSanPham c WHERE c.soLuong = :soLuong"),
    @NamedQuery(name = "ChiTietSanPham.findByStatus", query = "SELECT c FROM ChiTietSanPham c WHERE c.status = :status"),
    @NamedQuery(name = "ChiTietSanPham.findByAnhChinh", query = "SELECT c FROM ChiTietSanPham c WHERE c.anhChinh = :anhChinh")})
public class ChiTietSanPham implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
   
     @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IdChiTietSP")
    private Integer idChiTietSP;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "GiaTien")
    private Double giaTien;
    @Size(max = 50)
    @Column(name = "NgayTao")
    private String ngayTao;
    @Column(name = "SoLuong")
    private Integer soLuong;
    @Basic(optional = false)
    @NotNull
    @Column(name = "status")
    private boolean status;
    @Size(max = 200)
    @Column(name = "AnhChinh")
    private String anhChinh;
    
    @JoinColumn(name = "MaSanPham", referencedColumnName = "MaSanPham")
    @ManyToOne(fetch = FetchType.EAGER,optional = false)
    private SanPham maSanPham;
    @JoinColumn(name = "MaMau", referencedColumnName = "MaMau")
    @ManyToOne(optional = false)
    private MauSanPham maMau;
    @JoinColumn(name = "MaSize", referencedColumnName = "MaSize")
    @ManyToOne(fetch = FetchType.EAGER,optional = false)
    private SizeSanPham maSize;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "chiTietSanPham")
    private Collection<ChiTietHoaDon> chiTietHoaDonCollection;

    public ChiTietSanPham() {
    }

    public ChiTietSanPham(Integer idChiTietSP) {
        this.idChiTietSP = idChiTietSP;
    }

    public ChiTietSanPham(Integer idChiTietSP, boolean status) {
        this.idChiTietSP = idChiTietSP;
        this.status = status;
    }

    public Integer getIdChiTietSP() {
        return idChiTietSP;
    }

    public void setIdChiTietSP(Integer idChiTietSP) {
        this.idChiTietSP = idChiTietSP;
    }

    public Double getGiaTien() {
        return giaTien;
    }

    public void setGiaTien(Double giaTien) {
        this.giaTien = giaTien;
    }

    public String getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(String ngayTao) {
        this.ngayTao = ngayTao;
    }

    public Integer getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(Integer soLuong) {
        this.soLuong = soLuong;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getAnhChinh() {
        return anhChinh;
    }

    public void setAnhChinh(String anhChinh) {
        this.anhChinh = anhChinh;
    }

    public MauSanPham getMaMau() {
        return maMau;
    }

    public void setMaMau(MauSanPham maMau) {
        this.maMau = maMau;
    }

    public SanPham getMaSanPham() {
        return maSanPham;
    }

    public void setMaSanPham(SanPham maSanPham) {
        this.maSanPham = maSanPham;
    }

    public SizeSanPham getMaSize() {
        return maSize;
    }

    public void setMaSize(SizeSanPham maSize) {
        this.maSize = maSize;
    }
    
    @XmlTransient
    public Collection<ChiTietHoaDon> getChiTietHoaDonCollection() {
        return chiTietHoaDonCollection;
    }

    public void setChiTietHoaDonCollection(Collection<ChiTietHoaDon> chiTietHoaDonCollection) {
        this.chiTietHoaDonCollection = chiTietHoaDonCollection;
    }
    public double tinhtien() {
        for (KhuyenMai anhSanPhamCollection1 : maSanPham.getKhuyenMaiCollection()) {

            return this.giaTien - ((this.giaTien / 100) * anhSanPhamCollection1.getGiaGiam());
        }
        return this.giaTien;
    }

    public double tinhTong() {

        return this.giaTien;
    }

    public String getGiaString() {
        return XuLyTien.dinhDangTien(tinhTong());
    }

    public String getGiaKmString() {
        return XuLyTien.dinhDangTien(tinhtien());
    }

    public double tinhtien1() {
        for (KhuyenMai anhSanPhamCollection1 : maSanPham.getKhuyenMaiCollection()) {

            return this.giaTien - ((this.giaTien / 100) * anhSanPhamCollection1.getGiaGiam());
        }
        return this.giaTien;
    }

    public double tinhTong1() {

        return this.giaTien;
    }

    public String getGiaString1() {
        return XuLyTien.dinhDangTien1(tinhTong1());
    }

    public String getGiaKmString1() {
        return XuLyTien.dinhDangTien(tinhtien1());
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idChiTietSP != null ? idChiTietSP.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ChiTietSanPham)) {
            return false;
        }
        ChiTietSanPham other = (ChiTietSanPham) object;
        if ((this.idChiTietSP == null && other.idChiTietSP != null) || (this.idChiTietSP != null && !this.idChiTietSP.equals(other.idChiTietSP))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.ChiTietSanPham[ idChiTietSP=" + idChiTietSP + " ]";
    }
    
}
