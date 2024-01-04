package entidades;

import entidades.Chatarra;
import entidades.LocalesVentas;
import java.math.BigDecimal;
import javax.annotation.processing.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="org.eclipse.persistence.internal.jpa.modelgen.CanonicalModelProcessor", date="2024-01-04T16:11:39", comments="EclipseLink-2.7.10.v20211216-rNA")
@StaticMetamodel(PrecioLocal.class)
public class PrecioLocal_ { 

    public static volatile SingularAttribute<PrecioLocal, BigDecimal> preciolocal;
    public static volatile SingularAttribute<PrecioLocal, LocalesVentas> idlocal;
    public static volatile SingularAttribute<PrecioLocal, Chatarra> chatarra;
    public static volatile SingularAttribute<PrecioLocal, Integer> idpreciolocal;

}