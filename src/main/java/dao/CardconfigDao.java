package dao;

import com.free4lab.utils.sql.AbstractDAO;
import com.free4lab.utils.sql.IEntityManagerHelper;
import com.free4lab.utils.sql.entitymanager.NoCacheEntityManagerHelper;
import entity.CardconfigEntity;
import manager.CarddataManager;
import org.hibernate.FlushMode;
import org.hibernate.Session;

import javax.persistence.EntityManager;
import java.util.logging.Level;
import javax.persistence.Query;
import java.util.List;
import java.util.Map;

/**
 * @author 付华
 * @create 2017/11/6 16:11
 * @since 1.0.0
 */
public class CardconfigDao extends AbstractDAO<CardconfigEntity> {
    public String getClassName() {
        return getEntityClass().getName();
    }

    @Override
    public Class<CardconfigEntity> getEntityClass() {
        return CardconfigEntity.class;
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

    public Integer saveCard(CardconfigEntity cardconfigEntity){
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
            session.save(cardconfigEntity);
            id=cardconfigEntity.getId();
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
    public long countByBoardId(int id){ return countByProperty("boardId",id);}

    public List<CardconfigEntity> findByProperty(Map<String, Object> params,
                                                 Integer page, Integer size, String nameorder, boolean order) {
        try {
            String queryString = "select model from " + getClassName() + " model";
            int top = 1;
            if (null != params && params.size()>0)
                for(Map.Entry<String,Object> entry : params.entrySet())
                {
                    if (1 == top)
                        queryString += " where";
                    else
                        queryString += " and";
                    queryString += " model."+entry.getKey()+" = :value"+entry.getKey();
                    top++;
                }
            if(nameorder != null)
            {
                queryString += " order by model."+nameorder;
                if(order)
                    queryString+=" ASC";
                else
                    queryString+=" DESC";
            }
            EntityManager em=getEntityManager();
            em.clear();
            Query query = em.createQuery(queryString);
            ((org.hibernate.ejb.QueryImpl)query).getHibernateQuery().setCacheable(false);
            //query.setHint("javax.persistence.cache.retrieveMode",CacheRetrieveMode.BYPASS);
            if (null != params && params.size()>0)
                for(Map.Entry<String,Object> entry : params.entrySet())
                {
                    query.setParameter("value"+entry.getKey(), entry.getValue());
                    queryString = queryString.replaceAll(":value"+entry.getKey(), ""+entry.getValue());
                }
            log(queryString, Level.INFO, null);
            if(page != null && size != null)
                query.setMaxResults(size.intValue()).setFirstResult(page.intValue() * size.intValue());
            List<CardconfigEntity> list=query.getResultList();
            for(CardconfigEntity s:list){
                em.refresh(s);
            }
            return list;
        } catch (RuntimeException re) {
            log("find by property name*N failed",
                    Level.SEVERE, re);
            throw re;
        }
    }
}
