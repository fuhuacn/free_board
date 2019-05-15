package action;

import com.opensymphony.xwork2.Action;
import entity.CarddataEntity;
import manager.CarddataManager;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 付华
 * @create 2017/11/6 15:53
 * @since 1.0.0
 */
public class CarddataAction extends BaseAction {
    private String content;
    private String message = "";
    private String request;
    private List<Map> datas = new ArrayList<>();
    private JSONObject response;
    final static Logger logger = Logger.getLogger(CarddataAction.class);

    public String updateData() {
        try {
            logger.info("Request:" + request);
            JSONObject requestJSON = JSONObject.fromObject(request);
            Integer dataIdNum = null;
            try {
                dataIdNum = Integer.parseInt(requestJSON.getString("dataId"));
            } catch (Exception e) {
                message += "dataId wrong;";
            }
            CarddataEntity carddataEntity = CarddataManager.findById(dataIdNum);
            carddataEntity.setContent(requestJSON.getString("data"));
            CarddataManager.update(carddataEntity);
            Map responseMap = new HashMap();
            responseMap.put("id", dataIdNum);
            responseMap.put("status", "success");
            response = JSONObject.fromObject(responseMap);
        } catch (Exception e) {
            message += "json format wrong";
        }
        return Action.SUCCESS;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getRequest() {
        return request;
    }

    public void setRequest(String request) {
        this.request = request;
    }

    public JSONObject getResponse() {
        return response;
    }

    public void setResponse(JSONObject response) {
        this.response = response;
    }

    public List<Map> getDatas() {
        return datas;
    }

    public void setDatas(List<Map> datas) {
        this.datas = datas;
    }

    @Override
    public String getMessage() {
        return message;
    }

    @Override
    public void setMessage(String message) {
        this.message = message;
    }
}
