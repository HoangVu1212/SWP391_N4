/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.Inventory;

import dal.InventoryDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Inventory;
import model.Material;
import model.Product;

/**
 *
 * @author hotdo
 */
@WebServlet(name="InventoryServlet", urlPatterns={"/inventoryservlet"})
public class InventoryServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InventoryServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InventoryServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   @Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
     InventoryDAO inventoryDAO = new InventoryDAO();
        
        // Get the categoryID parameter from the request
        String categoryIdParam = request.getParameter("categoryID");
        List<Product> products;
        List<Material> materials;
        
        if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
            // If categoryID is provided, parse it and filter products and materials by category
            int categoryId = Integer.parseInt(categoryIdParam);
            products = inventoryDAO.getProductsByCategory(categoryId);  // Filter products by category
            materials = inventoryDAO.getMaterialCategories();  // Filter materials by category
        } else {
            // If no categoryID, get all products and materials
            products = inventoryDAO.getAllProducts();
            materials = inventoryDAO.getMaterialCategories();
        }

        // Fetch product categories and material categories
        List<Category> productCategories = inventoryDAO.getProductCategories();
        List<Material> materialCategories = inventoryDAO.getMaterialCategories();
        
        // Set attributes for the JSP
        request.setAttribute("products", products);
        request.setAttribute("materials", materials);
        request.setAttribute("productCategories", productCategories);
        request.setAttribute("materialCategories", materialCategories);
        
        // Forward the request to the JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("Frontend_Staff/inventory.jsp");
        dispatcher.forward(request, response);
    }


    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
