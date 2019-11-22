<%-- 
    Document   : get_user_details
    Created on : 17 Jul, 2019, 10:53:12 PM
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
        String query = "select username from login";
        Statement smt = conn.createStatement();
        ResultSet rst = smt.executeQuery(query);
        out.print("<option value='select'>--Select--</option>");
        while (rst.next()) {
            String uname = rst.getString("username");
            out.print("<option value='"+uname+"'>"+uname+"</option>");
        }
        conn.close();
    } catch (Exception e) {
        out.print(e.getMessage());
    }
 %>
    