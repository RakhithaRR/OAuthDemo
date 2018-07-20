package OAuthDemo;

import javax.net.ssl.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ClientServlet extends HttpServlet {
    private static final long serialVersionUID = -5587487420597790757L;

    static String userName;
    static String password;
    static String serverUrl;


    @Override
    public void init(ServletConfig config) throws ServletException {

        // All the code below is to overcome host name verification failure we get in certificate
        // validation due to self-signed certificate. This code should not be used in a production
        // setup.

        try {

            SSLContext sc;

            // Get SSL context
            sc = SSLContext.getInstance("SSL");

            // Create empty HostnameVerifier
            HostnameVerifier hv = new HostnameVerifier() {
                public boolean verify(String urlHostName, SSLSession session) {
                    return true;
                }
            };

            // Create a trust manager that does not validate certificate chains
            TrustManager[] trustAllCerts = new TrustManager[] { new X509TrustManager() {
                public java.security.cert.X509Certificate[] getAcceptedIssuers() {
                    return null;
                }

                public void checkClientTrusted(java.security.cert.X509Certificate[] certs,
                                               String authType) {
                }

                public void checkServerTrusted(java.security.cert.X509Certificate[] certs,
                                               String authType) {
                }
            } };

            sc.init(null, trustAllCerts, new java.security.SecureRandom());
            //SSLSocketFactory sslSocketFactory = sc.getSocketFactory();

            //HttpsURLConnection.setDefaultSSLSocketFactory(sslSocketFactory);
            SSLContext.setDefault(sc);
            HttpsURLConnection.setDefaultHostnameVerifier(hv);

            // Load init parameters.
            userName = config.getInitParameter("userName");
            password = config.getInitParameter("password");
            serverUrl = config.getInitParameter("serverUrl");

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException,
            IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("getTokens.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }
}

