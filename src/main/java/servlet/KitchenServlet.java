package servlet;

import dao.*;
import model.*;
import model.enums.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "KitchenServlet", urlPatterns = { "/kitchen/dashboard", "/kitchen/delivery",
        "/kitchen/delivery/submit" })
public class KitchenServlet extends HttpServlet {

    private DeliveryDAO deliveryDAO = new DeliveryDAO();
    private SchoolDAO schoolDAO = new SchoolDAO();
    private VehicleDAO vehicleDAO = new VehicleDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        try {
            if (path.equals("/kitchen/dashboard")) {
                showDashboard(req, resp);
            } else if (path.equals("/kitchen/delivery")) {
                showDeliveryForm(req, resp);
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void showDashboard(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException, SQLException {
        String kitchenId = "k1";

        List<Delivery> deliveries = deliveryDAO.findByKitchen(kitchenId);
        req.setAttribute("deliveries", deliveries);
        req.getRequestDispatcher("/WEB-INF/views/kitchen/dashboard.jsp").forward(req, resp);
    }

    private void showDeliveryForm(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException, SQLException {
        List<School> schools = schoolDAO.findAll();
        List<Vehicle> vehicles = vehicleDAO.findAll();
        req.setAttribute("schools", schools);
        req.setAttribute("vehicles", vehicles);
        req.getRequestDispatcher("/WEB-INF/views/kitchen/delivery.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        if (path.equals("/kitchen/delivery/submit")) {
            try {
                processDelivery(req, resp);
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        }
    }

    private void processDelivery(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException {
        Delivery d = new Delivery();
        d.setId(UUID.randomUUID().toString());
        d.setTanggal(LocalDate.now());
        d.setStatusPengiriman(DeliveryStatus.dikirim);
        d.setKitchenId("k1"); // Hardcoded for demo
        d.setSchoolId(req.getParameter("schoolId"));
        d.setVehicleId(req.getParameter("vehicleId"));
        d.setWaktuKirim(LocalDateTime.now());
        d.setJumlahKirim(Integer.parseInt(req.getParameter("jumlahKirim")));

        deliveryDAO.create(d);

        resp.sendRedirect(req.getContextPath() + "/kitchen/dashboard");
    }
}
