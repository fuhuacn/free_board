<%--
  Created by IntelliJ IDEA.
  User: fuhua
  Date: 2018/4/3
  Time: 下午1:25
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default navbar-fixed-top front-nav" style="background-color: ${bannerColor};border-color: ${bannerLineColor};">
    <!-- /.navbar-collapse -->
    <div class="container">
        <div>
            <!-- 品牌图片大小为150 * 30：宽度不定，高度固定30px -->
            <a href="">
                <div class="nav-brand">
                    <img src="${logo}" onerror="javascript:this.src='images/logo.png';" style="max-height: 30px"/>
                </div>
            </a>
            <!-- 导航栏菜单 -->
            <div class="nav-collapse collapse" id="nav-collapse-demo">
                <s:set name="fontColor" value="bannerFontColor" />

                <ul class="nav navbar-nav">
                    <s:iterator value="dashboardconfigEntityList" id="list">
                        <s:if test="#list.showBanner==1">
                            <li class="${boardId ==list.id?'front-active' : ''}"><a style="color: <s:property value='fontColor'/>" href="?boardId=<s:property value='#list.id'/>"><s:property value='#list.name'/></a></li>
                        </s:if>
                    </s:iterator>
                    <%--<li>
                        <a href="index/upload.jsp">
                            上传图片
                        </a>
                    </li>--%>
                    <!-- -->
                </ul>
            </div>
            <div class="nav-right">
                <div class="area visible-xs nav-toggle-down" data-toggle="collapse" data-target="#nav-collapse-demo"><span class="glyphicon glyphicon-menu-hamburger" id="front-nav-toggle-down-demo"></span></div>
            </div>
        </div>
    </div>
</nav>
