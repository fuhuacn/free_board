package dao;

import com.free4lab.utils.sql.AbstractDAO;
import com.free4lab.utils.sql.IEntityManagerHelper;
import com.free4lab.utils.sql.entitymanager.NoCacheEntityManagerHelper;
import entity.DashboardconfigEntity;

/**
 * @author 付华
 * @create 2017/12/5 16:09
 * @since 1.0.0
 */
public class DashboardconfigDao extends AbstractDAO<DashboardconfigEntity> {
    public String getClassName() {
        return getEntityClass().getName();
    }

    @Override
    public Class<DashboardconfigEntity> getEntityClass() {
        return DashboardconfigEntity.class;
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
