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
    String clientCode = "7jcZ_ZxQ8eAlI3W3aTFSqs6vmbsa";
    String tokenEndPoint="https://localhost:9443/oauth2/token";
    String clientSecret="uKipDi8vrwBsI9yVWLGKQBGScuIa";

    OAuthAuthzResponse authzResponse = null;

    if (request.getParameter("code")!= null ) {
                        code = request.getParameter("code");

                    }






%>

<!DOCTYPE html>
<html>
<body>
    <h2>OAuth Demo</h2>

    <% if (accessToken == null && code == null ) {%>

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

    <%} else { %>

    <form action="authorizeUser.jsp" method="post" name="OAuthRequest">
            <table class="user_pass_table">
                <tr>
                    <td colspan="4">Authorization Code: <input type="text" name="grantType" value="<%=code%>" size="50"></td>
                </tr>
                <tr>
                    <td colspan="4">Callback URL: <input type="text" name="scope" value="<%=callbackURI%>" size="50"></td>
                </tr>
                <tr>
                    <td colspan="4">Access Token End Point: <input type="text" name="scope" value="<%=tokenEndPoint%>" size="50"></td>
                </tr>
                <tr>
                    <td colspan="4">Client Secret: <input type="text" name="scope" value="<%=clientSecret%>" size="50"></td>
                </tr>



            </table>
        </form>

        <%}%>
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