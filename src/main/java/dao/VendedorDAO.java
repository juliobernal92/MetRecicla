package dao;
import entidades.Vendedor;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.util.List;
import org.hibernate.SessionFactory;

public class VendedorDAO {

    private final SessionFactory sessionFactory;

    public VendedorDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Vendedor findById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Vendedor.class, id);
        }
    }

    public void save(Vendedor vendedor) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.save(vendedor);
            transaction.commit();
        }
    }

    public void update(Vendedor vendedor) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.update(vendedor);
            transaction.commit();
        }
    }

    public void delete(Vendedor vendedor) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.delete(vendedor);
            transaction.commit();
        }
    }

    public List<Vendedor> findAll() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM Vendedor", Vendedor.class).list();
        }
    }

    public Vendedor obtenerVendedorPorId(int id) {
        return findById(id);
    }
}
