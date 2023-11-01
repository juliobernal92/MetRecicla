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
@Table(name="PrecioLocal")
public class PrecioLocal implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idpreciolocal")
    private int idpreciolocal;
    
    @ManyToOne
    @JoinColumn(name = "idlocal")
    private LocalesVenta idlocal;
    
    @ManyToOne
    @JoinColumn(name = "idchatarra")
    private Chatarra chatarra;
    
    @Column(precision = 10, scale = 2)
    private BigDecimal preciolocal;
    
    // Getters y setters

    /**
     * @return the idpreciolocal
     */
    public int getIdpreciolocal() {
        return idpreciolocal;
    }

    /**
     * @param idpreciolocal the idpreciolocal to set
     */
    public void setIdpreciolocal(int idpreciolocal) {
        this.idpreciolocal = idpreciolocal;
    }

    /**
     * @return the idlocal
     */
    public LocalesVenta getIdlocal() {
        return idlocal;
    }

    /**
     * @param idlocal the idlocal to set
     */
    public void setIdlocal(LocalesVenta idlocal) {
        this.idlocal = idlocal;
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
     * @return the preciolocal
     */
    public BigDecimal getPreciolocal() {
        return preciolocal;
    }

    /**
     * @param preciolocal the preciolocal to set
     */
    public void setPreciolocal(BigDecimal preciolocal) {
        this.preciolocal = preciolocal;
    }
    
    
    
}
