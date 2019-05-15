<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div style="margin-top: 20px">
<s:if test="ifFooter=='exist'">
    <s:include value="_footerContent.jsp"/>
</s:if>
</div>