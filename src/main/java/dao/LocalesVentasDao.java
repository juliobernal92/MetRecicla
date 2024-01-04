package dao;
import entidades.LocalesVentas;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class LocalesVentasDao {
    private final SessionFactory sessionFactory;

    public LocalesVentasDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    public LocalesVentas findById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(LocalesVentas.class, id);
        }
    }

    public void save(LocalesVentas locales) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.save(locales);
            transaction.commit();
        }
    }

    public void update(LocalesVentas local) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.update(local);
            transaction.commit();
        }
    }

    public void delete(LocalesVentas local) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.delete(local);
            transaction.commit();
        }
    }

    public List<LocalesVentas> findAll() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM LocalesVentas", LocalesVentas.class).list();
        }
    }

    public List<String> obtenerNombresLocales() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("SELECT nombre FROM LocalesVentas", String.class).list();
        }
    }

    public LocalesVentas findByNombre(String nombre) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM LocalesVentas WHERE nombre = :nombre", LocalesVentas.class)
                    .setParameter("nombre", nombre)
                    .uniqueResult();
        }
    }

    public LocalesVentas obtenerLocalPorId(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(LocalesVentas.class, id);
        }
    }

    public String obtenerNombrePorId(int id) {
        try (Session session = sessionFactory.openSession()) {
            LocalesVentas local = session.get(LocalesVentas.class, id);
            if (local != null) {
                return local.getNombre();
            }
            return null; // Si no se encuentra el local con ese ID, devuelve null o puedes manejarlo de otra manera según tus necesidades.
        }
    }
}
