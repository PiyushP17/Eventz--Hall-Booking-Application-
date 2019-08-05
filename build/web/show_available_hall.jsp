<%-- 
    Document   : show_available_hall
    Created on : 17 Jul, 2019, 12:07:22 AM
    Author     : HP
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
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
        conn.close();
    } catch (Exception e) {
        out.print(e.getMessage());
    }
%>

