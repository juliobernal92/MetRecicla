package entidades;

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

@Entity
@Table(name="VentasTicket")
public class VentasTicket {
    @Id
    @GeneratedValue(strategy =GenerationType.IDENTITY)
    @Column(name="idventaticket")
    private int idventaticket;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date fecha;
    
    @ManyToOne
    @JoinColumn(name="idempleado")
    private Empleados idempleado;
    
    //Get y Set

    /**
     * @return the idventaticket
     */
    public int getIdventaticket() {
        return idventaticket;
    }

    /**
     * @param idventaticket the idventaticket to set
     */
    public void setIdventaticket(int idventaticket) {
        this.idventaticket = idventaticket;
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

    /**
     * @return the idempleado
     */
    public Empleados getIdempleado() {
        return idempleado;
    }

    /**
     * @param idempleado the idempleado to set
     */
    public void setIdempleado(Empleados idempleado) {
        this.idempleado = idempleado;
    }
    
}
