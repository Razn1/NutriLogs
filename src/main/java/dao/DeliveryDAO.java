package dao;

import model.Delivery;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DeliveryDAO {

    public boolean createDelivery(Delivery delivery) {
        String sql = "INSERT INTO delivery_history (tanggal, kitchen_id, school_id, vehicle_id, account_id_pengirim, waktu_kirim, jumlah_kirim, status_pengiriman) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setDate(1, delivery.getTanggal());
            pstmt.setInt(2, delivery.getKitchenId());
            pstmt.setInt(3, delivery.getSchoolId());
            pstmt.setInt(4, delivery.getVehicleId());
            pstmt.setInt(5, delivery.getAccountIdPengirim());
            pstmt.setTimestamp(6, delivery.getWaktuKirim());
            pstmt.setInt(7, delivery.getJumlahKirim());
            pstmt.setString(8, "pending");

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Delivery> getDeliveriesByDate(Date date) {
        List<Delivery> list = new ArrayList<>();
        String sql = "SELECT d.*, s.nama as school_name, k.nama as kitchen_name, v.plat_nomor as vehicle_name " +
                "FROM delivery_history d " +
                "JOIN schools s ON d.school_id = s.id " +
                "JOIN kitchens k ON d.kitchen_id = k.id " +
                "JOIN vehicles v ON d.vehicle_id = v.id " +
                "WHERE d.tanggal = ? " +
                "ORDER BY d.waktu_kirim DESC";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setDate(1, date);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    list.add(mapResultSetToDelivery(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Delivery> getPendingDeliveriesForSchool(int schoolId, Date date) {
        List<Delivery> list = new ArrayList<>();
        String sql = "SELECT d.*, s.nama as school_name, k.nama as kitchen_name, v.plat_nomor as vehicle_name " +
                "FROM delivery_history d " +
                "JOIN schools s ON d.school_id = s.id " +
                "JOIN kitchens k ON d.kitchen_id = k.id " +
                "JOIN vehicles v ON d.vehicle_id = v.id " +
                "WHERE d.school_id = ? AND d.tanggal = ? AND d.status_pengiriman != 'diterima' " +
                "ORDER BY d.waktu_kirim ASC";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, schoolId);
            pstmt.setDate(2, date);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    list.add(mapResultSetToDelivery(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean confirmDelivery(int deliveryId, int qtyReceived, String quality, String notes, String photoPath) {
        String sql = "UPDATE delivery_history SET status_pengiriman = 'diterima', waktu_terima = NOW(), " +
                "jumlah_terima = ?, kualitas_makanan = ?, catatan_kualitas = ?, foto_bukti_path = ? " +
                "WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, qtyReceived);
            pstmt.setString(2, quality);
            pstmt.setString(3, notes);
            pstmt.setString(4, photoPath);
            pstmt.setInt(5, deliveryId);

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private Delivery mapResultSetToDelivery(ResultSet rs) throws SQLException {
        Delivery d = new Delivery();
        d.setId(rs.getInt("id"));
        d.setTanggal(rs.getDate("tanggal"));
        d.setKitchenId(rs.getInt("kitchen_id"));
        d.setSchoolId(rs.getInt("school_id"));
        d.setVehicleId(rs.getInt("vehicle_id"));
        d.setAccountIdPengirim(rs.getInt("account_id_pengirim"));
        d.setWaktuKirim(rs.getTimestamp("waktu_kirim"));
        d.setJumlahKirim(rs.getInt("jumlah_kirim"));
        d.setStatusPengiriman(rs.getString("status_pengiriman"));
        d.setWaktuTerima(rs.getTimestamp("waktu_terima"));
        d.setJumlahTerima(rs.getInt("jumlah_terima"));
        d.setKualitasMakanan(rs.getString("kualitas_makanan"));
        d.setCatatanKualitas(rs.getString("catatan_kualitas"));
        d.setFotoBuktiPath(rs.getString("foto_bukti_path"));

        d.setSchoolName(rs.getString("school_name"));
        d.setKitchenName(rs.getString("kitchen_name"));
        d.setVehicleName(rs.getString("vehicle_name"));
        return d;
    }
}
