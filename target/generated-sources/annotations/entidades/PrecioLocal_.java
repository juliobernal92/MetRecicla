package entidades;

import entidades.Chatarra;
import entidades.LocalesVenta;
import java.math.BigDecimal;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2023-11-01T15:05:49", comments="EclipseLink-2.7.10.v20211216-rNA")
@StaticMetamodel(PrecioLocal.class)
public class PrecioLocal_ { 

    public static volatile SingularAttribute<PrecioLocal, BigDecimal> preciolocal;
    public static volatile SingularAttribute<PrecioLocal, LocalesVenta> idlocal;
    public static volatile SingularAttribute<PrecioLocal, Chatarra> chatarra;
    public static volatile SingularAttribute<PrecioLocal, Integer> idpreciolocal;

}