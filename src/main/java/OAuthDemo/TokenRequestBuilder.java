package OAuthDemo;

import org.apache.oltu.oauth2.client.request.OAuthClientRequest;

public class TokenRequestBuilder extends OAuthClientRequest.TokenRequestBuilder {

    public TokenRequestBuilder(String tokenEndpointUrl){
        super(tokenEndpointUrl);
    }
}
