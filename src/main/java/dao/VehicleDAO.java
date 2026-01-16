package dao;

import model.Vehicle;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VehicleDAO {

    public Vehicle findById(String id) throws SQLException {
        String sql = "SELECT * FROM vehicles WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return mapRow(rs);
                }
            }
        }
        return null;
    }

    public List<Vehicle> findAll() throws SQLException {
        String sql = "SELECT * FROM vehicles ORDER BY nama_kendaraan ASC";
        List<Vehicle> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                list.add(mapRow(rs));
            }
        }
        return list;
    }

    private Vehicle mapRow(ResultSet rs) throws SQLException {
        Vehicle v = new Vehicle();
        v.setId(rs.getString("id"));
        v.setNamaKendaraan(rs.getString("nama_kendaraan"));
        v.setJenisKendaraan(rs.getString("jenis_kendaraan"));
        v.setPlatNomor(rs.getString("plat_nomor"));
        v.setKapasitas(rs.getInt("kapasitas"));
        return v;
    }

    public void insert(Vehicle vehicle) throws SQLException {
        String sql = "INSERT INTO vehicles (id, nama_kendaraan, jenis_kendaraan, plat_nomor, kapasitas) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, vehicle.getId());
            pstmt.setString(2, vehicle.getNamaKendaraan());
            pstmt.setString(3, vehicle.getJenisKendaraan());
            pstmt.setString(4, vehicle.getPlatNomor());
            pstmt.setInt(5, vehicle.getKapasitas());
            pstmt.executeUpdate();
        }
    }

    public void update(Vehicle vehicle) throws SQLException {
        String sql = "UPDATE vehicles SET nama_kendaraan = ?, jenis_kendaraan = ?, plat_nomor = ?, kapasitas = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, vehicle.getNamaKendaraan());
            pstmt.setString(2, vehicle.getJenisKendaraan());
            pstmt.setString(3, vehicle.getPlatNomor());
            pstmt.setInt(4, vehicle.getKapasitas());
            pstmt.setString(5, vehicle.getId());
            pstmt.executeUpdate();
        }
    }

    public void delete(String id) throws SQLException {
        String sql = "DELETE FROM vehicles WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);
            pstmt.executeUpdate();
        }
    }
}
