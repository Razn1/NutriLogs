package servlet;

import dao.DeliveryDAO;
import model.Delivery;
import util.AuditUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AuditServlet", urlPatterns = { "/audit/dashboard" })
public class AuditServlet extends HttpServlet {

    private DeliveryDAO deliveryDAO = new DeliveryDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Delivery> deliveries = deliveryDAO.findAll();
            req.setAttribute("deliveries", deliveries);
            req.setAttribute("auditUtils", new AuditUtils()); // For access in JSP
            req.getRequestDispatcher("/WEB-INF/views/audit/dashboard.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
