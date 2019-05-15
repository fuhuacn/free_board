package action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import constants.Constants;
import entity.CardconfigEntity;
import entity.CarddataEntity;
import entity.DashboardconfigEntity;
import manager.CardconfigManager;
import manager.CarddataManager;
import manager.DashboardconfigManager;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.log4j.Logger;

import java.io.File;
import java.util.*;

/**
 * @author 付华
 * @create 2017/12/5 16:13
 * @since 1.0.0
 */
public class DashboardconfigAction extends BaseAction {
    private Integer boardId;
    private List<DashboardconfigEntity> dashboardconfigEntityList = new ArrayList<>();
    final static Logger logger = Logger.getLogger(DashboardconfigAction.class);
    private String bannerColor;
    private String logo;
    private String bkColor;
    private String bkPic;
    private String ifBanner;
    private String footerColor;
    private String footerText;
    private String ifFooter;
    private Integer width;
    private String title;
    private Boolean ifCover;
    private String bannerFontColor;
    private String bannerLabelColor;
    private String bannerLineColor;
    private String coverTitle = "";
    private String coverSubTitle = "";
    private Integer coverHeight;
    private String coverFontColor = "";
    private String bkgColor = "";
    private String coverUrl = "";
    private List<Map> coverButtons = new ArrayList<>();
    private List<Map> coverList = new ArrayList<>();
    private List<Integer> coverIndex = new ArrayList<>();
    private Integer numOfBoard = 0;
    private String result;
  //  private int page = 0;
    private String displayName = "";
    private String showBanner = "";
    private String cover = "";
    private DashboardconfigEntity dashboardconfigEntities;

    private Integer page = 0;
    private long endPage;
    private Integer pageSize = 20;
    private long count;

    @Override
    public String execute() throws Exception {
        dashboardconfigEntityList = DashboardconfigManager.findAll();
        numOfBoard = dashboardconfigEntityList.size();
        if (boardId == null) boardId = 1;
        DashboardconfigEntity dashboardconfigEntity = DashboardconfigManager.findConfig(boardId);
        if (dashboardconfigEntity != null) {
            bannerColor = dashboardconfigEntity.getBannerColor();
            logo = dashboardconfigEntity.getLogo();
            bkColor = dashboardconfigEntity.getBkColor();
            bkPic = dashboardconfigEntity.getBkPic();
            ifBanner = dashboardconfigEntity.getIfBanner();
            footerColor = dashboardconfigEntity.getFooterColor();
            footerText = dashboardconfigEntity.getFooterText();
            ifFooter = dashboardconfigEntity.getIfFooter();
            width = dashboardconfigEntity.getWidth();
            title = dashboardconfigEntity.getTitle();
            bannerFontColor = dashboardconfigEntity.getBannerFontColor();
            bannerLabelColor = dashboardconfigEntity.getBannerLabelColor();
            bannerLineColor = dashboardconfigEntity.getBannerLineColor();
            String cover = dashboardconfigEntity.getCover();
            //System.out.println(cover);
            try {
                JSONObject covers = JSONObject.fromObject(cover);
                JSONArray coverarr = covers.getJSONArray("cover");
                for (int j = 0; j < coverarr.size(); j++) {
                    JSONObject coverJson = JSONObject.fromObject(coverarr.get(j));
                    Map maps = new HashMap();
                    if (coverJson.has("index")) {
                        String index = coverJson.getString("index");
                        maps.put("coverIndex", index);
                        coverIndex.add(Integer.parseInt(index));
                    }
                    if (coverJson.has("url")) {
                        coverUrl = coverJson.getString("url");
                        maps.put("coverUrl", coverUrl);
                    }
                    if (coverJson.has("bkgColor")) {
                        bkgColor = coverJson.getString("bkgColor");
                        maps.put("bkgColor", bkgColor);
                    }
                    if (coverJson.has("title")) {
                        coverTitle = coverJson.getString("title");
                        maps.put("coverTitle", coverTitle);
                    }
                    if (coverJson.has("subTitle")) {
                        coverSubTitle = coverJson.getString("subTitle");
                        maps.put("coverSubTitle", coverSubTitle);
                    }
                    if (coverJson.has("height")) {
                        try {
                            coverHeight = coverJson.getInt("height");
                            maps.put("coverHeight", coverHeight);
                        } catch (Exception e) {
                            logger.error("Height format error.");
                        }
                    }
                    if (coverJson.has("fontColor")) {
                        coverFontColor = coverJson.getString("fontColor");
                        maps.put("coverFontColor", coverFontColor);
                    }
                    if (coverJson.has("buttons")) {
                        JSONArray coverButtonsArray = coverJson.getJSONArray("buttons");
                        List<Map> coverButtons = new ArrayList<>();
                        for (int i = 0; i < coverButtonsArray.size(); i++) {
                            JSONObject coverButtonJson = coverButtonsArray.getJSONObject(i);
                            Map coverButton = new HashMap();
                            if (coverButtonJson.has("name") && coverButtonJson.has("href")) {
                                coverButton.put("name", coverButtonJson.get("name"));
                                coverButton.put("href", coverButtonJson.get("href"));
                                if (coverButtonJson.has("textBorderColor")) {
                                    coverButton.put("textBorderColor", coverButtonJson.get("textBorderColor"));
                                }
                                if (coverButtonJson.has("bkgColor")) {
                                    coverButton.put("bkgColor", coverButtonJson.get("bkgColor"));
                                }
                                coverButtons.add(coverButton);
                            }
                        }
                        maps.put("coverButtons", coverButtons);
                    }
                    coverList.add(maps);
                }
                ifCover = true;
            } catch (Exception e) {
                logger.error("Cover Json error.");
                ifCover = false;
            }

        }else{
            return INPUT;
        }
        return SUCCESS;

    }
    public String findBoard(){
        if(page == 0 && ActionContext.getContext().getSession().containsKey("currentPage")){
            page = (Integer) ActionContext.getContext().getSession().get("currentPage");
        }
        ActionContext.getContext().getSession().remove("currentPage");
        count = DashboardconfigManager.findAll().size();
        if(count%this.pageSize > 0) {
            this.endPage = count/this.pageSize + 1;
        }
        else {
            this.endPage = count/this.pageSize;
        }
        dashboardconfigEntityList=DashboardconfigManager.findAll(page,pageSize);

        return Action.SUCCESS;
    }

