package action;
import com.opensymphony.xwork2.Action;
import entity.CardconfigEntity;
import entity.CarddataEntity;
import entity.DashboardconfigEntity;
import manager.CardconfigManager;
import manager.CarddataManager;
import manager.DashboardconfigManager;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;

import java.util.*;

public class BoardDetailsAction extends BaseAction {
    private Integer boardId;
    private List<CardconfigEntity> cardconfigEntityList=new ArrayList<>();
    private DashboardconfigEntity dashboardconfigEntities;
    private List<Map> list=new ArrayList<>();
    final static Logger logger = Logger.getLogger(CardconfigAction.class);
    private Integer numOfCard=0;
    private int page=0;
    public String execute(){

        dashboardconfigEntities= DashboardconfigManager.findConfig(boardId);

        return  Action.SUCCESS;

    }

    public String cardList(){
        CardconfigAction card=new CardconfigAction();
        cardconfigEntityList = CardconfigManager.findByBoardId(boardId);
        list=card.doContent(cardconfigEntityList);
        numOfCard=cardconfigEntityList.size();
        return  Action.SUCCESS;
    }

    public List<Map> getList(){ return list;}

    public void setList(List<Map> list){ this.list=list;}

    public int getPage(){return this.page;}

    public void setPage(int page) {this.page=page;}

    public List<CardconfigEntity> getCardconfigEntityList(){ return this.cardconfigEntityList;}

    public void setCardconfigEntityList(List<CardconfigEntity> card){ this.cardconfigEntityList=card;}

    public DashboardconfigEntity getDashboardconfigEntities(){ return this.dashboardconfigEntities;}

    public void setDashboardconfigEntities(DashboardconfigEntity dash){ this.dashboardconfigEntities=dash;}

    public Integer getNumOfCard(){ return numOfCard;}

    public void setNumOfCard(Integer num){ this.numOfCard=num;}
    public Integer getBoardId() {
        return boardId;
    }

    public void setBoardId(Integer boardId) {
        this.boardId = boardId;
    }


}
