<%--
  Created by IntelliJ IDEA.
  User: josla
  Date: 11/30/2020
  Time: 12:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.text.NumberFormat, java.util.*"%>
<html>
<head>
    <title>Mortgage</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/mortgage/mortgage.css">
</head>
    <body>
        <%
            double p = Double.parseDouble(request.getParameter("principal"));
            double r = Double.parseDouble(request.getParameter("rate"));
            int y = Integer.parseInt(request.getParameter("life"));
            double mr = r/100/12;
            double mpt = (p*mr)/(1 - Math.pow(1+mr, -12*y));
            NumberFormat nf = NumberFormat.getInstance();
            nf.setMaximumFractionDigits(2);
        %>
        <jsp:include page="mortgage.html" flush="true"></jsp:include>

        <div class="outer2">
            <div class="mpt">
                <span> Monthly Payment: $<%=nf.format(mpt)%> </span>
            </div>
        </div>
    </body>
</html>
