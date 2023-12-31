/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import entidades.DetalleTicket;
import java.math.BigDecimal;
import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import java.util.List;

public class DetalleTicketDAO {

    private final SessionFactory sessionFactory;

    public DetalleTicketDAO(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public DetalleTicket findById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(DetalleTicket.class, id);
        }
    }

    public void save(DetalleTicket detalleTicket) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.save(detalleTicket);
            transaction.commit();
        }
    }

    public void update(DetalleTicket detalleTicket) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.update(detalleTicket);
            transaction.commit();
        }
    }

    public void delete(DetalleTicket detalleTicket) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.delete(detalleTicket);
            transaction.commit();
        }
    }

    public List<DetalleTicket> findAll() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM DetalleTicket", DetalleTicket.class).list();
        }
    }

    public DetalleTicket obtenerporID(int id) {
        return findById(id);
    }

    public List<DetalleTicket> obtenerPorIdTicket(int idticket) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM DetalleTicket WHERE idticket = :idticket";
            Query<DetalleTicket> query = session.createQuery(hql, DetalleTicket.class);
            query.setParameter("idticket", idticket);
            return query.getResultList(); // Obtén la lista de detalles
        }
    }

    public List<DetalleTicket> obtenerPorIdChatarra(int idChatarra) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM DetalleTicket WHERE chatarra.idchatarra = :idChatarra";
            Query<DetalleTicket> query = session.createQuery(hql, DetalleTicket.class);
            query.setParameter("idChatarra", idChatarra);
            return query.getResultList(); // Obtén la lista de detalles que corresponden al ID de la chatarra
        }
    }

    public boolean actualizarCantidadPorIdChatarra(int idChatarra, BigDecimal nuevaCantidad) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();

            // Consulta para actualizar la cantidad por idchatarra
            String hql = "UPDATE DetalleTicket SET cantidad = :nuevaCantidad WHERE chatarra.idchatarra = :idChatarra";
            Query<DetalleTicket> query = session.createQuery(hql);

            query.setParameter("nuevaCantidad", nuevaCantidad);
            query.setParameter("idChatarra", idChatarra);

            int filasActualizadas = query.executeUpdate();

            transaction.commit();

            return filasActualizadas > 0; // Retorna true si al menos una fila fue actualizada
        }
    }

}
