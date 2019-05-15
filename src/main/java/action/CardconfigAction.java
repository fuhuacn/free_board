package action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import entity.CardconfigEntity;
import entity.CarddataEntity;
import manager.CardconfigManager;
import manager.CarddataManager;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;

import javax.smartcardio.Card;
import java.util.*;

/**
 * @author 付华
 * @create 2017/11/15 16:46
 * @since 1.0.0
 */
public class CardconfigAction extends BaseAction {
    private List<Map> datas = new ArrayList<>();
    private String message = "";
    private String request;
    private JSONObject response;
    private Integer[] dataIds;
    private Integer newWide;
    private Integer newLength;
    private Integer changeId;
    private String cardname;
    private Integer boardId;
    final static Logger logger = Logger.getLogger(CardconfigAction.class);
    private List<CardconfigEntity> cardconfigEntityList=new ArrayList<>();
    private List<Map> list=new ArrayList<>();
    private Integer numOfCard=0;
    private String boardName="";
    private CardconfigEntity cardconfigEntity=null;
    private String typing="";
    private String title="";
    private String size="";
    private String bkcolor="";
    private Integer refresh;
    private String bordercolor="";
    private String titlebordercolor="";
    private String paddingbordercolor="";
    private Integer leftpadding;
    private Integer rightpadding;
    private Integer toppadding;
    private Integer bottompadding;
    private Integer leftmargin;
    private Integer rightmargin;
    private Integer topmargin;
    private Integer bottommargin;
    private Integer cardId;
    private String name="";
    private CarddataEntity carddataEntity=null;
    private String result="";
    private Integer carddataId;
    private String content="";
    private String orderlist="";

    private Integer page = 0;
    private long endPage;
    private Integer pageSize = 20;
    private long count;

    @Override
    public String execute() throws Exception {
        if(boardId==null) boardId=1;
        List<CardconfigEntity> cardconfigEntities = CardconfigManager.findByBoardId(boardId);
        doContent(cardconfigEntities);
        return Action.SUCCESS;
    }

    public String updateData() {
        doContent(new ArrayList<CardconfigEntity>());
        return Action.SUCCESS;
    }

    public List<Map> doContent(List<CardconfigEntity> cardconfigEntities) {
        int number = cardconfigEntities.size();
        Boolean ifConfig = true;
        if (number == 0) {
            number = dataIds.length;
            ifConfig = false;
        }
        int order = 0;//记录在前端的序号（前端是数组可以直接记录是第几个，数组就调用第几个，id是乱的不好调用）
        for (int i = 0; i < number; i++) {
            Map<String, Object> data = new HashMap<String, Object> ();
            CarddataEntity carddataEntity;
            if (ifConfig) {
                data.put("type", cardconfigEntities.get(i).getTyping());
                carddataEntity = CarddataManager.findById(cardconfigEntities.get(i).getDataid());
                try {
                    String[] size = cardconfigEntities.get(i).getSize().split(",");
                    data.put("length", size[0]);
                    data.put("wide", size[1]);
                } catch (Exception e) {
                    data.put("length", 4);
                    data.put("wide", 4);
                    //message += ";Id: " + cardconfigEntity.getId() + "length or wide error. Default to 33";
                    e.printStackTrace();
                }
                data.put("cardName",cardconfigEntities.get(i).getCardname());
                data.put("dataId", cardconfigEntities.get(i).getDataid());
                data.put("typing",cardconfigEntities.get(i).getTyping());
                data.put("title", cardconfigEntities.get(i).getTitle());
                data.put("bkcolor", cardconfigEntities.get(i).getBkcolor());
                data.put("layout", cardconfigEntities.get(i).getLayout());
                data.put("refresh", cardconfigEntities.get(i).getRefresh());
                data.put("id", cardconfigEntities.get(i).getId());
                data.put("borderColor", cardconfigEntities.get(i).getBordercolor());
                data.put("titleBorderColor",cardconfigEntities.get(i).getTitlebordercolor());
                data.put("paddingBorderColor",cardconfigEntities.get(i).getPaddingbordercolor());
                data.put("leftPadding",cardconfigEntities.get(i).getLeftpadding());
                data.put("rightPadding",cardconfigEntities.get(i).getRightpadding());
                data.put("topPadding",cardconfigEntities.get(i).getToppadding());
                data.put("bottomPadding",cardconfigEntities.get(i).getBottompadding());
                data.put("leftMargin",cardconfigEntities.get(i).getLeftmargin());
                data.put("rightMargin",cardconfigEntities.get(i).getRightmargin());
                data.put("topMargin",cardconfigEntities.get(i).getTopmargin());
                data.put("bottomMargin",cardconfigEntities.get(i).getBottommargin());
                data.put("order", order++);
            } else {
                carddataEntity = CarddataManager.findById(dataIds[i]);
            }
            String dataContent = carddataEntity.getContent();
            JSONObject jsonData = null;
            if (dataContent != null && !dataContent.equals("")){
                try{
                    jsonData = JSONObject.fromObject(dataContent);
                }catch (Exception e){
                    jsonData=null;
                    e.printStackTrace();
                    logger.error("JsonData format error");
                }
            }
            data.put("jsonData", jsonData);
            data.put("message", message);
            datas.add(data);
        }
        return datas;
    }

