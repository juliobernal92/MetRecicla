package dao;

import entidades.Empleados;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class EmpleadosDao {

    private final SessionFactory sessionFactory;

    public EmpleadosDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Empleados findById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Empleados.class, id);
        }
    }

    public void save(Empleados empleados) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.save(empleados);
            transaction.commit();
        }
    }

    public void update(Empleados empleados) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.update(empleados);
            transaction.commit();
        }
    }

    public void delete(Empleados empleados) {
        try (Session session = sessionFactory.openSession()) {
            Transaction transaction = session.beginTransaction();
            session.delete(empleados);
            transaction.commit();
        }
    }

    public List<Empleados> findAll() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM Empleados", Empleados.class).list();
        }
    }

    public List<String> obtenerNombres() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("SELECT nombre FROM Empleados", String.class).list();
        }
    }

    public Empleados findByNombre(String nombre) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM Empleados WHERE nombre = :nombre", Empleados.class)
                    .setParameter("nombre", nombre)
                    .uniqueResult();
        }
    }

    public Empleados obtenerEmpleadoPorId(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Empleados.class, id);
        }
    }

    public String obtenerNombrePorId(int id) {
        try (Session session = sessionFactory.openSession()) {
            Empleados empleado = session.get(Empleados.class, id);
            if (empleado != null) {
                return empleado.getNombre();
            }
            return null;
        }
    }
}
