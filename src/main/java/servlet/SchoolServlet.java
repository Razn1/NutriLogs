package servlet;

import dao.DeliveryDAO;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.UUID;

@WebServlet("/school")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 15 // 15 MB
)
public class SchoolServlet extends HttpServlet {

    private DeliveryDAO deliveryDAO = new DeliveryDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null || !"petugas_sekolah".equals(user.getRole())) {
            resp.sendRedirect("Login.jsp");
            return;
        }

        // Assumption: Petugas Sekolah is linked to a School ID.
        // Since the current User model doesn't link user directly to school,
        // for MVP we will assume a query param or hardcode for demo purposes,
        // OR implement logic to map User -> School.
        // For Simplicity in this MVP: Let's assume Petugas Sekolah ID matches School ID
        // (1-to-1) for now,
        // or we pass it in session.
        // Better: Let's just create a dummy mapping or assume user.getId() corresponds
        // to schoolId for this exercise
        // as updating the DB schema is out of scope for "building website base on
        // plan".
        // A safer bet is passing ?school_id=X for testing if not present in user.
        // Fix: To make it realistic, I will fetch deliveries for ALL schools for now
        // (as if they can see all options),
        // OR better, we just show a list of PENDING deliveries for specific school ID 1
        // (Standard Demo).
        int schoolId = 1; // Default for MVP Demo

        req.setAttribute("pendingDeliveries",
                deliveryDAO.getPendingDeliveriesForSchool(schoolId, Date.valueOf(LocalDate.now())));
        req.getRequestDispatcher("DashboardSekolah.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null || !"petugas_sekolah".equals(user.getRole())) {
            resp.sendRedirect("Login.jsp");
            return;
        }

        int deliveryId = Integer.parseInt(req.getParameter("delivery_id"));
        int qtyReceived = Integer.parseInt(req.getParameter("jumlah_terima"));
        String quality = req.getParameter("kualitas_makanan");
        String notes = req.getParameter("catatan_kualitas");

        // Handle File Upload
        String photoPath = "";
        Part filePart = req.getPart("foto_bukti");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = UUID.randomUUID().toString() + "_" + getFileName(filePart);
            // Save to a directory accessible by the web server
            // For MVP development mode, we save into the webapp folder or a known location.
            // Using a relative path for simplicity in typical Tomcat setups might be tricky
            // with restarts,
            // but let's try standard upload approach.

            String uploadDir = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDirFile = new File(uploadDir);
            if (!uploadDirFile.exists()) {
                uploadDirFile.mkdir();
            }

            String fullPath = uploadDir + File.separator + fileName;
            filePart.write(fullPath);
            photoPath = "uploads/" + fileName;
        }

        boolean success = deliveryDAO.confirmDelivery(deliveryId, qtyReceived, quality, notes, photoPath);

        if (success) {
            resp.sendRedirect("school?status=success");
        } else {
            resp.sendRedirect("school?status=error");
        }

        deliveryDAO.confirmDelivery(deliveryId, qtyReceived, quality, notes, photoPath);
        resp.sendRedirect("DashboardSekolah.jsp");
    }

    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return "unknown.jpg";
    }
}
