<%-- 
    Document   : confirm_booking
    Created on : 18 Jul, 2019, 12:12:24 AM
    Author     : HP
--%>

<%@page import="java.sql.PreparedStatement"%>
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
        String query = "select max(sno) as sno from book_date";
        Statement smt = conn.createStatement();
        ResultSet rst = smt.executeQuery(query);
        String id = "";
        int gno = 0;
        int count = 1;
        boolean flag = false;
        while(rst.next()) {
            gno = rst.getInt("sno");
            flag = true;
        }
        if(!flag) {
            out.print("0 results");
        }
        gno+=1;
        flag = false;
        for (int i = 1; i<=6; i++) {
            id = "txt"+count;
            PreparedStatement psmt = conn.prepareStatement("insert into book_date (sno,date,status) values (?,?,?)");
            psmt.setInt(1,gno);
            psmt.setString(2, request.getParameter(id));
            psmt.setString(3, "open");
            int insertStatus = psmt.executeUpdate();
            if (insertStatus>0) {
                flag = true;
            } else {
                out.print("SQL Error");
            }
            count++;
            gno++;
        }
        if (flag) {
            out.print("New booking dates have been opened<script>window.location='#openbooking';</script>");
        }
        conn.close();
    } catch (Exception e) {
        
    }
%>