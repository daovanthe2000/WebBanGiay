package entities;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author DELL
 */
@Entity
@Table(name = "DanhMucJoin")
public class DanhMucJoin implements Serializable {
    @Id
    private int maDanhMuc;

    public DanhMucJoin() {
    }
    
    public DanhMucJoin(int maDanhMuc) {
        this.maDanhMuc = maDanhMuc;
    }

    public int getMaDanhMuc() {
        return maDanhMuc;
    }

    public void setMaDanhMuc(int maDanhMuc) {
        this.maDanhMuc = maDanhMuc;
    }

    
    
    
    
    
}
