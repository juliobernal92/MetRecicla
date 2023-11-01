package entidades;

import entidades.Chatarra;
import entidades.Ticket;
import entidades.Vendedor;
import java.math.BigDecimal;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2023-11-01T15:05:49", comments="EclipseLink-2.7.10.v20211216-rNA")
@StaticMetamodel(DetalleTicket.class)
public class DetalleTicket_ { 

    public static volatile SingularAttribute<DetalleTicket, Vendedor> vendedor;
    public static volatile SingularAttribute<DetalleTicket, Ticket> ticket;
    public static volatile SingularAttribute<DetalleTicket, BigDecimal> subtotal;
    public static volatile SingularAttribute<DetalleTicket, Chatarra> chatarra;
    public static volatile SingularAttribute<DetalleTicket, BigDecimal> cantidad;
    public static volatile SingularAttribute<DetalleTicket, Integer> iddetalle;

}