    public String addMonitor() {
        try {
            logger.info("Request:" + request);
            int radomInt;
            JSONObject jsonRequestObject = JSONObject.fromObject(request);
            String type = jsonRequestObject.getString("type");
            String title = jsonRequestObject.getString("title");
            Integer boardId = jsonRequestObject.getInt("boardId");
            Integer refresh = jsonRequestObject.getInt("refresh");
            try {
                radomInt = new Random().nextInt(999999999) + 1;
                CarddataEntity carddataEntity = new CarddataEntity();
                String data = "";
                if (jsonRequestObject.has("data")) {
                    data = jsonRequestObject.getString("data");
                }
                carddataEntity.setContent(data);
                carddataEntity.setId(radomInt);
                radomInt = SaveData.saveData(carddataEntity);
                CardconfigEntity cardconfigEntity = new CardconfigEntity();
                if (jsonRequestObject.has("backgroundColor")) {
                    String bkcolor = jsonRequestObject.getString("backgroundColor");
                    cardconfigEntity.setBkcolor(bkcolor);
                }
                String layout = "1";
                if (jsonRequestObject.has("layout")) {
                    layout = jsonRequestObject.getString("layout");
                }
                String size = "3,3";
                if (jsonRequestObject.has("layout")) {
                    size = jsonRequestObject.getString("size");
                }
                cardconfigEntity.setLayout(layout);
                cardconfigEntity.setDataid(radomInt);
                cardconfigEntity.setRefresh(refresh);
                cardconfigEntity.setSize(size);
                cardconfigEntity.setTitle(title);
                cardconfigEntity.setTyping(type);
                cardconfigEntity.setId(radomInt);
                cardconfigEntity.setBoardId(boardId);
                CardconfigManager.save(cardconfigEntity);
                Map responseMap = new HashMap();
                responseMap.put("id", radomInt);
                responseMap.put("status", "success");
                response = JSONObject.fromObject(responseMap);
            } catch (Exception e) {
                message += "Data format error";
            }
        } catch (Exception e) {
            message += "Request format error.";
        }
        return Action.SUCCESS;
    }
    public String changeSize(){
        try {
            CardconfigEntity cardconfigEntity=CardconfigManager.findById(changeId);
            cardconfigEntity.setSize(newLength+","+newWide);
            CardconfigManager.update(cardconfigEntity);
        }catch (Exception e){
            e.printStackTrace();
            message+="error";
        }
        return SUCCESS;
    }
    public String findAllCard(){

        if(page == 0 && ActionContext.getContext().getSession().containsKey("currentPage")){
            page = (Integer) ActionContext.getContext().getSession().get("currentPage");
        }
        ActionContext.getContext().getSession().remove("currentPage");
        count=CardconfigManager.countByBoardId(boardId);
        if(count%this.pageSize > 0) {
            this.endPage = count/this.pageSize + 1;
        }
        else {
            this.endPage = count/this.pageSize;
        }

        cardconfigEntityList=CardconfigManager.findByBoardId(boardId,page,pageSize);
        if(cardconfigEntityList.size()>0) {
            list = doContent(cardconfigEntityList);
        }
        System.out.println(list);
        return  Action.SUCCESS;
    }

    public String findCardDetails(){
        cardconfigEntity=CardconfigManager.findById(cardId);
        int carddataid=cardconfigEntity.getDataid();
        carddataEntity=CarddataManager.findById(carddataid);
        return Action.SUCCESS;
    }

