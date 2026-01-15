package servlet;

import dao.UserDAO;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AuthServlet", urlPatterns = { "/login", "/logout" })
public class AuthServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        if ("/logout".equals(path)) {
            HttpSession session = req.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            resp.sendRedirect(req.getContextPath() + "/login");
        } else {
            // Forward to login page
            req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            User user = userDAO.findByEmail(email);
            if (user != null && user.getPassword().equals(password)) {
                // Login success
                HttpSession session = req.getSession();
                session.setAttribute("user", user);

                // Redirect based on role
                switch (user.getRole()) {
                    case admin_dapur:
                        resp.sendRedirect(req.getContextPath() + "/kitchen/dashboard");
                        break;
                    case petugas_sekolah:
                        resp.sendRedirect(req.getContextPath() + "/school/dashboard");
                        break;
                    case admin_audit:
                        resp.sendRedirect(req.getContextPath() + "/audit/dashboard");
                        break;
                    default:
                        resp.sendRedirect(req.getContextPath() + "/");
                }
            } else {
                // Login failed
                req.setAttribute("error", "Invalid email or password");
                req.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(req, resp);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
