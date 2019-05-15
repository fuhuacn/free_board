package dao;

import com.free4lab.utils.sql.AbstractDAO;
import com.free4lab.utils.sql.IEntityManagerHelper;
import com.free4lab.utils.sql.entitymanager.NoCacheEntityManagerHelper;
import entity.AdminlistEntity;
import org.hibernate.FlushMode;
import org.hibernate.Session;

import javax.persistence.EntityManager;
import java.util.logging.Level;

public class AdminlistDao extends AbstractDAO<AdminlistEntity>{
    public String getClassName() {
        return getEntityClass().getName();
    }

    @Override
    public Class<AdminlistEntity> getEntityClass() {
        return AdminlistEntity.class;
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

}
