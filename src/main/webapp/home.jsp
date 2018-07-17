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

%>

<!DOCTYPE html>
<html>
<body>
    <h2>OAuth Demo</h2>

    <form action="" method="post" name="OAuthRequest">
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
                <td colspan="4">Authorization Endpoint :</td>
                <td colspan="4"></td>
            </tr>
            <tr>
                <td colspan="4">Callback URI :</td>
                <td colspan="4"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" name="authorize" value="Authorize"></td>
            </tr>
        </table>
    </form>
</body>
</html>

<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 75%;
}

td, th {
    text-align: left;
    padding: 8px;
}
</style>