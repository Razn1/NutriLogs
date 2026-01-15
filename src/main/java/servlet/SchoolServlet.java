package servlet;

import dao.DeliveryDAO;
import model.Delivery;
import model.enums.FoodQuality;
import model.enums.DeliveryStatus;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "SchoolServlet", urlPatterns = { "/school/dashboard", "/school/confirm" })
public class SchoolServlet extends HttpServlet {

    private DeliveryDAO deliveryDAO = new DeliveryDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        try {
            if (path.equals("/school/dashboard")) {
                showDashboard(req, resp);
            } else if (path.equals("/school/confirm")) {
                showConfirmForm(req, resp);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void showDashboard(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException, SQLException {
        // Hardcoded school_id = 's1'
        String schoolId = "s1";

        List<Delivery> deliveries = deliveryDAO.findBySchool(schoolId);
        req.setAttribute("deliveries", deliveries);
        req.getRequestDispatcher("/WEB-INF/views/school/dashboard.jsp").forward(req, resp);
    }

    private void showConfirmForm(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException, SQLException {
        String id = req.getParameter("id");
        Delivery delivery = deliveryDAO.findById(id);
        req.setAttribute("delivery", delivery);
        req.getRequestDispatcher("/WEB-INF/views/school/confirm.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        if (path.equals("/school/confirm")) {
            try {
                processConfirm(req, resp);
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        }
    }

    private void processConfirm(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        String id = req.getParameter("id");
        Delivery d = deliveryDAO.findById(id);

        if (d != null) {
            d.setWaktuTerima(LocalDateTime.now());
            d.setJumlahTerima(Integer.parseInt(req.getParameter("jumlahTerima")));
            d.setKualitasMakanan(FoodQuality.valueOf(req.getParameter("kualitasMakanan")));
            d.setCatatanKualitas(req.getParameter("catatanKualitas"));
            // File upload skip for now in demo logic, assume path handled separately or
            // null

            d.setStatusPengiriman(DeliveryStatus.diterima);
            if (d.getKualitasMakanan() == FoodQuality.buruk || d.getJumlahTerima() < d.getJumlahKirim()) {
                d.setStatusPengiriman(DeliveryStatus.bermasalah);
            }

            deliveryDAO.updateReceivingInfo(d);
        }

        resp.sendRedirect(req.getContextPath() + "/school/dashboard");
    }
}
