package dao;

import entidades.PrecioLocal;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class PrecioLocalDao {

    private final SessionFactory sessionFactory;

    public PrecioLocalDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public PrecioLocal findById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(PrecioLocal.class, id);
        }
    }

    public void save(PrecioLocal locales) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.save(locales);
            transaction.commit();
        }
    }

    public void update(PrecioLocal local) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.update(local);
            transaction.commit();
        }
    }

    public void delete(PrecioLocal local) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.delete(local);
            transaction.commit();
        }
    }

    public List<PrecioLocal> findAll() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM LocalesVentas", PrecioLocal.class).list();
        }
    }

    public PrecioLocal obtenerLocalPorId(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(PrecioLocal.class, id);
        }
    }
}
