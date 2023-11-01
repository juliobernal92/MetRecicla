package dao;

import entidades.TotalVenta;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class TotalVentaDao {
    private final SessionFactory sessionFactory;

    public TotalVentaDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    public void save(TotalVenta total) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.save(total);
            transaction.commit();
        }
    }

    public TotalVenta findById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(TotalVenta.class, id);
        }
    }

    public void update(TotalVenta total) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.update(total);
            transaction.commit();
        }
    }

    public void delete(TotalVenta total) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.delete(total);
            transaction.commit();
        }
    }

    public List<TotalVenta> findAll() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM TotalVenta", TotalVenta.class).list();
        }
    }
}
