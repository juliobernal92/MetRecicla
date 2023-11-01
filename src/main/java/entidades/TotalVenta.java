
package entidades;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="TotalVenta")
public class TotalVenta {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="idtotalventa")
    private int idtotalventa;
    
    @ManyToOne
    @JoinColumn(name="idventaticket")
    private VentasTicket idventasticket;
    
    
}