    public String findBoardDetails() {
        dashboardconfigEntities = DashboardconfigManager.findConfig(boardId);

        return Action.SUCCESS;
    }

    public String deleteBoard() {
        if (boardId == null) {
            return Action.ERROR;
        }
        List<CardconfigEntity> cards = CardconfigManager.findByBoardId(boardId);
        List<Integer> datas = new ArrayList<>();
        int cardCnt = 0 ;
        for (CardconfigEntity c : cards) {
            cardCnt++;
            int id = c.getId();
            datas.add(id);
        }
        System.out.print("card" + cardCnt );
        for (int i : datas) {
            CarddataManager.deleteById(i);
            CardconfigManager.deleteById(i);
        }

        if(cardCnt != 0 ){
            return Action.ERROR;
        }

        DashboardconfigManager.deleteById(boardId);
        result = "success";
        return Action.SUCCESS;
    }

    public String deleteBoardCheck() {
        if (boardId == null) {
            return Action.ERROR;
        }
        List<CardconfigEntity> cards = CardconfigManager.findByBoardId(boardId);
        List<Integer> datas = new ArrayList<>();
        int cardCnt = 0 ;
        for (CardconfigEntity c : cards) {
            cardCnt++;
            int id = c.getId();
            datas.add(id);
        }
        if(cardCnt != 0 ){
            return Action.ERROR;
        }
        else{
            result = "success";
            return Action.SUCCESS;
        }
    }

    public String createBoard() {

        if (ifBanner.equals("true")) {
            ifBanner = "exist";
        } else ifBanner = "no";
        if (ifFooter.equals("true")) {
            ifFooter = "exist";
        } else ifFooter = "no";
        if (showBanner.equals("true")) showBanner = "1";
        else showBanner = "0";
        DashboardconfigEntity board = new DashboardconfigEntity();
        board.setIfBanner(ifBanner);
        board.setBannerColor(bannerColor);
        board.setLogo(logo);
        board.setBkColor(bkColor);
        board.setName(displayName);
        board.setShowBanner(Integer.parseInt(showBanner));
        board.setIfFooter(ifFooter);
        board.setFooterColor(footerColor);
        board.setFooterText(footerText);
        board.setCover(cover);
        board.setBannerFontColor(bannerFontColor);
        board.setBannerLabelColor(bannerLabelColor);
        board.setBannerLineColor(bannerLineColor);
        board.setTitle(title);
        result = "success";
        DashboardconfigManager.createBoard(board);
        return Action.SUCCESS;
    }

    public String setBoard() {
        if (boardId == null) {
            result = "error";
            return Action.ERROR;
        }
        DashboardconfigEntity board = DashboardconfigManager.findConfig(boardId);
        if (ifBanner.equals("true")) {
            ifBanner = "exist";
        } else ifBanner = "no";
        if (ifFooter.equals("true")) {
            ifFooter = "exist";
        } else ifFooter = "no";
        if (showBanner.equals("true")) showBanner = "1";
        else showBanner = "" + boardId;
        board.setIfBanner(ifBanner);
        board.setBannerColor(bannerColor);
        board.setLogo(logo);
        board.setBkColor(bkColor);
        board.setName(displayName);
        board.setShowBanner(Integer.parseInt(showBanner));
        board.setIfFooter(ifFooter);
        board.setFooterColor(footerColor);
        board.setFooterText(footerText);
        board.setCover(cover);
        board.setBannerFontColor(bannerFontColor);
        board.setBannerLabelColor(bannerLabelColor);
        board.setBannerLineColor(bannerLineColor);
        board.setTitle(title);
        DashboardconfigManager.updateBoard(board);
        result = "success";
        return Action.SUCCESS;
    }

