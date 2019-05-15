package entity;

import javax.persistence.*;
import java.util.Objects;

/**
 * @author 付华
 * @create 2017/11/15 16:39
 * @since 1.0.0
 */
@Entity
@Table(name = "cardconfig", catalog = "")
public class CardconfigEntity {
    private int id;
    private String cardname;
    private String typing;
    private Integer dataid;
    private String title;
    private String size;
    private String bkcolor;
    private String layout;
    private Integer refresh;
    private Integer boardId;
    private String bordercolor;
    private String titlebordercolor;
    private String paddingbordercolor;
    private Integer leftpadding;
    private Integer rightpadding;
    private Integer toppadding;
    private Integer bottompadding;
    private Integer leftmargin;
    private Integer rightmargin;
    private Integer topmargin;
    private Integer bottommargin;

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "cardname")
    public String getCardname() {
        return cardname;
    }

    public void setCardname(String cardname) {
        this.cardname = cardname;
    }

    @Basic
    @Column(name = "typing")
    public String getTyping() {
        return typing;
    }

    public void setTyping(String typing) {
        this.typing = typing;
    }

    @Basic
    @Column(name = "dataid")
    public Integer getDataid() {
        return dataid;
    }

    public void setDataid(Integer dataid) {
        this.dataid = dataid;
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
    @Column(name = "size")
    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    @Basic
    @Column(name = "bkcolor")
    public String getBkcolor() {
        return bkcolor;
    }

    public void setBkcolor(String bkcolor) {
        this.bkcolor = bkcolor;
    }

    @Basic
    @Column(name = "layout")
    public String getLayout() {
        return layout;
    }

    public void setLayout(String layout) {
        this.layout = layout;
    }

    @Basic
    @Column(name = "refresh")
    public Integer getRefresh() {
        return refresh;
    }

    public void setRefresh(Integer refresh) {
        this.refresh = refresh;
    }



    @Basic
    @Column(name = "boardId")
    public Integer getBoardId() {
        return boardId;
    }

    public void setBoardId(Integer boardId) {
        this.boardId = boardId;
    }

    @Basic
    @Column(name = "bordercolor")
    public String getBordercolor() {
        return bordercolor;
    }

    public void setBordercolor(String bordercolor) {
        this.bordercolor = bordercolor;
    }

    @Basic
    @Column(name = "titlebordercolor")
    public String getTitlebordercolor() {
        return titlebordercolor;
    }

    public void setTitlebordercolor(String titlebordercolor) {
        this.titlebordercolor = titlebordercolor;
    }

    @Basic
    @Column(name = "paddingbordercolor")
    public String getPaddingbordercolor() {
        return paddingbordercolor;
    }

    public void setPaddingbordercolor(String paddingbordercolor) {
        this.paddingbordercolor = paddingbordercolor;
    }

    @Basic
    @Column(name = "leftpadding")
    public Integer getLeftpadding() {
        return leftpadding;
    }

    public void setLeftpadding(Integer leftpadding) {
        this.leftpadding = leftpadding;
    }

    @Basic
    @Column(name = "rightpadding")
    public Integer getRightpadding() {
        return rightpadding;
    }

    public void setRightpadding(Integer rightpadding) {
        this.rightpadding = rightpadding;
    }

    @Basic
    @Column(name = "toppadding")
    public Integer getToppadding() {
        return toppadding;
    }

    public void setToppadding(Integer toppadding) {
        this.toppadding = toppadding;
    }

    @Basic
    @Column(name = "bottompadding")
    public Integer getBottompadding() {
        return bottompadding;
    }

    public void setBottompadding(Integer bottompadding) {
        this.bottompadding = bottompadding;
    }

    @Basic
    @Column(name = "leftmargin")
    public Integer getLeftmargin() {
        return leftmargin;
    }

    public void setLeftmargin(Integer leftmargin) {
        this.leftmargin = leftmargin;
    }

    @Basic
    @Column(name = "rightmargin")
    public Integer getRightmargin() {
        return rightmargin;
    }

    public void setRightmargin(Integer rightmargin) {
        this.rightmargin = rightmargin;
    }

    @Basic
    @Column(name = "topmargin")
    public Integer getTopmargin() {
        return topmargin;
    }

    public void setTopmargin(Integer topmargin) {
        this.topmargin = topmargin;
    }

    @Basic
    @Column(name = "bottommargin")
    public Integer getBottommargin() {
        return bottommargin;
    }

    public void setBottommargin(Integer bottommargin) {
        this.bottommargin = bottommargin;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CardconfigEntity that = (CardconfigEntity) o;
        return id == that.id &&
                Objects.equals(typing, that.typing) &&
                Objects.equals(dataid, that.dataid) &&
                Objects.equals(title, that.title) &&
                Objects.equals(size, that.size) &&
                Objects.equals(bkcolor, that.bkcolor) &&
                Objects.equals(layout, that.layout) &&
                Objects.equals(refresh, that.refresh) &&
                Objects.equals(boardId, that.boardId) &&
                Objects.equals(bordercolor, that.bordercolor) &&
                Objects.equals(titlebordercolor, that.titlebordercolor) &&
                Objects.equals(paddingbordercolor, that.paddingbordercolor) &&
                Objects.equals(leftpadding, that.leftpadding) &&
                Objects.equals(rightpadding, that.rightpadding) &&
                Objects.equals(toppadding, that.toppadding) &&
                Objects.equals(bottompadding, that.bottompadding) &&
                Objects.equals(leftmargin, that.leftmargin) &&
                Objects.equals(rightmargin, that.rightmargin) &&
                Objects.equals(topmargin, that.topmargin) &&
                Objects.equals(bottommargin, that.bottommargin);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, typing, dataid, title, size, bkcolor, layout, refresh, boardId, bordercolor, titlebordercolor, paddingbordercolor, leftpadding, rightpadding, toppadding, bottompadding, leftmargin, rightmargin, topmargin, bottommargin);
    }
}
