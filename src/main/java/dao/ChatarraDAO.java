package dao;


import entidades.Chatarra;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import java.util.List;
import org.hibernate.query.Query;

public class ChatarraDAO {

    private final SessionFactory sessionFactory;

    public ChatarraDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Chatarra findById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Chatarra.class, id);
        }
    }

    public void save(Chatarra chatarra) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.save(chatarra);
            transaction.commit();
        }
    }

    public void update(Chatarra chatarra) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.update(chatarra);
            transaction.commit();
        }
    }

    public void delete(Chatarra chatarra) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.delete(chatarra);
            transaction.commit();
        }
    }

    public List<Chatarra> findAll() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM Chatarra", Chatarra.class).list();
        }
    }

    public List<String> obtenerNombresChatarra() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("SELECT nombre FROM Chatarra", String.class).list();
        }
    }

    public Chatarra findByNombre(String nombre) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM Chatarra WHERE nombre = :nombre", Chatarra.class)
                    .setParameter("nombre", nombre)
                    .uniqueResult();
        }
    }

    public Chatarra obtenerChatarraPorId(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Chatarra.class, id);
        }
    }

    public String obtenerNombrePorId(int id) {
        try (Session session = sessionFactory.openSession()) {
            Chatarra chatarra = session.get(Chatarra.class, id);
            if (chatarra != null) {
                return chatarra.getNombre();
            }
            return null; // Si no se encuentra la Chatarra con ese ID, devuelve null o puedes manejarlo de otra manera según tus necesidades.
        }
    }

}
