/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author DELL
 */
@Entity
@Table(name = "ChiTietSp")
public class ChiTietSp implements Serializable {
    @Id
    private int maMau;

    public ChiTietSp() {
    }
    
    public ChiTietSp(int maMau) {
        this.maMau = maMau;
    }

    public int getMaMau() {
        return maMau;
    }

    public void setMaMau(int maMau) {
        this.maMau = maMau;
    }
    
    
    
    
}
