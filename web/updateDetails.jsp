<%-- 
    Document   : updateDetails
    Created on : 20 Jul, 2019, 4:51:49 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/hallbooking?zeroDateTimeBehavior=convertToNull",
                            "root","");
        String username = session.getAttribute("username").toString();
        String query = "select * from login where username = '"+username+"'";
        Statement smt = conn.createStatement();
        ResultSet rst = smt.executeQuery(query);
        Map<String,String> dataArray = new HashMap<String,String>();
        ObjectMapper objMapper = new ObjectMapper();
        if (rst.next()) {
            dataArray.put("username", rst.getString("username"));
            dataArray.put("email", rst.getString("email"));
            dataArray.put("securityquestion", rst.getString("securityquestion"));
            dataArray.put("answer", rst.getString("answer")); 
        }
        String jsonString = objMapper.writeValueAsString(dataArray);
        out.print(jsonString);
        conn.close();
    } catch (Exception e) {
        out.print(e.getMessage());
    }

%>