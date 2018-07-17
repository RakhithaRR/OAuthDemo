package OAuthDemo;

public final class Constants {
    // oauth scopes
    public static final String SCOPE_OPENID = "openid";

    // oauth grant type constants
    public static final String OAUTH2_GRANT_TYPE_CODE = "code";

    // application specific request parameters
    public static final String RESET_PARAM = "reset";
    public static final String RESOURCE_OWNER_PARAM = "recowner";
    public static final String RESOURCE_OWNER_PASSWORD_PARAM = "recpassword";

    // application specific request parameters and session attributes
    public static final String CLIENT_KEY = "clientKey";
    public static final String CLIENT_SECRET = "clientSecret";
    public static final String CALL_BACK_URL = "callbackurl";
    public static final String OAUTH2_GRANT_TYPE = "grantType";
    public static final String OAUTH2_AUTHZ_ENDPOINT = "authorizeEndpoint";
    public static final String OAUTH2_ACCESS_ENDPOINT = "accessEndpoint";

    // application specific session attributes
    public static final String CODE = "code";
    public static final String ACCESS_TOKEN = "access_token";
    public static final String ID_TOKEN = "id_token";
    public static final String RESULT = "result";
    public static final String TOKEN_VALIDATION = "valid";
}
