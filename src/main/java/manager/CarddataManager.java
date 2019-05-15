package manager;

import dao.CarddataDao;
import entity.CarddataEntity;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 付华
 * @create 2017/11/6 16:13
 * @since 1.0.0
 */
public class CarddataManager {
    static CarddataDao carddataDao =new CarddataDao();
    public static CarddataEntity findById(Integer id){
        return carddataDao.findById(id);
    }
    public static void save(CarddataEntity c){
        carddataDao.save(c);
    }
    public static Integer saveCarddata(CarddataEntity el){ return carddataDao.saveCarddata(el);}
    public static void update(CarddataEntity c){
        carddataDao.update(c);
    }
    public static void deleteById(int id){
        carddataDao.deleteByPrimaryKey(id);
    }
}
