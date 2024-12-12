package com.mdresort;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response content type
        response.setContentType("text/html;charset=UTF-8");

        // Get email and password from the login form
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Database connection details
        String dbUrl = "jdbc:oracle:thin:@localhost:1521:XE";  // Replace 'XE' with your Oracle service name if needed
        String dbUsername = "mdresort";  // Your Oracle username
        String dbPassword = "mdresort";  // Your Oracle password

        // SQL query to validate user credentials
        String loginQuery = "SELECT * FROM customer WHERE CUSTOMER_EMAIL = ? AND CUSTOMER_PASSWORD = ?";

        try {
            // Load the Oracle JDBC driver
            Class.forName("oracle.jdbc.OracleDriver");

            // Establish database connection
            Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

            // Prepare the SQL statement
            PreparedStatement stmt = conn.prepareStatement(loginQuery);
            stmt.setString(1, email);
            stmt.setString(2, password);

            // Execute the query
            ResultSet rs = stmt.executeQuery();

            // Check if user exists
            if (rs.next()) {
                // Login successful, set session attribute and redirect to homepage
                HttpSession session = request.getSession();
                session.setAttribute("user", rs.getString("FIRST_NAME")); // Store user's first name in session

                // Redirect to homepage dynamically using context path
                response.sendRedirect(request.getContextPath() + "/HTML/MdResort_HOMEPAGE.jsp");
            } else {
                // Login failed, send error message and redirect to login page
                PrintWriter out = response.getWriter();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Invalid email or password');");
                out.println("window.location.href='" + request.getContextPath() + "/HTML/MdResort_LOGIN.html';");
                out.println("</script>");
            }

            // Close resources
            rs.close();
            stmt.close();
            conn.close();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("Error: JDBC Driver not found.");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: Database connection issue.");
        }
    }
}
