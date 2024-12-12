package com.mdresort;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

public class servletSignup extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String firstName = request.getParameter("first-name");
        String lastName = request.getParameter("last-name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // JDBC connection details
        String url = "jdbc:oracle:thin:@localhost:1521:XE";  // Update with your Oracle DB details
        String username = "mdresort";  // Replace with your Oracle username
        String dbPassword = "mdresort";  // Replace with your Oracle password

        // Corrected SQL query to insert user data
        String insertQuery = "INSERT INTO customer (CUSTOMER_ID, FIRST_NAME, LAST_NAME, CUSTOMER_EMAIL, CUSTOMER_PASSWORD) VALUES (customer_seq.NEXTVAL, ?, ?, ?, ?)";

        try {
            // Load the Oracle JDBC driver
            Class.forName("oracle.jdbc.OracleDriver");

            // Establish connection to the Oracle database
            Connection conn = DriverManager.getConnection(url, username, dbPassword);

            // Prepare the SQL statement
            PreparedStatement stmt = conn.prepareStatement(insertQuery);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setString(4, password);

            // Execute the insert query
            int rowsAffected = stmt.executeUpdate();

            // Check if insertion was successful
            if (rowsAffected > 0) {
                // Success - Show success popup and redirect to login page
                response.setContentType("text/html");
                response.getWriter().println("<script type='text/javascript'>"
                        + "alert('Sign-up successful!');"
                        + "window.location.href = 'http://localhost:8089/MDResort/HTML/MdResort_LOGIN.html';"
                        + "</script>");
            } else {
                // Failure - Show error popup and return to signup page
                response.setContentType("text/html");
                response.getWriter().println("<script type='text/javascript'>"
                        + "alert('Error during sign-up. Please try again.');"
                        + "window.history.back();"
                        + "</script>");
            }

            // Close the statement and connection
            stmt.close();
            conn.close();
        } catch (SQLException | ClassNotFoundException e) {
            // Handle errors
            e.printStackTrace();
            response.setContentType("text/html");
            response.getWriter().println("<script type='text/javascript'>"
                    + "alert('Error: " + e.getMessage() + "');"
                    + "window.history.back();"
                    + "</script>");
        }
    }
}
