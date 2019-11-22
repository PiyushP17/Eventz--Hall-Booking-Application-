<%-- 
    Document   : get_user_date_booking_details
    Created on : 17 Jul, 2019, 11:11:08 PM
    Author     : HP
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/hallbooking?zeroDateTimeBehavior=convertToNull",
                            "root","");
        String date = request.getParameter("date");
        String username = request.getParameter("username");
        String query = "select * from booking where date='"+date+"' and userid='"+username+"'";
        Statement smt = conn.createStatement();
        ResultSet rst = smt.executeQuery(query);
        boolean flag = false;
        while (rst.next()) {
            if (!flag) {
                flag=true;
                out.print("<table class='table table-striped table-bordered'>"
                + "<tr class='info'><th>User Id</th>"
                + "<th>Date Booked</th>"
                + "<th>Hall Booked</th>"
                + "<th>Slot Booked</th></tr>");
            }
            out.print("<tr align='left'>");
            out.print("<td>"+rst.getString("userid")+"</td>"
                    + "<td>"+rst.getString("date")+"</td>"
                            + "<td>"+rst.getString("hallid")+"</td>"
                                    + "<td>"+rst.getString("slot")+"</td>");
            out.print("</tr>");
        }
        out.print("</table>");
        if (!flag) {
            out.print("<h3>No Details Found</h3>");
        }
        conn.close();
    } catch (Exception e) {
        out.print(e.getMessage());
    }
%>