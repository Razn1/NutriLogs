package servlet;

import dao.DataDAO;
import dao.DeliveryDAO;
import model.Delivery;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.sql.Date;
import java.time.LocalDate;

@WebServlet("/kitchen")
public class KitchenServlet extends HttpServlet {

    private DataDAO dataDAO = new DataDAO();
    private DeliveryDAO deliveryDAO = new DeliveryDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !"admin_dapur".equals(user.getRole())) {
            resp.sendRedirect("Login.jsp");
            return;
        }

        req.setAttribute("schools", dataDAO.getAllSchools());
        req.setAttribute("kitchens", dataDAO.getAllKitchens());
        req.setAttribute("vehicles", dataDAO.getAllVehicles());
        req.setAttribute("deliveries", deliveryDAO.getDeliveriesByDate(Date.valueOf(LocalDate.now())));

        req.getRequestDispatcher("/WEB-INF/DashboardDapur.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect("Login.jsp");
            return;
        }

        try {
            Delivery d = new Delivery();
            d.setTanggal(Date.valueOf(LocalDate.now()));
            d.setKitchenId(Integer.parseInt(req.getParameter("kitchen_id")));
            d.setSchoolId(Integer.parseInt(req.getParameter("school_id")));
            d.setVehicleId(Integer.parseInt(req.getParameter("vehicle_id")));
            d.setAccountIdPengirim(user.getId()); // Mengambil ID dari session login
            d.setWaktuKirim(new Timestamp(System.currentTimeMillis()));
            d.setJumlahKirim(Integer.parseInt(req.getParameter("jumlah_kirim")));

            System.out.println("DEBUG: Mencoba insert data untuk User ID: " + user.getId());

            boolean isSuccess = deliveryDAO.createDelivery(d);

            if (isSuccess) {
                session.setAttribute("message", "Data pengiriman berhasil disimpan!");
            } else {
                session.setAttribute("error", "Gagal menyimpan ke database. Cek Console IDE.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("error", "Terjadi kesalahan input: " + e.getMessage());
        }

        resp.sendRedirect("kitchen");
    }
}
