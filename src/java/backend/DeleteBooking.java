/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package backend;

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
@WebServlet(name = "DeleteBooking", urlPatterns = {"/DeleteBooking"})
public class DeleteBooking extends HttpServlet {

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
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/hallbooking?zeroDateTimeBehavior=convertToNull",
                        "root","");
                String username = request.getParameter("userid");
                String date = request.getParameter("date");
                String hallid = request.getParameter("hallid");
                String slot = request.getParameter("slot");
                String query = "delete from booking where userid = '"+username+"' and date='"+date+"' and hallid='"+hallid+"' and slot='"+slot+"'";
                PreparedStatement smt = conn.prepareStatement(query);
                int updateStatus = smt.executeUpdate();
                if (updateStatus > 0) {
                    // Updating book_date table to reflect open status
                    query = "update book_date set status = 'open' where date = '"+date+"'";
                    smt = conn.prepareStatement(query);
                    if(smt.executeUpdate() > 0) {
                        out.println("Deleted Successfully");
                    } else {
                        out.print("Error in Deleting");
                    }
                } else {
                    out.println("Error in Updating Details");
                }
                conn.close();
            } catch (Exception e) {
                out.print(e.getMessage());
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
