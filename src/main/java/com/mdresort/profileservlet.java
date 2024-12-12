package com.mdresort;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;

public class CustomerInfoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response content type
        response.setContentType("text/html;charset=UTF-8");

        // Get the session
        HttpSession session = request.getSession(false);

        // Check if the user is logged in
        if (session == null || session.getAttribute("user") == null) {
            response.getWriter().println("<script type=\"text/javascript\">alert('Please log in first!'); window.location.href='" + request.getContextPath() + "/HTML/MdResort_LOGIN.html';</script>");
            return;
        }

        // Retrieve customer details from session
        String customerName = (String) session.getAttribute("customer_name");
        String customerPassword = (String) session.getAttribute("customer_password");
        String customerPhoneNo = (String) session.getAttribute("customer_phoneno");
        String customerEmail = (String) session.getAttribute("customer_email");

        // Display customer information in HTML format
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html lang=\"en\">");
        out.println("<head>");
        out.println("<meta charset=\"UTF-8\">");
        out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">");
        out.println("<title>Customer Info</title>");
        out.println("<style>");
        out.println("body { font-family: Arial, sans-serif; background-color: #f5f5f5; margin: 0; padding: 0; display: flex; justify-content: center; align-items: center; height: 100vh; }");
        out.println(".info-container { background-color: white; padding: 30px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); width: 400px; }");
        out.println("h1 { font-size: 24px; color: #333; text-align: center; }");
        out.println(".info { margin-bottom: 15px; font-size: 16px; color: #555; }");
        out.println(".info span { font-weight: bold; color: #333; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<div class=\"info-container\">");
        out.println("<h1>Customer Information</h1>");
        out.println("<div class=\"info\">Name: <span>" + customerName + "</span></div>");
        out.println("<div class=\"info\">Password: <span>" + customerPassword + "</span></div>");
        out.println("<div class=\"info\">Phone Number: <span>" + customerPhoneNo + "</span></div>");
        out.println("<div class=\"info\">Email: <span>" + customerEmail + "</span></div>");
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
    }
}
