/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import entidades.Ticket;
import org.hibernate.Session;
import org.hibernate.Transaction;
import java.util.List;
import org.hibernate.SessionFactory;

public class TicketDAO {

    private final SessionFactory sessionFactory;

    public TicketDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Ticket findById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Ticket.class, id);
        }
    }

    public void save(Ticket ticket) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.save(ticket);
            transaction.commit();
        }
    }

    public void update(Ticket ticket) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.update(ticket);
            transaction.commit();
        }
    }

    public void delete(Ticket ticket) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.delete(ticket);
            transaction.commit();
        }
    }

    public List<Ticket> findAll() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM Ticket", Ticket.class).list();
        }
    }
}
