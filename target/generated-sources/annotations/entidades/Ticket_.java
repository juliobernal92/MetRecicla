package entidades;

import entidades.Vendedor;
import java.util.Date;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2024-01-04T16:11:39", comments="EclipseLink-2.7.10.v20211216-rNA")
@StaticMetamodel(Ticket.class)
public class Ticket_ { 

    public static volatile SingularAttribute<Ticket, Date> fecha;
    public static volatile SingularAttribute<Ticket, Vendedor> vendedor;
    public static volatile SingularAttribute<Ticket, Integer> idticket;

}