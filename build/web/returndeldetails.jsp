<%-- 
    Document   : returndeldetails
    Created on : 22 Jul, 2019, 9:22:10 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/hallbooking?zeroDateTimeBehavior=convertToNull",
                            "root","");
        String query = "select * from booking where date>=CURDATE()";
        Statement smt = conn.createStatement();
        ResultSet rst = smt.executeQuery(query);
        out.print("<h2 id='delh'> All available Bookings </h2><br/>");
        out.print( "<table class='table table-striped table-bordered' id='myTable'>");
        out.print( "<tr align='center'class='info'>");
        out.print( "<th>Username</th>");
        out.print( "<th>Date</th>");
        out.print( "<th>Hall Id</th>");
        out.print( "<th>Slot Id</th>");
        out.print( "<th>Delete Action</th>");
        out.print( "</tr>");
        int i = 0;
        while (rst.next()) {
            out.print("<tr align='left' id=r"+i+">");
            out.print("<td>"+rst.getString(1)+"</td>");
            out.print("<td>"+rst.getString(2)+"</td>");
            out.print("<td>"+rst.getString(3)+"</td>");
            out.print("<td>"+rst.getString(4)+"</td>");
            out.print("<td><a href=#delh><button id=b"+i+" class='btn btn-danger' onclick='deleteBookings(this.id)'>Delete</button></a></td>");
            out.print("</tr>");
            i++;
        }
        out.print("</table>");
        conn.close();
    } catch (Exception e) {
        out.print(e.getMessage());
    }
%>