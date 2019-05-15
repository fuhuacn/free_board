package manager;

import dao.DashboardconfigDao;
import entity.DashboardconfigEntity;

import java.util.List;

/**
 * @author 付华
 * @create 2017/12/5 16:12
 * @since 1.0.0
 */
public class DashboardconfigManager {
    static DashboardconfigDao dashboardconfigDao=new DashboardconfigDao();
    public static DashboardconfigEntity findConfig(Integer id){
        return dashboardconfigDao.findByPrimaryKey(id);
    }
    public static List<DashboardconfigEntity> findAll(){
        return dashboardconfigDao.findByProperty(null,null,null,"layout",false);
    }
    public static List<DashboardconfigEntity> findAll(int page, int size){
        return dashboardconfigDao.findAll(page,size);
    }
    public static void createBoard(DashboardconfigEntity d){ dashboardconfigDao.save(d);}
    public static void deleteById(int id){
        dashboardconfigDao.deleteByPrimaryKey(id);
    }
    public static void updateBoard(DashboardconfigEntity d){
        dashboardconfigDao.update(d);

    }
}