    public String updateCard(){
        cardconfigEntity=CardconfigManager.findById(cardId);
        carddataEntity=CarddataManager.findById(carddataId);
        cardconfigEntity.setTyping(typing);
        cardconfigEntity.setTitle(title);
        cardconfigEntity.setSize(size);
        cardconfigEntity.setBkcolor(bkcolor);
        cardconfigEntity.setRefresh(refresh);
        cardconfigEntity.setBordercolor(bordercolor);
        cardconfigEntity.setTitlebordercolor(titlebordercolor);
        cardconfigEntity.setPaddingbordercolor(paddingbordercolor);
        cardconfigEntity.setLeftpadding(leftpadding);
        cardconfigEntity.setRightpadding(rightpadding);
        cardconfigEntity.setToppadding(toppadding);
        cardconfigEntity.setBottompadding(bottompadding);
        cardconfigEntity.setLeftmargin(leftmargin);
        cardconfigEntity.setRightmargin(rightmargin);
        cardconfigEntity.setTopmargin(topmargin);
        cardconfigEntity.setBottommargin(bottommargin);
        cardconfigEntity.setCardname(cardname);
        carddataEntity.setContent(content);
        CardconfigManager.update(cardconfigEntity);
        CarddataManager.update(carddataEntity);
        result="success";
        return Action.SUCCESS;
    }

    public String createCard(){
        cardconfigEntity=new CardconfigEntity();
        carddataEntity=new CarddataEntity();
        cardconfigEntity.setBoardId(boardId);
        cardconfigEntity.setTyping(typing);
        cardconfigEntity.setTitle(title);
        cardconfigEntity.setCardname(cardname);
        cardconfigEntity.setSize(size);
        cardconfigEntity.setBkcolor(bkcolor);
        cardconfigEntity.setRefresh(refresh);
        cardconfigEntity.setBordercolor(bordercolor);
        cardconfigEntity.setTitlebordercolor(titlebordercolor);
        cardconfigEntity.setPaddingbordercolor(paddingbordercolor);
        cardconfigEntity.setLeftpadding(leftpadding);
        cardconfigEntity.setRightpadding(rightpadding);
        cardconfigEntity.setToppadding(toppadding);
        cardconfigEntity.setBottompadding(bottompadding);
        cardconfigEntity.setLeftmargin(leftmargin);
        cardconfigEntity.setRightmargin(rightmargin);
        cardconfigEntity.setTopmargin(topmargin);
        cardconfigEntity.setBottommargin(bottommargin);
        if( content==""||content==null){
            content="{}";
        }
        carddataEntity.setContent(content);
//        List<CardconfigEntity> cardconfigcollec=new ArrayList<CardconfigEntity>();
//        cardconfigcollec.add(cardconfigEntity);
//        List<CarddataEntity> carddatacollec=new ArrayList<CarddataEntity>();
//        carddatacollec.add(carddataEntity);

        Integer newcardid=CardconfigManager.saveCard(cardconfigEntity);

        Integer newdataid=CarddataManager.saveCarddata(carddataEntity);

        cardconfigEntity=CardconfigManager.findById(newcardid);
        cardconfigEntity.setDataid(newdataid);
        CardconfigManager.update(cardconfigEntity);
        result="success";
        return Action.SUCCESS;
    }

    public String deleteCard(){
        cardconfigEntity=CardconfigManager.findById(cardId);
        carddataId=cardconfigEntity.getDataid();
        CarddataManager.deleteById(carddataId);
        CardconfigManager.deleteById(cardId);
        result="success";
        return Action.SUCCESS;
    }

    public String changeOrder(){


        String order[]=orderlist.split(",");
        order[0]=order[0].replaceAll("\"","");
        int size=order.length;
        for(int i=0;i<order.length-1;i++){
            int id=Integer.parseInt(order[i]);
            cardconfigEntity=CardconfigManager.findById(id);
            cardconfigEntity.setLayout(""+(size-i-1));
            CardconfigManager.update(cardconfigEntity);
        }
        result="success";
        return Action.SUCCESS;
    }

    public String getOrderlist() {
        return orderlist;
    }

