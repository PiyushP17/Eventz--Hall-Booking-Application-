/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package backend;

import static backend.HashPass.md5;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@WebServlet(name = "SignUp", urlPatterns = {"/SignUp"})
public class SignUp extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Connection conn = null;
            /* TODO output your page here. You may use following sample code. */
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hallbooking?zeroDateTimeBehavior=convertToNull",
                        "root","");
                String query = "insert into login (username,password,securityquestion,answer,type,email)"
                        + "values (?,?,?,?,?,?)";
                String type = "user";
                if (request.getParameterMap().containsKey("type")) {
                    type = request.getParameter("type");
                }
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String cpassword = request.getParameter("cpassword");
                password = md5(password);
                String ques = request.getParameter("secque");
                String answer = request.getParameter("answer");
                PreparedStatement psmt = conn.prepareStatement(query);
                psmt.setString(1,username);
                psmt.setString(2,password);
                psmt.setString(3,ques);
                psmt.setString(4,answer);
                psmt.setString(5,type);
                psmt.setString(6,email);
                int status = psmt.executeUpdate();
                if (status>0) {
                    if(type.equals("user")) {
                        out.print("<script>alert('User Registered Succefully');"+
                        "var timer = setTimeout(function() {\n" +
                        "window.location.href='/hall_booking/login.jsp'\n" +
                        "}, 400);\n" +
                        "</script>");
                        //response.sendRedirect("login.jsp");
                    } else {
                        out.print("New Admin Added Successfully");
                    }
                } else {
                    out.print("Error occured , Please hit back button");
                }
                conn.close();
            } catch (Exception e) { 
                out.print("User Already Exists, you will be redirected to Login Page automatically in 3 seconds"+
                        "<script>\n" +
                        "var timer = setTimeout(function() {\n" +
                        "window.location.href='/hall_booking/login.jsp'\n" +
                        "}, 5000);\n" +
                        "</script>");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
