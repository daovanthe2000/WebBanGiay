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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author DELL
 */
@Entity
@Table(name = "KhachHang")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "KhachHang.findAll", query = "SELECT k FROM KhachHang k"),
    @NamedQuery(name = "KhachHang.findByMaKhachHang", query = "SELECT k FROM KhachHang k WHERE k.maKhachHang = :maKhachHang"),
    @NamedQuery(name = "KhachHang.findByHoTen", query = "SELECT k FROM KhachHang k WHERE k.hoTen = :hoTen"),
    @NamedQuery(name = "KhachHang.findByDiaChi", query = "SELECT k FROM KhachHang k WHERE k.diaChi = :diaChi"),
    @NamedQuery(name = "KhachHang.findByGioiTinh", query = "SELECT k FROM KhachHang k WHERE k.gioiTinh = :gioiTinh"),
    @NamedQuery(name = "KhachHang.findByCmnd", query = "SELECT k FROM KhachHang k WHERE k.cmnd = :cmnd"),
    @NamedQuery(name = "KhachHang.findBySoDT", query = "SELECT k FROM KhachHang k WHERE k.soDT = :soDT"),
  
    @NamedQuery(name = "KhachHang.findByEmail", query = "SELECT k FROM KhachHang k WHERE k.email = :email"),
    @NamedQuery(name = "KhachHang.findByTenDangNhap", query = "SELECT k FROM KhachHang k WHERE k.tenDangNhap = :tenDangNhap"),
    @NamedQuery(name = "KhachHang.findByMatKhau", query = "SELECT k FROM KhachHang k WHERE k.matKhau = :matKhau"),
@NamedQuery(name = "KhachHang.findByStatus", query = "SELECT k FROM KhachHang k WHERE k.status = :status")})
public class KhachHang implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
     @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaKhachHang")
    private Integer maKhachHang;
    @Size(max = 50)
    @Column(name = "HoTen")
    private String hoTen;
    @Size(max = 100)
    @Column(name = "DiaChi")
    private String diaChi;
    @Size(max = 50)
    @Column(name = "GioiTinh")
    private String gioiTinh;
    @Size(max = 20)
    @Column(name = "Cmnd")
    private String cmnd;
    @Size(max = 12)
    @Column(name = "SoDT")
    private String soDT;
  
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Size(max = 50)
    @Column(name = "Email")
    private String email;
    @Size(max = 50)
    @Column(name = "TenDangNhap")
    private String tenDangNhap;
    @Size(max = 50)
    @Column(name = "status")
    private boolean status;
    @Column(name = "MatKhau")
    private String matKhau;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER,mappedBy = "maKhachHang")
    private Collection<HoaDon> hoaDonCollection;

    public KhachHang() {
    }

    public KhachHang(Integer maKhachHang) {
        this.maKhachHang = maKhachHang;
    }

    public Integer getMaKhachHang() {
        return maKhachHang;
    }

    public void setMaKhachHang(Integer maKhachHang) {
        this.maKhachHang = maKhachHang;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getCmnd() {
        return cmnd;
    }

    public void setCmnd(String cmnd) {
        this.cmnd = cmnd;
    }

    public String getSoDT() {
        return soDT;
    }

    public void setSoDT(String soDT) {
        this.soDT = soDT;
    }

  

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    @XmlTransient
    public Collection<HoaDon> getHoaDonCollection() {
        return hoaDonCollection;
    }

    public void setHoaDonCollection(Collection<HoaDon> hoaDonCollection) {
        this.hoaDonCollection = hoaDonCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (maKhachHang != null ? maKhachHang.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof KhachHang)) {
            return false;
        }
        KhachHang other = (KhachHang) object;
        if ((this.maKhachHang == null && other.maKhachHang != null) || (this.maKhachHang != null && !this.maKhachHang.equals(other.maKhachHang))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.KhachHang[ maKhachHang=" + maKhachHang + " ]";
    }
    
}
