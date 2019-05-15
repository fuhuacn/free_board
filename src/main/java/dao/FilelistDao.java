package dao;

import com.free4lab.utils.sql.AbstractDAO;
import com.free4lab.utils.sql.IEntityManagerHelper;
import com.free4lab.utils.sql.entitymanager.NoCacheEntityManagerHelper;
import entity.FilelistEntity;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;

import org.hibernate.FlushMode;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class FilelistDao extends AbstractDAO<FilelistEntity> {
    public String getClassName() {
        return getEntityClass().getName();
    }

    @Override
    public Class<FilelistEntity> getEntityClass() {
        return FilelistEntity.class;
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

    public void truncateFile(){
        EntityManager em = getEntityManager();

        if (em.getTransaction().isActive()) {
            em.getTransaction().rollback();
            log("A transaction is still active before another begin, we have to roll back it!", Level.SEVERE, null);
        }
        em.getTransaction().begin();
        log("truncate fileList ", Level.INFO, null);
        Transaction tx=null;
        Session session=(Session)em.getDelegate();
        try{
            tx=session.beginTransaction();
            session.createSQLQuery("truncate table filelist").executeUpdate();
            tx.commit();
        }catch(Exception e){
            tx.rollback();
            e.printStackTrace();
        }finally{
            //session.close();
        }
    }

    public long countFuzzyAll(String value){
        String property="fullName";
        log("fuzzy search " + getClassName() + " instance with property: "
                + property + ", value: " + value, Level.INFO, null);
        try {
            final String queryString = "select count(model)" +
                    " from " + getClassName() + " model" +
                    " where model." + property + " like :propertyValue";
            Query query = getEntityManager().createQuery(queryString);
            query.setParameter("propertyValue", "%"+value+"%");
            Long count = (Long)query.getSingleResult();
            return count.longValue();
        } catch (RuntimeException re) {
            log("fuzzy search: count by property name failed",
                    Level.SEVERE, re);
            throw re;
        }
    }

    public List<FilelistEntity> fuzzyFindByFullName(String value,Integer page,Integer size,String nameorder,boolean order){
        Map<String,Object> params=new HashMap<>();
        params.put("fullName",value);
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
                    queryString += " model."+entry.getKey()+" like :value"+entry.getKey();
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
            Query query = getEntityManager().createQuery(queryString);
            if (null != params && params.size()>0)
                for(Map.Entry<String,Object> entry : params.entrySet())
                {
                    query.setParameter("value"+entry.getKey(), "%"+entry.getValue()+"%");
                    queryString = queryString.replaceAll(":value"+entry.getKey(), ""+entry.getValue());
                }
            log(queryString, Level.INFO, null);
            if(page != null && size != null)
                query.setMaxResults(size.intValue()).setFirstResult(page.intValue() * size.intValue());
            return query.getResultList();
        } catch (RuntimeException re) {
            log("find by property name*N failed",
                    Level.SEVERE, re);
            throw re;
        }
    }

}
