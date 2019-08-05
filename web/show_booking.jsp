<%-- 
    Document   : show_booking
    Created on : 16 Jul, 2019, 10:43:40 PM
    Author     : HP
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.time.LocalDateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
LocalDateTime now = LocalDateTime.now();
String currentDate = now.toString().substring(0,10);
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/hallbooking?zeroDateTimeBehavior=convertToNull",
            "root","");
    String query = "select * from book_date where status = 'open'";
    Statement smt = null;
    ResultSet rst = null;
    smt = conn.createStatement();
    rst = smt.executeQuery(query);
    boolean flag = false;
    //boolean check = false;
    while(rst.next()) {
        if (!flag) {
            flag = true;
        }
        String dbDate = rst.getString(2);  
        if (currentDate.compareTo(dbDate)==1) {
            String updateQuery = "update book_date set status = 'close' where date='"+dbDate+"'";
            PreparedStatement psmt = conn.prepareStatement(updateQuery);
            int updateStatus = psmt.executeUpdate();
            if (updateStatus==0) {
               out.println("<script>"
                       + "alert('Error Updating')"+
                       "</script>"); 
            } 
        }
        //New
        String query2 = "select hallid from booking where date = '"+dbDate+"'";
        Statement smt2 = conn.createStatement();
        ResultSet rst2 = smt2.executeQuery(query2);
        int cnt = 0;
        while(rst2.next()) {
            cnt++;
        }
        if (cnt==4) {
            PreparedStatement psmt = conn.prepareStatement("update book_date set status = 'close' where date='"+dbDate+"'");
            psmt.executeUpdate();
            /*out.print("<div style='padding:10px 10px;border:2px solid green;float:left'>"
                + "<button class='btn btn-danger' onclick='book_now(this);'>"
                +dbDate+"</button></div>");*/
        }
    }
    if (!flag) {
        out.print("0 results");
    }
    flag = false;
    query = "select * from book_date where date>=CURDATE()";
    smt = conn.createStatement();
    rst = smt.executeQuery(query);
    while(rst.next()) {
        if (!flag) {
            flag = true;
        }
              if (rst.getString("status").equals("close")) {
            out.print("<div style='padding:10px 10px;border:2px solid green;float:left'>"
                    + "<button class='btn btn-danger' onclick='book_now(this);' disabled>"
                    +rst.getString(2)+"</button></div>");           
        } else {
            out.print("<div style='padding:10px 10px;border:2px solid green;float:left'>"
                    + "<button class='btn btn-success' onclick='book_now(this);'>"
                    +rst.getString(2)+"</button></div>");	
        }
    }
    if (flag) {
        out.print("<div style='clear:both'></div>");
    } else {
        out.print("0 results");
    }
    conn.close();
} catch (Exception e) {
    out.print(e.getMessage());
}


%>