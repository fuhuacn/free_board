package action;

import com.opensymphony.xwork2.Action;
import constants.Constants;
import entity.FilelistEntity;
import manager.FilelistManager;
import manager.UploadfileManager;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import com.opensymphony.xwork2.ActionContext;

public class UploadAction extends BaseAction {
    private File uploadFile;
    private String uploadFileContentType; //得到文件的类型
    private String uploadFileFileName; //得到文件的名称
    private List<Map> files = new ArrayList<>();
    final static Logger logger = Logger.getLogger(UploadAction.class);

    private List<FilelistEntity> filelistEntityList=new ArrayList<>();
    private Integer page = 0;
    private long endPage;
    private Integer pageSize = 20;
    private long count;

    private Integer size=20;
    private String result;
    private Integer id;
    private String modifiedTime;
    private String fullName;
    private String fileName;

    private String value;
    @Override
    public String execute() throws Exception {
        String filePath = Constants.PICURL;
        File file = new File(filePath);
        if (!file.exists()) file.mkdirs();
        try {
            //保存文件
            String randomUri = UUID.randomUUID().toString();
            FileUtils.copyFile(uploadFile, new File(file, randomUri + uploadFileFileName));
            FilelistEntity filelistEntity=new FilelistEntity();
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date=new Date();
            modifiedTime=format.format(date);
            filelistEntity.setModifiedTime(modifiedTime);
            filelistEntity.setFullName(randomUri+uploadFileFileName);
            filelistEntity.setFileName(uploadFileFileName);
            FilelistManager.save(filelistEntity);

        } catch (IOException e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public String listFiles() {
        if(page == 0 && ActionContext.getContext().getSession().containsKey("currentPage")){
            page = (Integer) ActionContext.getContext().getSession().get("currentPage");
        }
        ActionContext.getContext().getSession().remove("currentPage");
        //获取pathName的File对象
        String pathName = Constants.PICURL;
        File dirFile = new File(pathName);
        //判断该文件或目录是否存在，不存在时在控制台输出提醒
        if (!dirFile.exists()) {
            logger.error("do not exist");
            return null;
        }
        //获取此目录下的所有文件名与目录名
        File[] fileList=dirFile.listFiles();
        Arrays.sort(fileList, new UploadfileManager.compratorByLastModified());
//        String[] fileList = dirFile.list();
        logger.info("size:" + fileList.length);
        count=fileList.length;
        if(count%this.pageSize > 0) {
            this.endPage = count/this.pageSize + 1;
        }
        else {
            this.endPage = count/this.pageSize;
        }
        long index=(page+1)*20;
        if(index>count){
            index=count;
        }
        for (int i = page*20; i < index ; i++) {
            //遍历文件目录
//            String string = fileList[i];
            //File("documentName","fileName")是File的另一个构造器
//            File file = new File(dirFile.getPath(), string);
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String name = fileList[i].getName();
            Long modifiedTime = fileList[i].lastModified();
            Date d = new Date(modifiedTime);
            Map param = new HashMap();
            param.put("fullName", name);
            if(name.length()>36){
                param.put("name", name.substring(36,name.length()));
            }else {
                param.put("name",name);
            }
            param.put("modifiedTime", format.format(d));
            files.add(param);
        }
        return SUCCESS;
    }
    //从数据库中查找
    public String findFileInDatabase(){
        if(page == 0 && ActionContext.getContext().getSession().containsKey("currentPage")){
            page = (Integer) ActionContext.getContext().getSession().get("currentPage");
        }
        ActionContext.getContext().getSession().remove("currentPage");
        count=FilelistManager.countAll();
        if(count%this.pageSize > 0) {
            this.endPage = count/this.pageSize + 1;
        }
        else {
            this.endPage = count/this.pageSize;
        }

        filelistEntityList=FilelistManager.findByProperty(null,page,size,"id",false);
        System.out.println(filelistEntityList.size());


        return Action.SUCCESS;
    }

    //删除文件
    public String deleteFile(){
        logger.info("ready for delete "+uploadFileFileName);
        try {
            String pathName = Constants.PICURL;
            File file = new File(pathName+"/"+uploadFileFileName);
            if (!file.exists()) {
                logger.info("do not exist");
                return null;
            }
            if(file.delete()) {
                logger.info("delete successfully "+uploadFileFileName);
            }else {
                logger.info("delete failed "+uploadFileFileName);
            }
            FilelistManager.deleteById(id);
        } catch(Exception e) {
            StringWriter sw = new StringWriter();
            e.printStackTrace(new PrintWriter(sw, true));
            String strs = sw.toString();
            logger.info(strs);
        }
        return SUCCESS;
    }

    //更新数据库
    public String updateFileDatabase(){
        List<FilelistEntity> filelistEntities=new ArrayList<>();
        truncateFile();
        String pathName = Constants.PICURL;
        File dirFile = new File(pathName);
        //判断该文件或目录是否存在，不存在时在控制台输出提醒
        if (!dirFile.exists()) {
            logger.error("do not exist");
            return Action.ERROR;
        }
        //获取此目录下的所有文件名与目录名
        File[] fileList=dirFile.listFiles();
        Arrays.sort(fileList, new UploadfileManager.compratorByLastModified());
        Collections.reverse(Arrays.asList(fileList));
//        String[] fileList = dirFile.list();
        logger.info("size:" + fileList.length);

        for (int i = 0; i < fileList.length; i++) {
            //遍历文件目录
//            String string = fileList[i];
            //File("documentName","fileName")是File的另一个构造器
//            File file = new File(dirFile.getPath(), string);
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String name = fileList[i].getName();
            Long modifiedTime = fileList[i].lastModified();
            Date d = new Date(modifiedTime);
//            Map param = new HashMap();
            FilelistEntity filelistEntity=new FilelistEntity();
            filelistEntity.setFullName(name);
            //param.put("fullName", name);
            if(name.length()>36){
                filelistEntity.setFileName(name.substring(36,name.length()));
//                param.put("name", name.substring(36,name.length()));
            }else {
                filelistEntity.setFileName(name);
//                param.put("name",name);
            }
            filelistEntity.setModifiedTime(format.format(d));
//            param.put("modifiedTime", format.format(d));
//            files.add(param);
//            FilelistManager.save(filelistEntity);
            filelistEntities.add(filelistEntity);
        }
        FilelistManager.save(filelistEntities);
        result="success";
        return Action.SUCCESS;
    }

    //清空数据库文件
    private void truncateFile(){
        FilelistManager.truncateFile();
    }

    //模糊查询
    public String fuzzySearch(){
        if(page == 0 && ActionContext.getContext().getSession().containsKey("currentPage")){
            page = (Integer) ActionContext.getContext().getSession().get("currentPage");
        }
        ActionContext.getContext().getSession().remove("currentPage");
        count=FilelistManager.countFuzzyAll(value);
        if(count%this.pageSize > 0) {
            this.endPage = count/this.pageSize + 1;
        }
        else {
            this.endPage = count/this.pageSize;
        }
        logger.info("fuzzy count:"+count);
        filelistEntityList=FilelistManager.fuzzyFindByFullName(value,page,size,"id",false);
        return Action.SUCCESS;
    }

    public File getUploadFile() {
        return uploadFile;
    }

    public void setUploadFile(File uploadFile) {
        this.uploadFile = uploadFile;
    }

    public String getUploadFileContentType() {
        return uploadFileContentType;
    }

    public void setUploadFileContentType(String uploadFileContentType) {
        this.uploadFileContentType = uploadFileContentType;
    }

    public List<Map> getFiles() {
        return files;
    }

    public void setFiles(List<Map> files) {
        this.files = files;
    }

    public String getUploadFileFileName() {
        return uploadFileFileName;
    }

    public void setUploadFileFileName(String uploadFileFileName) {
        this.uploadFileFileName = uploadFileFileName;
    }


    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public long getEndPage() {
        return endPage;
    }

    public void setEndPage(long endPage) {
        this.endPage = endPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public List<FilelistEntity> getFilelistEntityList() {
        return filelistEntityList;
    }

    public void setFilelistEntityList(List<FilelistEntity> filelistEntityList) {
        this.filelistEntityList = filelistEntityList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(String modifiedTime) {
        this.modifiedTime = modifiedTime;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
