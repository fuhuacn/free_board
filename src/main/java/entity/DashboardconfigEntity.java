package entity;

import javax.persistence.*;
import java.util.Objects;

/**
 * @author 付华
 * @create 2017/12/5 16:08
 * @since 1.0.0
 */
@Entity
@Table(name = "dashboardconfig", catalog = "")
public class DashboardconfigEntity {
    private int id;
    private String bannerColor;
    private String logo;
    private String bkColor;
    private String bkPic;
    private String name;
    private String ifBanner;
    private String footerColor;
    private String footerText;
    private String ifFooter;
    private Integer width;
    private Integer layout;
    private String title;
    private String cover;
    private Integer showBanner;
    private String bannerFontColor;
    private String bannerLabelColor;
    private String bannerLineColor;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "bannerColor")
    public String getBannerColor() {
        return bannerColor;
    }

    public void setBannerColor(String bannerColor) {
        this.bannerColor = bannerColor;
    }

    @Basic
    @Column(name = "logo")
    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    @Basic
    @Column(name = "bkColor")
    public String getBkColor() {
        return bkColor;
    }

    public void setBkColor(String bkColor) {
        this.bkColor = bkColor;
    }

    @Basic
    @Column(name = "bkPic")
    public String getBkPic() {
        return bkPic;
    }

    public void setBkPic(String bkPic) {
        this.bkPic = bkPic;
    }

    @Basic
    @Column(name = "displayName")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "ifBanner")
    public String getIfBanner() {
        return ifBanner;
    }

    public void setIfBanner(String ifBanner) {
        this.ifBanner = ifBanner;
    }

    @Basic
    @Column(name = "footerColor")
    public String getFooterColor() {
        return footerColor;
    }

    public void setFooterColor(String footerColor) {
        this.footerColor = footerColor;
    }

    @Basic
    @Column(name = "footerText")
    public String getFooterText() {
        return footerText;
    }

    public void setFooterText(String footerText) {
        this.footerText = footerText;
    }

    @Basic
    @Column(name = "ifFooter")
    public String getIfFooter() {
        return ifFooter;
    }

    public void setIfFooter(String ifFooter) {
        this.ifFooter = ifFooter;
    }

    @Basic
    @Column(name = "width")
    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }

    @Basic
    @Column(name = "layout")
    public Integer getLayout() {
        return layout;
    }

    public void setLayout(Integer layout) {
        this.layout = layout;
    }

    @Basic
    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "cover")
    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    @Basic
    @Column(name = "showBanner")
    public Integer getShowBanner(){ return showBanner;   }

    public void setShowBanner(Integer i){ this.showBanner=i; }
    @Basic
    @Column(name = "bannerFontColor")
    public String getBannerFontColor() {
        return bannerFontColor;
    }

    public void setBannerFontColor(String bannerFontColor) {
        this.bannerFontColor = bannerFontColor;
    }

    @Basic
    @Column(name = "bannerLabelColor")
    public String getBannerLabelColor() {
        return bannerLabelColor;
    }

    public void setBannerLabelColor(String bannerLabelColor) {
        this.bannerLabelColor = bannerLabelColor;
    }

    @Basic
    @Column(name = "bannerLineColor")
    public String getBannerLineColor() {
        return bannerLineColor;
    }

    public void setBannerLineColor(String bannerLineColor) {
        this.bannerLineColor = bannerLineColor;
    }
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        DashboardconfigEntity that = (DashboardconfigEntity) o;
        return id == that.id &&
                Objects.equals(bannerColor, that.bannerColor) &&
                Objects.equals(logo, that.logo) &&
                Objects.equals(bkColor, that.bkColor) &&
                Objects.equals(bkPic, that.bkPic) &&
                Objects.equals(name, that.name) &&
                Objects.equals(ifBanner, that.ifBanner) &&
                Objects.equals(footerColor, that.footerColor) &&
                Objects.equals(footerText, that.footerText) &&
                Objects.equals(ifFooter, that.ifFooter) &&
                Objects.equals(width, that.width) &&
                Objects.equals(layout, that.layout) &&
                Objects.equals(title, that.title) &&
                Objects.equals(cover, that.cover) &&
                Objects.equals(showBanner, that.showBanner);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, bannerColor, logo, bkColor, bkPic, name, ifBanner, footerColor, footerText, ifFooter, width, layout, title, cover, showBanner);
    }
}
