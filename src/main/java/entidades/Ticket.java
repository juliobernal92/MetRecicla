/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Doomed666
 */

@Entity
@Table(name = "Ticket")
public class Ticket implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idticket")
    private int idticket;

    @ManyToOne
    @JoinColumn(name = "idvendedor") // Esto debe hacer referencia a la entidad Vendedor
    private Vendedor vendedor; // Cambiar el tipo de int a la entidad Vendedor

    @Temporal(TemporalType.TIMESTAMP)
    private Date fecha;


    // Getters y setters

    /**
     * @return the idticket
     */
    public int getIdticket() {
        return idticket;
    }

    /**
     * @param idticket the idticket to set
     */
    public void setIdticket(int idticket) {
        this.idticket = idticket;
    }

    /**
     * @return the vendedor
     */
    public Vendedor getVendedor() {
        return vendedor;
    }

    /**
     * @param vendedor the vendedor to set
     */
    public void setVendedor(Vendedor vendedor) {
        this.vendedor = vendedor;
    }

    /**
     * @return the fecha
     */
    public Date getFecha() {
        return fecha;
    }

    /**
     * @param fecha the fecha to set
     */
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

}
