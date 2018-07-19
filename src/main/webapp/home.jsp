<%@page import="com.nimbusds.jwt.SignedJWT" %>
<%@page import="org.apache.commons.lang3.StringUtils" %>
<%@page import="org.apache.oltu.oauth2.client.response.OAuthAuthzResponse" %>

<%
    String code = null;
    String accessToken = null;
    String idToken = null;
    String name = null;
    String scope = "openid";
    String sessionState = null;
    String error = null;
    String grantType = "code";
    String authEndpoint = "https://localhost:9443/oauth2/authorize";
    String callbackURI = "http://localhost:8080/OAuthDemoApp/home.jsp";
    String clientCode = "onKvXou89QW4m3aJRVLhtw4O8n4a";
    String clientSecret = "cgOyuzfkr5CBN3XDdpQNz4GoQdoa";
    String accessTokenEndpoint = "https://localhost:9443/oauth2/token";

     OAuthAuthzResponse authzResponse = null;

     if(grantType != null) {
        code = request.getParameter("code");
        session.setAttribute("code", code);
     }

     if (grantType != null) {
         code = (String) session.getAttribute("code");
         if (code != null) {
            accessToken = (String) session.getAttribute("access_token");
            idToken = (String) session.getAttribute("id_token");
         }
     }



%>

<!DOCTYPE html>
<html>
<body>
    <h2>OAuth Prototype App</h2>

    <%
        if(code == null && accessToken == null) {
    %>
    <table class="user_pass_table">
        <tr>
            <td colspan="4">Grant Type :</td>
            <td colspan="4">Authorization Code Grant</td>
        </tr>
        <tr>
            <td colspan="4">Scope :</td>
            <td colspan="4"><%=scope%></td>
        </tr>
        <tr>
            <td colspan="4">Client Code :</td>
            <td><%=clientCode%></td>
        </tr>
        <tr>
            <td colspan="4">Authorization Endpoint :</td>
            <td colspan="4"><%=authEndpoint%></td>
        </tr>
        <tr>
            <td colspan="4">Callback URI :</td>
            <td colspan="4"><%=callbackURI%></td>
        </tr>
    </table>

    <form action="authorizeUser.jsp" method="post" name="OAuthRequest">
        <table class="user_pass_table">
            <tr>
                <td colspan="4"><input type="text" name="grantType" value="<%=grantType%>" hidden size="50"></td>
            </tr>
            <tr>
                <td colspan="4"><input type="text" name="scope" value="<%=scope%>" hidden size="50"></td>
            </tr>
            <tr>
                <td><input type="text" name="clientCode" value="<%=clientCode%>" hidden size="50"></td>
            </tr>
            <tr>
                <td colspan="4"><input type="text" name="authEndpoint" value="<%=authEndpoint%>" hidden size="50"></td>
            </tr>
            <tr>
                <td colspan="4"><input type="text" name="callbackURI" value="<%=callbackURI%>" hidden size="50"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" name="authorize" value="Authorize"></td>
            </tr>
        </table>
    </form>

    <%
        } else if (code != null && accessToken == null) {

    %>

     <table class="user_pass_table">
         <tr>
             <td colspan="4">Authorization Code :</td>
             <td colspan="4"><%=code%></td>
         </tr>
         <tr>
             <td colspan="4">Callback URL :</td>
             <td colspan="4"><%=callbackURI%></td>
         </tr>
         <tr>
             <td colspan="4">Access Token Endpoint :</td>
             <td><%=accessTokenEndpoint%></td>
         </tr>
         <tr>
             <td colspan="4">Client Secret :</td>
             <td colspan="4"><%=clientSecret%></td>
         </tr>
     </table>

     <form action="getTokens.jsp" method="post" name="TokenRequest">
         <table class="user_pass_table">
             <tr>
                 <td colspan="4"><input type="text" name="code" value="<%=code%>" hidden size="50"></td>
             </tr>
             <tr>
                 <td colspan="4"><input type="text" name="callbackURI" value="<%=callbackURI%>" hidden size="50"></td>
             </tr>
             <tr>
                 <td><input type="text" name="tokenEndpoint" value="<%=accessTokenEndpoint%>" hidden size="50"></td>
             </tr>
             <tr>
                 <td colspan="4"><input type="text" name="clientSecret" value="<%=clientSecret%>" hidden size="50"></td>
             </tr>
             <tr>
                 <td colspan="2"><input type="submit" name="getToken" value="Get Tokens"></td>
             </tr>
         </table>
         </form>

     <%
        }
     %>




</body>
</html>

<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    text-align: left;
    padding: 8px;
}
</style>