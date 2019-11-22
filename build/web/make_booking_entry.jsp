<%-- 
    Document   : make_booking_entry
    Created on : 17 Jul, 2019, 12:24:44 PM
    Author     : HP
--%>

<%@page import="backend.HashPass"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/hallbooking?zeroDateTimeBehavior=convertToNull",
            "root","");
    Statement smt = null;
    ResultSet rst = null;
    String username = request.getParameter("userid");
    String password = request.getParameter("pass");
    password = HashPass.md5(password);
    String hallId = request.getParameter("hallid");
    String date = request.getParameter("date");
    String slotId = request.getParameter("slotid");
    String query = "select * from login where username = '"+username+"' and password = '"+password+"'";
    smt = conn.createStatement();
    rst = smt.executeQuery(query);
    if (rst.next()) {
        PreparedStatement psmt = conn.prepareStatement("insert into booking (userid,date,hallid,slot) values(?,?,?,?)");
        psmt.setString(1,username);
        psmt.setString(2,date);
        psmt.setString(3,hallId);
        psmt.setString(4,slotId);
        int status = psmt.executeUpdate();
        if (status>0) {
            out.print("Booking Done Successfully");
        } else {
            out.print("Error in Booking Hall");
        }
    } else {
        out.print("Invalid User");
    }
    conn.close();
    } catch (Exception e) {
        out.print(e.getMessage());
    }

%>
