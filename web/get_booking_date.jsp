<%-- 
    Document   : get_booking_date
    Created on : 17 Jul, 2019, 11:06:50 PM
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
        String query = "select distinct date from booking";
        Statement smt = conn.createStatement();
        ResultSet rst = smt.executeQuery(query);
        out.print("<option value='select'>--Select--</option>");
        while (rst.next()) {
            String date = rst.getString("date");
            out.print("<option value='"+date+"'>"+date+"</option>");
        }
        conn.close();
    } catch (Exception e) {
        out.print(e.getMessage());
    }
 %>
    
