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

@WebServlet("/auth")
public class AuthServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("Login".equals(action)) {
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            User user = userDAO.Login(email, password);

            if (user != null) {
                HttpSession session = req.getSession();
                session.setAttribute("user", user);

                // Redirect berdasarkan role
                switch (user.getRole()) {
                    case "admin_dapur":
                        resp.sendRedirect("DashboardDapur.jsp");
                        break;
                    case "petugas_sekolah":
                        resp.sendRedirect("DashboardSekolah.jsp");
                        break;
                    case "admin_audit":
                        resp.sendRedirect("DashboardAudit.jsp");
                        break;
                    default:
                        resp.sendRedirect("Login.jsp?status=error");
                }
            } else {
                resp.sendRedirect("Login.jsp?status=error");
            }
        } else if ("logout".equals(action)) {
            req.getSession().invalidate();
            resp.sendRedirect("Login.jsp");
        }
    }
}
