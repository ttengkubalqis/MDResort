package com.dummyProject;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class dummyServlet
 */
public class dummyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public dummyServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Log output to test the servlet
        response.getWriter().append("Served at: ").append(request.getContextPath());

        // Forward to the JSP page (absolute path for clarity)
        request.getRequestDispatcher("/home.jsp").forward(request, response);
    }
}