    public void setOrderlist(String orderlist) {
        this.orderlist = orderlist;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getCarddataId() {
        return carddataId;
    }

    public void setCarddataId(Integer carddataId) {
        this.carddataId = carddataId;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public void setCardId(Integer cardId) {
        this.cardId = cardId;
    }

    public void setName(String name) {
        this.name = name;
    }

    public CarddataEntity getCarddataEntity() {
        return carddataEntity;
    }

    public void setCarddataEntity(CarddataEntity carddataEntity) {
        this.carddataEntity = carddataEntity;
    }

    public Integer getCardId() {
        return cardId;
    }

    public String getName() {
        return name;
    }

    public String getTyping() {
        return typing;
    }

    public void setTyping(String typing) {
        this.typing = typing;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getBkcolor() {
        return bkcolor;
    }

    public void setBkcolor(String bkcolor) {
        this.bkcolor = bkcolor;
    }

    public Integer getRefresh() {
        return refresh;
    }

    public void setRefresh(Integer refresh) {
        this.refresh = refresh;
    }

    public String getBordercolor() {
        return bordercolor;
    }

    public void setBordercolor(String bordercolor) {
        this.bordercolor = bordercolor;
    }

    public String getTitlebordercolor() {
        return titlebordercolor;
    }

    public void setTitlebordercolor(String titlebordercolor) {
        this.titlebordercolor = titlebordercolor;
    }

    public String getPaddingbordercolor() {
        return paddingbordercolor;
    }

    public void setPaddingbordercolor(String paddingbordercolor) {
        this.paddingbordercolor = paddingbordercolor;
    }

    public Integer getLeftpadding() {
        return leftpadding;
    }

    public void setLeftpadding(Integer leftpadding) {
        this.leftpadding = leftpadding;
    }

    public Integer getRightpadding() {
        return rightpadding;
    }

    public void setRightpadding(Integer rightpadding) {
        this.rightpadding = rightpadding;
    }

    public Integer getToppadding() {
        return toppadding;
    }

    public void setToppadding(Integer toppadding) {
        this.toppadding = toppadding;
    }

    public Integer getBottompadding() {
        return bottompadding;
    }

    public void setBottompadding(Integer bottompadding) {
        this.bottompadding = bottompadding;
    }

    public Integer getLeftmargin() {
        return leftmargin;
    }

    public void setLeftmargin(Integer leftmargin) {
        this.leftmargin = leftmargin;
    }

    public Integer getRightmargin() {
        return rightmargin;
    }

    public void setRightmargin(Integer rightmargin) {
        this.rightmargin = rightmargin;
    }

    public Integer getTopmargin() {
        return topmargin;
    }

    public void setTopmargin(Integer topmargin) {
        this.topmargin = topmargin;
    }

    public Integer getBottommargin() {
        return bottommargin;
    }

    public void setBottommargin(Integer bottommargin) {
        this.bottommargin = bottommargin;
    }

    public CardconfigEntity getCardconfigEntity() {
        return cardconfigEntity;
    }

    public void setCardconfigEntity(CardconfigEntity cardconfigEntity) {
        this.cardconfigEntity = cardconfigEntity;
    }

    public String getBoardName(){ return this.boardName;}

    public void setBoardName(String name){ this.boardName=name;}
    public List<Map> getList(){ return list;}

    public void setList(List<Map> list){ this.list=list;}

    public List<CardconfigEntity> getCardconfigEntityList(){ return this.cardconfigEntityList;}

    public void setCardconfigEntityList(List<CardconfigEntity> card){ this.cardconfigEntityList=card;}

    public Integer getNumOfCard(){ return numOfCard;}

    public void setNumOfCard(Integer num){ this.numOfCard=num;}

    public Integer getBoardId() {
        return boardId;
    }

    public void setBoardId(Integer boardId) {
        this.boardId = boardId;
    }

    public Integer getNewWide() {
        return newWide;
    }

    public void setNewWide(Integer newWide) {
        this.newWide = newWide;
    }

    public Integer getNewLength() {
        return newLength;
    }

    public void setNewLength(Integer newLength) {
        this.newLength = newLength;
    }

    public Integer getChangeId() {
        return changeId;
    }

    public void setChangeId(Integer changeId) {
        this.changeId = changeId;
    }

    public List<Map> getDatas() {
        return datas;
    }

    public void setDatas(List<Map> datas) {
        this.datas = datas;
    }

    public String getRequest() {
        return request;
    }

    public void setRequest(String request) {
        this.request = request;
    }

    public Integer[] getDataIds() {
        return dataIds;
    }

    public void setDataIds(Integer[] dataIds) {
        this.dataIds = dataIds;
    }

    public String getCardname() {
        return cardname;
    }

    public void setCardname(String cardname) {
        this.cardname = cardname;
    }

    @Override
    public String getMessage() {
        return message;
    }

    @Override
    public void setMessage(String message) {
        this.message = message;
    }

    public JSONObject getResponse() {
        return response;
    }

    public void setResponse(JSONObject response) {
        this.response = response;
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
}
