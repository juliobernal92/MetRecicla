/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="DetallesVentas")
public class DetallesVentas implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "iddetalleventa")
    private int iddetalleventa;
    
    @ManyToOne
    @JoinColumn(name = "idepreciolocal")
    private PrecioLocal preciolocal;
    
    @ManyToOne
    @JoinColumn(name = "idventaticket")
    private VentasTicket idventaticket;
    
    @Column(precision = 10, scale = 2)
    private BigDecimal cantidad;

    @Column
    private int subtotal;
    
    //GET Y SET

    /**
     * @return the iddetalleventa
     */
    public int getIddetalleventa() {
        return iddetalleventa;
    }

    /**
     * @param iddetalleventa the iddetalleventa to set
     */
    public void setIddetalleventa(int iddetalleventa) {
        this.iddetalleventa = iddetalleventa;
    }

    /**
     * @return the preciolocal
     */
    public PrecioLocal getPreciolocal() {
        return preciolocal;
    }

    /**
     * @param preciolocal the preciolocal to set
     */
    public void setPreciolocal(PrecioLocal preciolocal) {
        this.preciolocal = preciolocal;
    }

    /**
     * @return the idventaticket
     */
    public VentasTicket getIdventaticket() {
        return idventaticket;
    }

    /**
     * @param idventaticket the idventaticket to set
     */
    public void setIdventaticket(VentasTicket idventaticket) {
        this.idventaticket = idventaticket;
    }

    /**
     * @return the cantidad
     */
    public BigDecimal getCantidad() {
        return cantidad;
    }

    /**
     * @param cantidad the cantidad to set
     */
    public void setCantidad(BigDecimal cantidad) {
        this.cantidad = cantidad;
    }

    /**
     * @return the subtotal
     */
    public int getSubtotal() {
        return subtotal;
    }

    /**
     * @param subtotal the subtotal to set
     */
    public void setSubtotal(int subtotal) {
        this.subtotal = subtotal;
    }
    
    
}
