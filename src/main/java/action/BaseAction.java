package action;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author 付华
 * @create 2017/11/6 15:55
 * @since 1.0.0
 */
public class BaseAction extends ActionSupport {
    private String message;
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
