package dao;
import entidades.LocalesVenta;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class LocalesVentaDao {
    private final SessionFactory sessionFactory;

    public LocalesVentaDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    public LocalesVenta findById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(LocalesVenta.class, id);
        }
    }

    public void save(LocalesVenta locales) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.save(locales);
            transaction.commit();
        }
    }

    public void update(LocalesVenta local) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.update(local);
            transaction.commit();
        }
    }

    public void delete(LocalesVenta local) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.delete(local);
            transaction.commit();
        }
    }

    public List<LocalesVenta> findAll() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM LocalesVentas", LocalesVenta.class).list();
        }
    }

    public List<String> obtenerNombresLocales() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("SELECT nombre FROM LocalesVentas", String.class).list();
        }
    }

    public LocalesVenta findByNombre(String nombre) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM LocalesVentas WHERE nombre = :nombre", LocalesVenta.class)
                    .setParameter("nombre", nombre)
                    .uniqueResult();
        }
    }

    public LocalesVenta obtenerLocalPorId(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(LocalesVenta.class, id);
        }
    }

    public String obtenerNombrePorId(int id) {
        try (Session session = sessionFactory.openSession()) {
            LocalesVenta local = session.get(LocalesVenta.class, id);
            if (local != null) {
                return local.getNombre();
            }
            return null; // Si no se encuentra el local con ese ID, devuelve null o puedes manejarlo de otra manera según tus necesidades.
        }
    }
}
