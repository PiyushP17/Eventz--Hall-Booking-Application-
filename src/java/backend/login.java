package backend;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import static backend.HashPass.md5;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
@WebServlet(urlPatterns = {"/login"})
public class login extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            try {
                if ("POST".equals(request.getMethod())) {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/hallbooking?zeroDateTimeBehavior=convertToNull",
                            "root","");
                    Statement smt = conn.createStatement();
                    ResultSet rst = null;
                    String bookingDate = request.getParameter("date");
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");
                    password = md5(password);
                    String type = request.getParameter("type");
                    String query = "select * from login where BINARY username = '"+username+"' and password = '"+password+"'";
                    rst = smt.executeQuery(query);
                    HttpSession session = request.getSession(true);
                    session.setAttribute("username",username);
                    session.setAttribute("type", "admin");
                    session.setMaxInactiveInterval(20*60);
                    if (type.equals("User")){
                        if (rst.next() && rst.getString(5).equals("user")) {
                            response.sendRedirect("booking.jsp");
                        } else {
                            out.print("<script>alert('Invalid Credntials');window.history.back();</script>");                    
                        }
                    } else if(type.equals("Admin")) {
                        if (rst.next() && rst.getString(5).equals("admin")) {
                            response.sendRedirect("home.jsp");  
                        } else {
                            out.print("<script>alert('Invalid Credntials');window.history.back();</script>");
                        }
                    } else {
                        out.print("<script type=\"text/javascript\"> alert(\"Select Usertype\");window.history.back();"
                                + "</script>");
                    }
                    conn.close();
                }
            } catch (Exception e) {
                out.print("Except" + e.getMessage());
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
