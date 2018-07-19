package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import org.apache.commons.lang3.StringUtils;
import org.apache.oltu.oauth2.client.OAuthClient;
import org.apache.oltu.oauth2.client.URLConnectionClient;
import org.apache.oltu.oauth2.client.request.OAuthClientRequest;
import org.apache.oltu.oauth2.client.response.OAuthClientResponse;
import OAuthDemo.TokenRequestBuilder;

public final class getTokens_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.Vector _jspx_dependants;

  private org.apache.jasper.runtime.ResourceInjector _jspx_resourceInjector;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.apache.jasper.runtime.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

    String grantType = (String)session.getAttribute("grantType");
    String clientCode = (String)session.getAttribute("clientCode");
    String clientSecret = request.getParameter("clientSecret");
    String callbackURI = (String)session.getParameter("callbackURI");
    String tokenEndpoint = request.getParameter("tokenEndpoint");
    String authCode = request.getParameter("code");

    TokenRequestBuilder OAuthTokenBuilder = new TokenRequestBuilder(tokenEndpoint);

    OAuthTokenBuilder.setGrantType(grantType);
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


      out.write("\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("    window.location = \"home.jsp\";\r\n");
      out.write("</script>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
