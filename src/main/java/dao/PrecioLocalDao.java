package dao;

import entidades.PrecioLocal;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

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

    public PrecioLocal obtenerPrecioPorIdChatarra(int idChatarra) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM PrecioLocal WHERE idChatarra = :idChatarra";
            Query<PrecioLocal> query = session.createQuery(hql, PrecioLocal.class);
            query.setParameter("idChatarra", idChatarra);
            return query.uniqueResult();
        }
    }

    public PrecioLocal obtenerPrecioPorIdChatarraYLocal(int idChatarra, int idLocal) {
        try (Session session = sessionFactory.openSession()) {
            Query<PrecioLocal> query = session.createQuery(
                    "FROM PrecioLocal WHERE idChatarra = :idChatarra AND idLocal = :idLocal", PrecioLocal.class);
            query.setParameter("idChatarra", idChatarra);
            query.setParameter("idLocal", idLocal);
            List<PrecioLocal> resultados = query.list();

            if (resultados.isEmpty()) {
                return null; // No se encontraron resultados
            } else if (resultados.size() == 1) {
                return resultados.get(0); // Devolver el único resultado
            } else {
                // Manejar la situación de múltiples resultados (si es necesario)
                // Aquí puedes lanzar una excepción, devolver el primer resultado, etc.
                // En este ejemplo, simplemente devolvemos el primer resultado.
                return resultados.get(0);
            }
        }
    }

    
    public PrecioLocal obtenerPrecioLocalPorIdLocalYIdChatarra(int idLocal, int idChatarra) {
    try (Session session = sessionFactory.openSession()) {
        // Corregir el nombre de la propiedad de la relación
        String hql = "SELECT pl FROM PrecioLocal pl " +
                     "JOIN pl.idlocal lv " +  // Corregir el nombre de la propiedad
                     "JOIN pl.chatarra c " +
                     "WHERE lv.idlocal = :idLocal AND c.idchatarra = :idChatarra";

        Query<PrecioLocal> query = session.createQuery(hql, PrecioLocal.class);
        query.setParameter("idLocal", idLocal);
        query.setParameter("idChatarra", idChatarra);

        return query.uniqueResult();
    }
}


}
