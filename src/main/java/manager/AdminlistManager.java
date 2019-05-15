package manager;

import dao.AdminlistDao;
import entity.AdminlistEntity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class AdminlistManager {
    static AdminlistDao adminlistDao=new AdminlistDao();

    public static AdminlistEntity findById(Integer id){
        return adminlistDao.findById(id);
    }

    public static List<AdminlistEntity> findByEmail(String emailAdd){
        Map params=new HashMap();
        params.put("emailAdd",emailAdd);
        return adminlistDao.findByProperty(params,null,null,null,null,false);
    }

    public static List<AdminlistEntity> findByEmailandPassword(String emailAdd, String password){
        Map params=new HashMap();
        params.put("emailAdd",emailAdd);
        params.put("password",password);
        return adminlistDao.findByProperty(params,null,null,null,null,false);
    }
    public static void update(AdminlistEntity a){
        adminlistDao.update(a);
    }
}
