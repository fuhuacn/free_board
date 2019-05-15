package manager;

import dao.FilelistDao;
import entity.FilelistEntity;

import java.io.File;
import java.util.List;
import java.util.Map;

public class FilelistManager {
    public static FilelistDao filelistDao=new FilelistDao();

    public static void truncateFile(){
        filelistDao.truncateFile();

    }
    public static void save(List<FilelistEntity> filelistEntityList){
        filelistDao.save(filelistEntityList);
    }

    public static void save(FilelistEntity filelistEntity){
        filelistDao.save(filelistEntity);
    }

    public static long countAll(){
      return  filelistDao.countAll();
    }

    public static List<FilelistEntity> findAll(int page,int size){
        return filelistDao.findAll(page,size);
    }
    public static List<FilelistEntity> findByProperty(Map<String, Object> params,
                                                      Integer page,Integer size,String nameorder,boolean order){
        return filelistDao.findByProperty(params,page,size,nameorder,order);
    }

    public static FilelistEntity findById(Integer id){
        return filelistDao.findById(id);
    }

    public static void deleteById(Integer id){
        filelistDao.deleteByPrimaryKey(id);
    }

    public static long countFuzzyAll(String value){
       return  filelistDao.countFuzzyAll(value);
    }

    public static List<FilelistEntity> fuzzyFindByFullName(String value,Integer page,Integer size,String nameorder,boolean order){
        return filelistDao.fuzzyFindByFullName(value,page,size,nameorder,order);
    }

}
