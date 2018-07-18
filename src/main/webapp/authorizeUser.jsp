<%@page import="org.apache.commons.lang3.StringUtils" %>
<%@page import="org.apache.oltu.oauth2.client.OAuthClient" %>
<%@page import="org.apache.oltu.oauth2.client.URLConnectionClient" %>
<%@page import="org.apache.oltu.oauth2.client.request.OAuthClientRequest" %>
<%@page import="org.apache.oltu.oauth2.client.response.OAuthClientResponse" %>
<%@page import="OAuthDemo.AuthorizationRequestBuilder" %>

<%
    String grantType = request.getParameter("grantType");
    String scope = request.getParameter("scope");
    String clientCode = request.getParameter("clientCode");
    String authEndpoint = request.getParameter("authEndpoint");
    String callbackURI  = request.getParameter("callbackURI");

    session.setAttribute("grantType", grantType);
    session.setAttribute("scope", scope);
    session.setAttribute("clientCode", clientCode);
    session.setAttribute("authEndpoint", authEndpoint);
    session.setAttribute("callbackURI", callbackURI);

    AuthorizationRequestBuilder OAuthRequestBuilder = new AuthorizationRequestBuilder(authEndpoint);

    OAuthRequestBuilder.setClientId(clientCode);
    OAuthRequestBuilder.setRedirectURI(callbackURI);
    OAuthRequestBuilder.setResponseType(grantType);
    OAuthRequestBuilder.setScope(scope);

    OAuthClientRequest authRequest =   OAuthRequestBuilder.buildQueryMessage();
    response.sendRedirect(authRequest.getLocationUri());
    return;
%>