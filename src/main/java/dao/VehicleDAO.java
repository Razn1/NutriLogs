package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Vehicle;
import util.DBConnection;

public class VehicleDAO {

    public List<Vehicle> getAllVehicles() {
        List<Vehicle> list = new ArrayList<>();
        // WAJIB ganti menjadi 'vehicles' sesuai database Anda
        String sql = "SELECT * FROM vehicles ORDER BY id DESC";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Vehicle v = new Vehicle();
                v.setId(rs.getInt("id"));
                v.setNamaKendaraan(rs.getString("nama_kendaraan")); // Sesuai DB
                v.setJenisKendaraan(rs.getString("jenis_kendaraan")); // Sesuai DB
                v.setPlatNomor(rs.getString("plat_nomor"));
                v.setKapasitas(rs.getInt("kapasitas"));
                list.add(v);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
