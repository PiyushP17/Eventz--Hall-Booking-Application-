<%-- 
    Document   : get_hall_booking_details
    Created on : 17 Jul, 2019, 9:48:13 PM
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
        String hall = request.getParameter("hall");
        String query = "select * from booking where hallid = '"+hall+"'";
        Statement smt = conn.createStatement();
        ResultSet rst = smt.executeQuery(query);
        out.print("<table class='table table-striped table-bordered'>"
                + "<tr class='info'><th>User Id</th>"
                + "<th>Date Booked</th>"
                + "<th>Hall Booked</th>"
                + "<th>Slot Booked</th></tr>");
        while (rst.next()) {
            out.print("<tr align='left'>");
            out.print("<td>"+rst.getString("userid")+"</td>"
                    + "<td>"+rst.getString("date")+"</td>"
                            + "<td>"+rst.getString("hallid")+"</td>"
                                    + "<td>"+rst.getString("slot")+"</td>");
            out.print("</tr>");
        }
        out.print("</table>");
        conn.close();
    } catch (Exception e) {
        out.print(e.getMessage());
    }
%>