    public String fileUpload() {
        String randomUri = UUID.randomUUID().toString();
        return SUCCESS;
    }

    public DashboardconfigEntity getDashboardconfigEntities() {
        return this.dashboardconfigEntities;
    }

    public void setDashboardconfigEntities(DashboardconfigEntity dash) {
        this.dashboardconfigEntities = dash;
    }

    public String getCover() {
        return this.cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public String getShowBanner() {
        return this.showBanner;
    }

    public void setShowBanner(String s) {
        this.showBanner = s;
    }

    public String getDisplayName() {
        return this.displayName;
    }

    public void setDisplayName(String name) {
        this.displayName = name;
    }

    public int getPage() {
        return this.page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public String getResult() {
        return this.result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public List<Integer> getCoverIndex() {
        return coverIndex;
    }

    public void setCoverIndex(List<Integer> i) {
        this.coverIndex = i;
    }

    public List<Map> getCoverList() {
        return coverList;
    }

    public void setCoverList(List<Map> m) {
        this.coverList = m;
    }

    public Integer getBoardId() {
        return boardId;
    }

    public void setBoardId(Integer boardId) {
        this.boardId = boardId;
    }

    public List<DashboardconfigEntity> getDashboardconfigEntityList() {
        return dashboardconfigEntityList;
    }

    public void setDashboardconfigEntityList(List<DashboardconfigEntity> dashboardconfigEntityList) {
        this.dashboardconfigEntityList = dashboardconfigEntityList;
    }

    public String getBkgColor() {
        return bkgColor;
    }

    public void setBkgColor(String bkgColor) {
        this.bkgColor = bkgColor;
    }

    public String getBannerColor() {
        return bannerColor;
    }

    public void setBannerColor(String bannerColor) {
        this.bannerColor = bannerColor;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getBkColor() {
        return bkColor;
    }

    public void setBkColor(String bkColor) {
        this.bkColor = bkColor;
    }

    public Boolean getIfCover() {
        return ifCover;
    }

    public void setIfCover(Boolean ifCover) {
        this.ifCover = ifCover;
    }

    public String getBkPic() {
        return bkPic;
    }

    public void setBkPic(String bkPic) {
        this.bkPic = bkPic;
    }

    public String getIfBanner() {
        return ifBanner;
    }

    public void setIfBanner(String ifBanner) {
        this.ifBanner = ifBanner;
    }

    public String getFooterColor() {
        return footerColor;
    }

    public void setFooterColor(String footerColor) {
        this.footerColor = footerColor;
    }

    public String getFooterText() {
        return footerText;
    }

    public void setFooterText(String footerText) {
        this.footerText = footerText;
    }

    public String getIfFooter() {
        return ifFooter;
    }

    public void setIfFooter(String ifFooter) {
        this.ifFooter = ifFooter;
    }

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCoverTitle() {
        return coverTitle;
    }

    public void setCoverTitle(String coverTitle) {
        this.coverTitle = coverTitle;
    }

    public String getCoverSubTitle() {
        return coverSubTitle;
    }

    public void setCoverSubTitle(String coverSubTitle) {
        this.coverSubTitle = coverSubTitle;
    }

    public String getCoverUrl() {
        return coverUrl;
    }

    public void setCoverUrl(String coverUrl) {
        this.coverUrl = coverUrl;
    }

    public List<Map> getCoverButtons() {
        return coverButtons;
    }

    public void setCoverButtons(List<Map> coverButtons) {
        this.coverButtons = coverButtons;
    }

    public Integer getCoverHeight() {
        return coverHeight;
    }

    public void setCoverHeight(Integer coverHeight) {
        this.coverHeight = coverHeight;
    }

    public String getCoverFontColor() {
        return coverFontColor;
    }

    public void setCoverFontColor(String coverFontColor) {
        this.coverFontColor = coverFontColor;
    }

    public Integer getNumOfBoard() {
        return this.numOfBoard;
    }

    public void setNumOfBoard(int num) {
        this.numOfBoard = num;
    }

    public String getBannerFontColor() {
        return bannerFontColor;
    }

    public void setBannerFontColor(String bannerFontColor) {
        this.bannerFontColor = bannerFontColor;
    }

    public String getBannerLabelColor() {
        return bannerLabelColor;
    }

    public void setBannerLabelColor(String bannerLabelColor) {
        this.bannerLabelColor = bannerLabelColor;
    }

    public String getBannerLineColor() {
        return bannerLineColor;
    }

    public void setBannerLineColor(String bannerLineColor) {
        this.bannerLineColor = bannerLineColor;
    }

    public void setNumOfBoard(Integer numOfBoard) {
        this.numOfBoard = numOfBoard;
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
