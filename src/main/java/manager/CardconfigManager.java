package manager;

import dao.CardconfigDao;
import entity.CardconfigEntity;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 付华
 * @create 2017/11/15 16:45
 * @since 1.0.0
 */
public class CardconfigManager {
    static CardconfigDao cardconfigDao=new CardconfigDao();
    public static List<CardconfigEntity> findAll(){
        return cardconfigDao.findByProperty(null,null,null,null,"layout",false);
    }
    public static CardconfigEntity findById(Integer id){
        return cardconfigDao.findById(id);
    }
    public static void save(CardconfigEntity c){
        cardconfigDao.save(c);
    }
    public static Integer saveCard(CardconfigEntity el){
      return  cardconfigDao.saveCard(el);
    }
    public static void update(CardconfigEntity c){
        cardconfigDao.update(c);
    }
    public static List<CardconfigEntity> findByBoardId(Integer id){
        Map params=new HashMap();
        params.put("boardId",id);
        return cardconfigDao.findByProperty(params,null,null,null,"layout",false);
    }
    public static void deleteById(int id){
        cardconfigDao.deleteByPrimaryKey(id);
    }
    public static long countByBoardId(int id){
        return cardconfigDao.countByBoardId(id);
    }
    public static List<CardconfigEntity> findByBoardId(Integer boardId,Integer page,Integer size){
        Map params=new HashMap();
        params.put("boardId",boardId);
        return cardconfigDao.findByProperty(params,page,size,"layout",false);
    }

}
