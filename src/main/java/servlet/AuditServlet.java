package servlet;

import dao.DeliveryDAO;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

@WebServlet("/audit")
public class AuditServlet extends HttpServlet {
    private DeliveryDAO deliveryDAO = new DeliveryDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null || !"admin_audit".equals(user.getRole())) {
            resp.sendRedirect("login.jsp");
            return;
        }

        req.setAttribute("deliveries", deliveryDAO.getDeliveriesByDate(Date.valueOf(LocalDate.now())));
        req.getRequestDispatcher("dashboard_audit.jsp").forward(req, resp);
    }
}
