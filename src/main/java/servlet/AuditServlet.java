package servlet;

import dao.DeliveryDAO;
import dao.SchoolDAO;
import dao.VehicleDAO; // 1. Import DAO baru
import model.User;
import model.School;
import model.Vehicle; // 2. Import Model baru

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/audit")
public class AuditServlet extends HttpServlet {

    private DeliveryDAO deliveryDAO = new DeliveryDAO();
    private SchoolDAO schoolDAO = new SchoolDAO();
    private VehicleDAO vehicleDAO = new VehicleDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !"admin_audit".equals(user.getRole())) {
            resp.sendRedirect("Login.jsp");
            return;
        }

        req.setAttribute("deliveries", deliveryDAO.getDeliveriesByDate(Date.valueOf(LocalDate.now())));

        String halaman = req.getParameter("halaman");

        if ("KelolaKendaraan".equals(halaman)) {
            List<Vehicle> listKendaraan = vehicleDAO.getAllVehicles();
            System.out.println("Jumlah kendaraan ditemukan: " + listKendaraan.size());
            req.setAttribute("dataKendaraan", listKendaraan);
        } else if ("KelolaSekolah".equals(halaman)) {
            List<School> listSekolah = schoolDAO.getAllSchools();
            req.setAttribute("dataSekolah", listSekolah);
        }

        req.setAttribute(
                "pendingDeliveries", deliveryDAO.getPendingDeliveriesForSchool(1, Date.valueOf(LocalDate.now())));

        req.getRequestDispatcher(
                "/DashboardAudit.jsp").forward(req, resp);
    }
}
