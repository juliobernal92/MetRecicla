package dao;

import entidades.VentasTicket;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class VentasTicketDao {
    private final SessionFactory sessionFactory;

    public VentasTicketDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    public VentasTicket findById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(VentasTicket.class, id);
        }
    }

    public void save(VentasTicket ticket) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.save(ticket);
            transaction.commit();
        }
    }

    public void update(VentasTicket ticket) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.update(ticket);
            transaction.commit();
        }
    }

    public void delete(VentasTicket ticket) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.delete(ticket);
            transaction.commit();
        }
    }

    public List<VentasTicket> findAll() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM VentasTicket", VentasTicket.class).list();
        }
    }   
    
}
