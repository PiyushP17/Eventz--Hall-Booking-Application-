package org.apache.jsp.WEB_002dINF;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("   <head>\n");
      out.write("      <meta charset=\"utf-8\">\n");
      out.write("      <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("      <title>Online Hall Booking</title>\n");
      out.write("      <link href=\"assets/css/bootstrap.css\" rel=\"stylesheet\">\n");
      out.write("      <link href=\"assets/font-awesome/css/font-awesome.css\" rel=\"stylesheet\" />\n");
      out.write("      <link href=\"assets/css/style.css\" rel=\"stylesheet\">\n");
      out.write("      <link href=\"assets/css/style-responsive.css\" rel=\"stylesheet\">\n");
      out.write("      ");

String errorMessage = (String) session.getAttribute("errorMessage");
if (null !=errorMessage) { 
      out.write("\n");
      out.write("<h4> ");
      out.print(errorMessage );
      out.write("</h4>\n");
}

      out.write("\n");
      out.write("   </head>\n");
      out.write("   <body>\n");
      out.write("      <div id=\"login-page\">\n");
      out.write("         <div class=\"container\">\n");
      out.write("            <form class=\"form-login\" action=\"login\" method=\"post\">\n");
      out.write("               <h2 class=\"form-login-heading\">sign in now</h2>\n");
      out.write("               <div class=\"login-wrap\">\n");
      out.write("                  <input type=\"text\" name=\"username\" class=\"form-control\" placeholder=\"User ID\" autofocus>\n");
      out.write("                  <br>\n");
      out.write("                  <input type=\"password\" name=\"password\" class=\"form-control\" placeholder=\"Password\">\n");
      out.write("                  <br>\n");
      out.write("                  <label><b>Usertype:&nbsp;&nbsp;&nbsp;</b></label>\n");
      out.write("                  <div>\n");
      out.write("                     <select class=\"form-control\" name=\"type\">\n");
      out.write("                        <option value=\"-1\" selected>Select</option>\n");
      out.write("                        <option value=\"User\">User</option>\n");
      out.write("                        <option value=\"Admin\">Admin</option>\n");
      out.write("                     </select>\n");
      out.write("                  </div>\n");
      out.write("                  <br>\n");
      out.write("                  <button class=\"btn btn-theme btn-block\" name=\"login\" type=\"submit\"><i class=\"fa fa-lock\"></i> SIGN IN</button>\n");
      out.write("                  <hr>\n");
      out.write("                  <div class=\"registration\">\n");
      out.write("                     Don't have an account yet?<br/>\n");
      out.write("                     <a class=\"\" href=\"sign_up.php\">\n");
      out.write("                     Create an account\n");
      out.write("                     </a>\n");
      out.write("                  </div>\n");
      out.write("               </div>\n");
      out.write("            </form>\n");
      out.write("         </div>\n");
      out.write("      </div>\n");
      out.write("      <script src=\"assets/js/jquery.js\"></script>\n");
      out.write("      <script src=\"assets/js/bootstrap.min.js\"></script>\n");
      out.write("      <!--BACKSTRETCH-->\n");
      out.write("      <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->\n");
      out.write("      <script type=\"text/javascript\" src=\"assets/js/jquery.backstretch.min.js\"></script>\n");
      out.write("      <script>\n");
      out.write("         $.backstretch(\"assets/img/bg.png\", {speed: 500});\n");
      out.write("      </script>\n");
      out.write("   </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
