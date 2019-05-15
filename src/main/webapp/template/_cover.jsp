<%--
  Created by IntelliJ IDEA.
  User: fuhua
  Date: 2018/3/20
  Time: 下午1:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
    <s:if test="coverList.size()<=1">
        <div class="hero jumbotron" style='background-image: url("${coverUrl}");background-color:${bkgColor};background-repeat:no-repeat;background-position-x:center;background-size:auto 100% '>
        <div class='container'>
            <div class="title" style='color:
            <s:if test="coverFontColor!=''">${coverFontColor}</s:if>
            <s:else>white</s:else>'>
                <h1>${coverTitle}</h1>
                <h2>${coverSubTitle}</h2>
                <s:iterator value="coverList" var="coverList">
                <s:iterator value="#coverList.coverButtons" var="coverButtons">
                    <a style='margin: 20px 0px;background-color: <s:property value="#coverButtons.bkgColor"/>;color:
                        <s:property
                            value="#coverButtons.textBorderColor"/>;border-color: <s:property value="#coverButtons.textBorderColor" />'
                    class='btn btn-lg login-page-btn'
                    href='<s:property value="#coverButtons.href"/>'><s:property value="#coverButtons.name"/></a>&nbsp;
                </s:iterator>
                </s:iterator>
            </div>
        </div>
        </div>
    </s:if>
    <s:else>
        <div class="hero jumbotron" style="padding-top: 130px">
         <div class="col-md-12 as-carousel" >
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="height:550px; width:100%">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <s:iterator value="coverIndex" var="index">
                            <s:if test="#index==0">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            </s:if>
                            <s:else>
                                <li data-target="#carousel-example-generic" data-slide-to="<s:property value="#index"/>"></li>
                            </s:else>
                        </s:iterator>
                    </ol>
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                      <s:iterator var="coverList" value="coverList">
                          <s:if test="#coverList.coverIndex==0">
                              <div class="item active" style="max-height:550px">
                                  <a href="" target="_blank"><img src="<s:property value="#coverList.coverUrl"/>" class="img-responsive" alt="Slide"></a>
                                  <div class="carousel-caption">
                                      <h3><s:property value="#coverList.coverTitle"/></h3>
                                      <h4><s:property value="#coverList.coverSubTitle"/></h4>
                                      <s:iterator value="#coverList.coverButtons" var="coverButtons">
                                          <a style='margin: 20px 0px;background-color: <s:property value="#coverButtons.bkgColor"/>;
                                                  color:<s:property value="#coverButtons.textBorderColor"/>;
                                                  border-color: <s:property value="#coverButtons.textBorderColor" />'
                                             class='btn btn-lg login-page-btn'
                                             href='<s:property value="#coverButtons.href"/>'><s:property value="#coverButtons.name"/></a>&nbsp;
                                      </s:iterator>
                                  </div>
                              </div>
                          </s:if>
                          <s:else>
                            <div class="item" style="max-height:550px">
                            <a href="" target="_blank"><img src="<s:property value="#coverList.coverUrl"/>" class="img-responsive" alt="Slide"></a>
                            <div class="carousel-caption">
                                    <h3><s:property value="#coverList.coverTitle"/></h3>
                                    <h4><s:property value="#coverList.coverSubTitle"/></h4>
                                  <s:iterator value="#coverList.coverButtons" var="coverButtons">
                                        <a style='margin: 20px 0px;background-color: <s:property value="#coverButtons.bkgColor"/>;
                                                color:<s:property value="#coverButtons.textBorderColor"/>;
                                                border-color: <s:property value="#coverButtons.textBorderColor" />'
                                           class='btn btn-lg login-page-btn'
                                           href='<s:property value="#coverButtons.href"/>'><s:property value="#coverButtons.name"/></a>&nbsp;
                                    </s:iterator>
                            </div>
                            </div>
                          </s:else>
                        </s:iterator>
                    </div>
                    <!-- Controls -->
                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
    </s:else>


