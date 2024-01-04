/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entidades.DetallesVentas;
import java.math.BigDecimal;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Doomed666
 */
public class DetallesVentasDao {
    private final SessionFactory sessionFactory;

    public DetallesVentasDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public DetallesVentas findById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(DetallesVentas.class, id);
        }
    }

    public void save(DetallesVentas detallesVentas) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.save(detallesVentas);
            transaction.commit();
        }
    }

    public void update(DetallesVentas detallesVentas) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.update(detallesVentas);
            transaction.commit();
        }
    }

    public void delete(DetallesVentas detallesVentas) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.delete(detallesVentas);
            transaction.commit();
        }
    }

    public List<DetallesVentas> findAll() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM DetalleTicket", DetallesVentas.class).list();
        }
    }

    public DetallesVentas obtenerporID(int id) {
        return findById(id);
    }

    public List<DetallesVentas> obtenerPorIdTicket(int idticket) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM DetallesVentas WHERE idventaticket = :idventaticket";
            Query<DetallesVentas> query = session.createQuery(hql, DetallesVentas.class);
            query.setParameter("idventaticket", idticket);
            return query.getResultList(); // Obtén la lista de detalles
        }
    }

    public List<DetallesVentas> obtenerPorIdePrecioLocal(int idPrecioLocal) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM DetalleTicket WHERE preciolocal.idpreciolocal = :idPreciolocal";
            Query<DetallesVentas> query = session.createQuery(hql, DetallesVentas.class);
            query.setParameter("idPreciolocal", idPrecioLocal);
            return query.getResultList(); // Obtén la lista de detalles que corresponden al ID de la chatarra
        }
    }

    public boolean actualizarCantidadPorIdPrecioLocal(int idChatarra, BigDecimal nuevaCantidad) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();

            // Consulta para actualizar la cantidad por idchatarra
            String hql = "UPDATE DetallesVentas SET cantidad = :nuevaCantidad WHERE localesventas.idchatarra = :idChatarra";
            Query<DetallesVentas> query = session.createQuery(hql);

            query.setParameter("nuevaCantidad", nuevaCantidad);
            query.setParameter("idChatarra", idChatarra);

            int filasActualizadas = query.executeUpdate();

            transaction.commit();

            return filasActualizadas > 0; // Retorna true si al menos una fila fue actualizada
        }
    }
    
}
