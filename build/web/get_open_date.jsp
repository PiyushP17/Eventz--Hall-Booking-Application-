<%-- 
    Document   : get_open_date
    Created on : 18 Jul, 2019, 12:41:07 AM
    Author     : HP
--%>

<%@page import="java.time.LocalDate"%>
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
        query = "select * from book_date where sno = "+gno;
        smt = conn.createStatement();
        rst = smt.executeQuery(query);
        String lastDate = "";
        flag = false;
        while (rst.next()) {
            if (!flag) {
                flag = true;
            }
            lastDate = rst.getString("date");
        }
        if (!flag) {
            out.print("0 results");
        }
        //String saveLastDate = lastDate;
        LocalDate startDate = LocalDate.parse(lastDate);
        LocalDate saveStartDate = startDate;
        for(int i=1;i<=7;i++) {
            startDate = saveStartDate.plusDays((long)i);
            if(startDate.getDayOfWeek().getValue() != 7) {
                String newOpenDate = startDate.toString();
                out.print("<h5 style='color:blue;'>"+newOpenDate+"</h5>");
                out.print("<input type='text' name='txt"+count+"'"
                        + " value='"+newOpenDate+"' id='txt"+count+"'"
                                + " class='form-control' readonly /><br/>");
                count++;
            }
        }
        out.print("<button class='btn btn-danger' onclick='confirm_booking();'>Confirm Open Booking</button>");
        conn.close();
    } catch (Exception e) {
        out.print(e.getMessage());
    }
%>
