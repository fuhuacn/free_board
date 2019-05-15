package dao;

import com.free4lab.utils.sql.AbstractDAO;
import com.free4lab.utils.sql.IEntityManagerHelper;
import com.free4lab.utils.sql.entitymanager.NoCacheEntityManagerHelper;
import entity.CarddataEntity;
import org.hibernate.FlushMode;
import org.hibernate.Session;

import javax.persistence.EntityManager;
import java.io.Serializable;
import java.util.logging.Level;

/**
 * @author 付华
 * @create 2017/11/6 16:11
 * @since 1.0.0
 */
public class CarddataDao extends AbstractDAO<CarddataEntity> {
    public String getClassName() {
        return getEntityClass().getName();
    }

    @Override
    public Class<CarddataEntity> getEntityClass() {
        return CarddataEntity.class;
    }
    public static final String PU_NAME = "Monitor_PU";

    @Override
    public String getPUName() {
        return PU_NAME;
    }

    @Override
    public IEntityManagerHelper getEntityManagerHelper() {
        return new NoCacheEntityManagerHelper();
    }

    public Integer saveCarddata(CarddataEntity carddataEntity){
        EntityManager em = getEntityManager();
        Integer id;
        if (em.getTransaction().isActive()) {
            em.getTransaction().rollback();
            log("A transaction is still active before another begin, we have to roll back it!", Level.SEVERE, null);
        }

        em.getTransaction().begin();

        log("saving " + getClassName() + " instance", Level.INFO, null);
        try {
            Session session = (Session) em.getDelegate();
            session.setFlushMode(FlushMode.MANUAL);
            Serializable result=session.save(carddataEntity);
            id=carddataEntity.getId();
            session.flush();
            session.clear();
            log("save successful", Level.INFO, null);
            em.getTransaction().commit();
            return id;
        } catch (RuntimeException re) {
            log("save failed", Level.SEVERE, re);
            em.getTransaction().rollback();
            throw re;
        }
    }
}
