<%@page import="org.apache.commons.lang3.StringUtils" %>
<%@page import="org.apache.oltu.oauth2.client.OAuthClient" %>
<%@page import="org.apache.oltu.oauth2.client.URLConnectionClient" %>
<%@page import="org.apache.oltu.oauth2.client.request.OAuthClientRequest" %>
<%@page import="org.apache.oltu.oauth2.client.response.OAuthClientResponse" %>
<%@page import="org.apache.oltu.oauth2.common.message.types.GrantType" %>
<%@page import="OAuthDemo.TokenRequestBuilder" %>


<%
    String clientCode = (String)session.getAttribute("clientCode");
    String clientSecret = request.getParameter("clientSecret");
    String callbackURI = (String)session.getAttribute("callbackURI");
    String tokenEndpoint = request.getParameter("tokenEndpoint");
    String authCode = request.getParameter("code");

    TokenRequestBuilder OAuthTokenBuilder = new TokenRequestBuilder(tokenEndpoint);

    OAuthTokenBuilder.setGrantType(GrantType.AUTHORIZATION_CODE);
    OAuthTokenBuilder.setClientId(clientCode);
    OAuthTokenBuilder.setClientSecret(clientSecret);
    OAuthTokenBuilder.setRedirectURI(callbackURI);
    OAuthTokenBuilder.setCode(authCode);

    OAuthClientRequest accessRequest = OAuthTokenBuilder.buildBodyMessage();

    OAuthClient client = new OAuthClient(new URLConnectionClient());

    OAuthClientResponse OAuthResponse = client.accessToken(accessRequest);
    String accessToken = OAuthResponse.getParam("access_token");
    session.setAttribute("access_token", accessToken);

    String idToken = OAuthResponse.getParam("id_token");
    if(idToken != null){
        session.setAttribute("id_token", idToken);
    }

%>

<script type="text/javascript">
    window.location = "home.jsp?gotTokens";
</script>