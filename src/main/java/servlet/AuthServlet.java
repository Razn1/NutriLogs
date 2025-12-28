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

        if ("login".equals(action)) {
            User user = userDAO.login(req.getParameter("email"), req.getParameter("password"));
            if (user != null) {
                HttpSession session = req.getSession();
                session.setAttribute("user", user);

                switch (user.getRole()) {
                    case "admin_dapur":
                        resp.sendRedirect("kitchen");
                        break;
                    case "petugas_sekolah":
                        resp.sendRedirect("school");
                        break;
                    case "admin_audit":
                        resp.sendRedirect("audit");
                        break;
                    default:
                        resp.sendRedirect("login.jsp?error=Invalid role");
                }
            } else {
                resp.sendRedirect("login.jsp?error=Invalid credentials");
            }
        } else if ("logout".equals(action)) {
            req.getSession().invalidate();
            resp.sendRedirect("login.jsp");
        }
    }
}
