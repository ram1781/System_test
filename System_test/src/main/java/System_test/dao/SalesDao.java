package System_test.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import org.springframework.stereotype.Repository;

import System_test.dto.Orders;


@Repository
public class SalesDao {
	
	EntityManager em=Persistence.createEntityManagerFactory("ram").createEntityManager();
	EntityTransaction et=em.getTransaction();
	
	/* public Orders save(Orders order) {
		et.begin();
		em.persist(order);
		et.commit();
		return order;
	} */
	
	public Orders save(Orders order) {
        try {
            et.begin();
            em.persist(order);
            et.commit();
            return order;
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
            e.printStackTrace();
        }
        return null;
    }
}
