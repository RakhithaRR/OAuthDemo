<%@page import="org.apache.commons.lang3.StringUtils" %>
<%@page import="org.apache.oltu.oauth2.client.OAuthClient" %>
<%@page import="org.apache.oltu.oauth2.client.URLConnectionClient" %>
<%@page import="org.apache.oltu.oauth2.client.request.OAuthClientRequest" %>
<%@page import="org.apache.oltu.oauth2.client.response.OAuthClientResponse" %>


<%
    String clientCode = request.getParameter("clientCode");
    String authEndpoint = request.getParameter("authEndpoint");

%>
<html>
<body>
    <h3><%=clientCode%></h3>
</body>
</html>
