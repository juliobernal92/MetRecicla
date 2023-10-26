/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.*;

@Entity
@Table(name = "DetallesTicket")
public class DetalleTicket implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "iddetalle")
    private int iddetalle;

    @ManyToOne
    @JoinColumn(name = "idvendedor")
    private Vendedor vendedor; // Cambiado de int a Vendedor

    @ManyToOne
    @JoinColumn(name = "idchatarra")
    private Chatarra chatarra; // Cambiado de int a Chatarra
    
   @ManyToOne
   @JoinColumn(name = "idticket")
   private Ticket ticket;

    @Column(precision = 10, scale = 2)
    private BigDecimal cantidad;

    @Column(precision = 10, scale = 2)
    private BigDecimal subtotal;

    // Getters y setters

    /**
     * @return the iddetalle
     */
    public int getIddetalle() {
        return iddetalle;
    }

    /**
     * @param iddetalle the iddetalle to set
     */
    public void setIddetalle(int iddetalle) {
        this.iddetalle = iddetalle;
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
     * @return the chatarra
     */
    public Chatarra getChatarra() {
        return chatarra;
    }

    /**
     * @param chatarra the chatarra to set
     */
    public void setChatarra(Chatarra chatarra) {
        this.chatarra = chatarra;
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
    public BigDecimal getSubtotal() {
        return subtotal;
    }

    /**
     * @param subtotal the subtotal to set
     */
    public void setSubtotal(BigDecimal subtotal) {
        this.subtotal = subtotal;
    }

    /**
     * @return the ticket
     */
    public Ticket getTicket() {
        return ticket;
    }

    /**
     * @param ticket the ticket to set
     */
    public void setTicket(Ticket ticket) {
        this.ticket = ticket;
    }

}
