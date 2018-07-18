package OAuthDemo;

import org.apache.oltu.oauth2.client.request.OAuthClientRequest;


public class AuthorizationRequestBuilder extends OAuthClientRequest.AuthenticationRequestBuilder {

    public AuthorizationRequestBuilder(String authEndpointUrl){
        super(authEndpointUrl);
    }
}
