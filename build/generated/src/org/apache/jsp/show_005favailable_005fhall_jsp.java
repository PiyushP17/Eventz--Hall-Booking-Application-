package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class show_005favailable_005fhall_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hallbooking?zeroDateTimeBehavior=convertToNull",
                "root","");
        String bookingDate = request.getParameter("date");
        String query = "select * from booking where date='"
                + bookingDate+"' and hallid='hall1'";
        Statement smt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        ResultSet rst = smt.executeQuery(query);
        int rows = 0;
        try {
            rst.last();
            rows = rst.getRow();
            rst.beforeFirst();
        } catch (SQLException e) {
            out.print(e.getMessage());
        }
        out.print("<h2>Hall Availability</h2>");
        out.print("<div id='date_of_booking'>"+bookingDate+"</div>");
        if (rows == 1) {
            while (rst.next()) {
                if (rst.getString("hallid").equalsIgnoreCase("hall1")) {
                    String hallid = "hall1";
                    out.print("<h4 id='hall1'>Hall 1 Availability</h4>");
                    if (rst.getString("slot").equalsIgnoreCase("slot1")) {
                        out.print("<button class='btn btn-danger' onclick=''>Slot1</button>&nbsp;");
                        out.print("<button class='btn btn-success' onclick='book_final(this,"+hallid+")'>Slot2</button>");
                    } else if (rst.getString("slot").equalsIgnoreCase("slot2")) {
                        out.print("<button class='btn btn-success' onclick='book_final(this,"+hallid+")'>Slot1</button>&nbsp;");
                        out.print("<button class='btn btn-danger' onclick=''>Slot2</button>");  
                    }
                }
            }
        } else if (rows == 2) {
            out.print("<h4 id='hall1'>Hall 1 Availability</h4>");
            out.print("<button class='btn btn-danger' onclick=''>Slot1</button>&nbsp;");
            out.print("<button class='btn btn-danger' onclick=''>Slot2</button>");  
        } else {
            String hallid = "hall1";
            out.print("<h4 id='hall1'>Hall 1 Availability</h4>");
            out.print("<button class='btn btn-success' onclick='book_final(this,"+hallid+")'>Slot1</button>&nbsp;");
            out.print("<button class='btn btn-success' onclick='book_final(this,"+hallid+")'>Slot2</button>");
        }
        
       // For Hall 2
       query = "select * from booking where date='"
                + bookingDate+"' and hallid='hall2'";
       smt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
       rst = smt.executeQuery(query);
       rows = 0;
       try {
            rst.last();
            rows = rst.getRow();
            rst.beforeFirst();
        } catch (SQLException e) {
            out.print(e.getMessage());
        }
        if (rows == 1) {
            while (rst.next()) {
                if (rst.getString("hallid").equalsIgnoreCase("hall2")) {
                    String hallid = "hall2";
                    out.print("<h4 id='hall2'>Hall 2 Availability</h4>");
                    if (rst.getString("slot").equalsIgnoreCase("slot1")) {
                        out.print("<button class='btn btn-danger' onclick=''>Slot1</button>&nbsp;");
                        out.print("<button class='btn btn-success' onclick='book_final(this,"+hallid+")'>Slot2</button>");
                    } else if (rst.getString("slot").equalsIgnoreCase("slot2")) {
                        out.print("<button class='btn btn-success' onclick='book_final(this,"+hallid+")'>Slot1</button>&nbsp;");
                        out.print("<button class='btn btn-danger' onclick=''>Slot2</button>");   
                    }
                }
            }
        } else if (rows == 2) {
            out.print("<h4 id='hall2'>Hall 2 Availability</h4>");
            out.print("<button class='btn btn-danger' onclick=''>Slot1</button>&nbsp;");
            out.print("<button class='btn btn-danger' onclick=''>Slot2</button>");  
        } else {
            String hallid = "hall2";
            out.print("<h4 id='hall2'>Hall 2 Availability</h4>");
            out.print("<button class='btn btn-success' onclick='book_final(this,"+hallid+")'>Slot1</button>&nbsp;");
            out.print("<button class='btn btn-success' onclick='book_final(this,"+hallid+")'>Slot2</button>");
        }

    } catch (Exception e) {
        out.print(e.getMessage());
    }

      out.write('\n');
      out.write('\n');
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
