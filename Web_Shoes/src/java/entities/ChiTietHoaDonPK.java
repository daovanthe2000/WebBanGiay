/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author DELL
 */
@Embeddable
public class ChiTietHoaDonPK implements Serializable {
    @Basic(optional = false)
    @NotNull
    @Column(name = "MaHoaDon")
    private int maHoaDon;
    @Basic(optional = false)
    @NotNull
    @Column(name = "IdChiTietSP")
    private int idChiTietSP;

    public ChiTietHoaDonPK() {
    }

    public ChiTietHoaDonPK(int maHoaDon, int idChiTietSP) {
        this.maHoaDon = maHoaDon;
        this.idChiTietSP = idChiTietSP;
    }

    public int getMaHoaDon() {
        return maHoaDon;
    }

    public void setMaHoaDon(int maHoaDon) {
        this.maHoaDon = maHoaDon;
    }

    public int getIdChiTietSP() {
        return idChiTietSP;
    }

    public void setIdChiTietSP(int idChiTietSP) {
        this.idChiTietSP = idChiTietSP;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) maHoaDon;
        hash += (int) idChiTietSP;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ChiTietHoaDonPK)) {
            return false;
        }
        ChiTietHoaDonPK other = (ChiTietHoaDonPK) object;
        if (this.maHoaDon != other.maHoaDon) {
            return false;
        }
        if (this.idChiTietSP != other.idChiTietSP) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "entities.ChiTietHoaDonPK[ maHoaDon=" + maHoaDon + ", idChiTietSP=" + idChiTietSP + " ]";
    }
    
}
