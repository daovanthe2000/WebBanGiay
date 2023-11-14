/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.Basic;
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
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import unit.XuLyTien;

/**
 *
 * @author DELL
 */
@Entity
@Table(name = "ChiTietSPnJoin")

public class ChiTietSPJoin implements Serializable {
    @Id
   
    private Integer idChiTietSP;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
   
    private Double giaTien;
   
    private String ngayTao;
   private String tenSanPham;
   private String size;
   private String tenMau;
    private Integer soLuong;
    
   
    private boolean status;
   
    private String anhChinh;
    
   

    private int maSanPham;
    
    private int maMau;
   
    private int maSize;

    public ChiTietSPJoin() {
    }

    public ChiTietSPJoin(Integer idChiTietSP, Double giaTien, String ngayTao,  String size, String tenMau, Integer soLuong, boolean status, String anhChinh, int maSanPham, int maMau, int maSize) {
        this.idChiTietSP = idChiTietSP;
        this.giaTien = giaTien;
        this.ngayTao = ngayTao;
       
        this.size = size;
        this.tenMau = tenMau;
        this.soLuong = soLuong;
        this.status = status;
        this.anhChinh = anhChinh;
        this.maSanPham = maSanPham;
        this.maMau = maMau;
        this.maSize = maSize;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getTenMau() {
        return tenMau;
    }

    public void setTenMau(String tenMau) {
        this.tenMau = tenMau;
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

    public int getMaSanPham() {
        return maSanPham;
    }

    public void setMaSanPham(int maSanPham) {
        this.maSanPham = maSanPham;
    }

   

    public int getMaMau() {
        return maMau; 
    }

    public void setMaMau(int maMau) {
        this.maMau = maMau;
    }

    public int getMaSize() {
        return maSize;
    }

    public void setMaSize(int maSize) {
        this.maSize = maSize;
    }
    public int getGia() {
        
        return (int)giaTien.intValue();
    }
    
   public double tinhTong() {

        return this.giaTien;
    }
      public String getGiaString() {
        return XuLyTien.dinhDangTien(tinhTong());
    }
     
    
    
}
