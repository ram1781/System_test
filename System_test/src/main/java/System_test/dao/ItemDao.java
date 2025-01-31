package System_test.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import org.springframework.stereotype.Repository;

import System_test.dto.Items;

@Repository
public class ItemDao {
	EntityManager em=Persistence.createEntityManagerFactory("ram").createEntityManager();
	EntityTransaction et=em.getTransaction();

	 public Items save(Items item) {
	        try {
	            et.begin();
	            em.persist(item);
	            et.commit();
	            return item;
	        } catch (Exception e) {
	            if (et.isActive()) {
	                et.rollback();
	            }
	            e.printStackTrace();
	        }
	        return null;
	    }	
}
