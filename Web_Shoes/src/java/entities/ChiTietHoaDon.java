/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author DELL
 */
@Entity
@Table(name = "ChiTietHoaDon")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ChiTietHoaDon.findAll", query = "SELECT c FROM ChiTietHoaDon c"),
    @NamedQuery(name = "ChiTietHoaDon.findByMaHoaDon", query = "SELECT c FROM ChiTietHoaDon c WHERE c.chiTietHoaDonPK.maHoaDon = :maHoaDon"),
    @NamedQuery(name = "ChiTietHoaDon.findByIdChiTietSP", query = "SELECT c FROM ChiTietHoaDon c WHERE c.chiTietHoaDonPK.idChiTietSP = :idChiTietSP"),
    @NamedQuery(name = "ChiTietHoaDon.findBySoLuong", query = "SELECT c FROM ChiTietHoaDon c WHERE c.soLuong = :soLuong"),
    @NamedQuery(name = "ChiTietHoaDon.findByGiaTien", query = "SELECT c FROM ChiTietHoaDon c WHERE c.giaTien = :giaTien"),
    @NamedQuery(name = "ChiTietHoaDon.findByThanhTien", query = "SELECT c FROM ChiTietHoaDon c WHERE c.thanhTien = :thanhTien")})
public class ChiTietHoaDon implements Serializable {
    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ChiTietHoaDonPK chiTietHoaDonPK;
    @Column(name = "SoLuong")
    private Integer soLuong;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "GiaTien")
    private Integer giaTien;
    @Column(name = "ThanhTien")
    private Integer thanhTien;
    @JoinColumn(name = "IdChiTietSP", referencedColumnName = "IdChiTietSP", insertable = false, updatable = false)
    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER,optional = false)
    private ChiTietSanPham chiTietSanPham;
    @JoinColumn(name = "MaHoaDon", referencedColumnName = "MaHoaDon", insertable = false, updatable = false)
    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER,optional = false)
    private HoaDon hoaDon;

    public ChiTietHoaDon() {
    }

    public ChiTietHoaDon(ChiTietHoaDonPK chiTietHoaDonPK) {
        this.chiTietHoaDonPK = chiTietHoaDonPK;
    }

    public ChiTietHoaDon(int maHoaDon, int idChiTietSP) {
        this.chiTietHoaDonPK = new ChiTietHoaDonPK(maHoaDon, idChiTietSP);
    }

    public ChiTietHoaDonPK getChiTietHoaDonPK() {
        return chiTietHoaDonPK;
    }

    public void setChiTietHoaDonPK(ChiTietHoaDonPK chiTietHoaDonPK) {
        this.chiTietHoaDonPK = chiTietHoaDonPK;
    }

    public Integer getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(Integer soLuong) {
        this.soLuong = soLuong;
    }

    public Integer getGiaTien() {
        return giaTien;
    }

    public void setGiaTien(Integer giaTien) {
        this.giaTien = giaTien;
    }

    public Integer getThanhTien() {
        return thanhTien;
    }

    public void setThanhTien(Integer thanhTien) {
        this.thanhTien = thanhTien;
    }

    public ChiTietSanPham getChiTietSanPham() {
        return chiTietSanPham;
    }

    public void setChiTietSanPham(ChiTietSanPham chiTietSanPham) {
        this.chiTietSanPham = chiTietSanPham;
    }

    public HoaDon getHoaDon() {
        return hoaDon;
    }

    public void setHoaDon(HoaDon hoaDon) {
        this.hoaDon = hoaDon;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (chiTietHoaDonPK != null ? chiTietHoaDonPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ChiTietHoaDon)) {
            return false;
        }
        ChiTietHoaDon other = (ChiTietHoaDon) object;
        if ((this.chiTietHoaDonPK == null && other.chiTietHoaDonPK != null) || (this.chiTietHoaDonPK != null && !this.chiTietHoaDonPK.equals(other.chiTietHoaDonPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.ChiTietHoaDon[ chiTietHoaDonPK=" + chiTietHoaDonPK + " ]";
    }
    
}
