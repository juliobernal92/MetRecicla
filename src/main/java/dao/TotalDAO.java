/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import entidades.Total;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import java.util.List;

public class TotalDAO {
    private final SessionFactory sessionFactory;

    public TotalDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void save(Total total) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.save(total);
            transaction.commit();
        }
    }

    public Total findById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Total.class, id);
        }
    }

    public void update(Total total) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.update(total);
            transaction.commit();
        }
    }

    public void delete(Total total) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.delete(total);
            transaction.commit();
        }
    }

    public List<Total> findAll() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM Total", Total.class).list();
        }
    }
}
