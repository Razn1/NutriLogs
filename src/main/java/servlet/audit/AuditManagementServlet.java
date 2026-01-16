package servlet.audit;

import dao.SchoolDAO;
import dao.VehicleDAO;
import model.School;
import model.Vehicle;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AuditManagementServlet", urlPatterns = { "/audit/management" })
public class AuditManagementServlet extends HttpServlet {

    private SchoolDAO schoolDAO = new SchoolDAO();
    private VehicleDAO vehicleDAO = new VehicleDAO();
    private dao.UserDAO userDAO = new dao.UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<School> schools = schoolDAO.findAll();
            List<Vehicle> vehicles = vehicleDAO.findAll();
            List<model.User> users = userDAO.findAll();

            req.setAttribute("schools", schools);
            req.setAttribute("vehicles", vehicles);
            req.setAttribute("users", users);

            req.getRequestDispatcher("/WEB-INF/views/audit/management.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException("Database error in AuditManagementServlet", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        try {
            if ("addSchool".equals(action)) {
                addSchool(req);
            } else if ("updateSchool".equals(action)) {
                updateSchool(req);
            } else if ("deleteSchool".equals(action)) {
                deleteSchool(req);
            } else if ("addVehicle".equals(action)) {
                addVehicle(req);
            } else if ("updateVehicle".equals(action)) {
                updateVehicle(req);
            } else if ("deleteVehicle".equals(action)) {
                deleteVehicle(req);
            } else if ("addUser".equals(action)) {
                addUser(req);
            } else if ("updateUser".equals(action)) {
                updateUser(req);
            } else if ("deleteUser".equals(action)) {
                deleteUser(req);
            }
        } catch (SQLException e) {
            throw new ServletException("Database error processing action: " + action, e);
        }

        resp.sendRedirect(req.getContextPath() + "/audit/management");
    }

    private void addSchool(HttpServletRequest req) throws SQLException {
        School s = new School();
        s.setId(req.getParameter("id"));
        s.setNama(req.getParameter("nama"));
        s.setAlamat(req.getParameter("alamat"));
        s.setJumlahSiswa(Integer.parseInt(req.getParameter("jumlahSiswa")));
        schoolDAO.insert(s);
    }

    private void updateSchool(HttpServletRequest req) throws SQLException {
        School s = new School();
        s.setId(req.getParameter("id"));
        s.setNama(req.getParameter("nama"));
        s.setAlamat(req.getParameter("alamat"));
        s.setJumlahSiswa(Integer.parseInt(req.getParameter("jumlahSiswa")));
        schoolDAO.update(s);
    }

    private void deleteSchool(HttpServletRequest req) throws SQLException {
        String id = req.getParameter("id");
        schoolDAO.delete(id);
    }

    private void addVehicle(HttpServletRequest req) throws SQLException {
        Vehicle v = new Vehicle();
        v.setId(req.getParameter("id"));
        v.setNamaKendaraan(req.getParameter("namaKendaraan"));
        v.setJenisKendaraan(req.getParameter("jenisKendaraan"));
        v.setPlatNomor(req.getParameter("platNomor"));
        v.setKapasitas(Integer.parseInt(req.getParameter("kapasitas")));
        vehicleDAO.insert(v);
    }

    private void updateVehicle(HttpServletRequest req) throws SQLException {
        Vehicle v = new Vehicle();
        v.setId(req.getParameter("id"));
        v.setNamaKendaraan(req.getParameter("namaKendaraan"));
        v.setJenisKendaraan(req.getParameter("jenisKendaraan"));
        v.setPlatNomor(req.getParameter("platNomor"));
        v.setKapasitas(Integer.parseInt(req.getParameter("kapasitas")));
        vehicleDAO.update(v);
    }

    private void deleteVehicle(HttpServletRequest req) throws SQLException {
        String id = req.getParameter("id");
        vehicleDAO.delete(id);
    }

    private void addUser(HttpServletRequest req) throws SQLException {
        model.User u = new model.User();
        u.setId(req.getParameter("id"));
        u.setNama(req.getParameter("nama"));
        u.setEmail(req.getParameter("email"));
        u.setPassword(req.getParameter("password")); // Note: In real app, hash this!
        u.setRole(model.enums.UserRole.valueOf(req.getParameter("role")));
        userDAO.insert(u);
    }

    private void updateUser(HttpServletRequest req) throws SQLException {
        model.User u = new model.User();
        u.setId(req.getParameter("id"));
        u.setNama(req.getParameter("nama"));
        u.setEmail(req.getParameter("email"));
        u.setPassword(req.getParameter("password")); // Note: In real app, hash this!
        u.setRole(model.enums.UserRole.valueOf(req.getParameter("role")));
        userDAO.update(u);
    }

    private void deleteUser(HttpServletRequest req) throws SQLException {
        String id = req.getParameter("id");
        userDAO.delete(id);
    }
}
