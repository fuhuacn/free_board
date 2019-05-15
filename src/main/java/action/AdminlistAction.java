package action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
import entity.AdminlistEntity;
import manager.AdminlistManager;

import org.hibernate.QueryException;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


public class AdminlistAction extends BaseAction {
    private String wrongOfEmailOrPsw;
    private String result;
    private String password="";

    public String execute(){

        ActionContext context = ActionContext.getContext();
        HttpServletRequest request = ServletActionContext.getRequest();
        String emailAdd = request.getParameter("email");
        String password = request.getParameter("psw");
        List<AdminlistEntity> adminlistEntities = AdminlistManager.findByEmail(emailAdd);
        if(null == adminlistEntities || adminlistEntities.size() ==0 ){
            wrongOfEmailOrPsw="true";
            return ERROR;
        }else{
            List<AdminlistEntity> adminlistEntities2 = AdminlistManager.findByEmailandPassword(emailAdd,password);
            if(null == adminlistEntities2 || adminlistEntities2.size() ==0 ){
                wrongOfEmailOrPsw="true";
                return ERROR;
            }
            else{

                ActionContext.getContext().getSession().put("email", emailAdd);
                ActionContext.getContext().getSession().put("status", "login");
                return SUCCESS;
            }
        }
    }
    public String logout(){
        ActionContext.getContext().getSession().remove("email");
        ActionContext.getContext().getSession().remove("status");
        return SUCCESS;
    }
    public String modify(){
        HttpServletRequest request = ServletActionContext.getRequest();
        Object emailLogin = ActionContext.getContext().getSession().get("email");
        String old_pwd = request.getParameter("old_password");
        String new_pwd = request.getParameter("new_password");
        String emailAdd = emailLogin.toString();
        System.out.println(emailAdd + old_pwd);
        List<AdminlistEntity> adminlistEntities = AdminlistManager.findByEmailandPassword(emailAdd,old_pwd);
        if(null == adminlistEntities || adminlistEntities.size() ==0 ){
            return Action.ERROR;
        }
        else{
            List<AdminlistEntity> adminlistEntities2 = AdminlistManager.findByEmail(emailAdd);
            AdminlistEntity adminlistEntity = null;
            adminlistEntity = adminlistEntities2.get(0);
            adminlistEntity.setPassword(new_pwd);
            AdminlistManager.update(adminlistEntity);
            result = "success";
            return Action.SUCCESS;
        }
    }

    public String getWrongOfEmailOrPsw() {
        return wrongOfEmailOrPsw;
    }

    public void setWrongOfEmailOrPsw(String wrongOfEmailOrPsw) {
        this.wrongOfEmailOrPsw = wrongOfEmailOrPsw;
    }

    public String getResult() {
        return this.result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
