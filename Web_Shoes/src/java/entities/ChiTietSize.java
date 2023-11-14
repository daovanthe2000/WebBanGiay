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
@Table(name = "ChiTietSize")
public class ChiTietSize implements Serializable {
    @Id
    private int maSize;

    public ChiTietSize() {
    }
    
    public ChiTietSize(int maSize) {
        this.maSize = maSize;
    }

    public int getMaSize() {
        return maSize;
    }

    public void setMaSize(int maSize) {
        this.maSize = maSize;
    }
    
    
    
    
}
