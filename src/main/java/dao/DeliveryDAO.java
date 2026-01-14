package dao;

import model.Delivery;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DeliveryDAO {

    public boolean createDelivery(Delivery delivery) {
        // HANYA kolom manual. Jangan masukkan id, is_late_departure, is_late_arrival, selisih_porsi.
        String sql = "INSERT INTO delivery_history (tanggal, kitchen_id, school_id, vehicle_id, "
                + "account_id_pengirim, waktu_kirim, jumlah_kirim, status_pengiriman) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?::delivery_status)";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setDate(1, delivery.getTanggal());
            pstmt.setInt(2, delivery.getKitchenId());
            pstmt.setInt(3, delivery.getSchoolId());
            pstmt.setInt(4, delivery.getVehicleId());
            pstmt.setInt(5, delivery.getAccountIdPengirim());
            pstmt.setTimestamp(6, delivery.getWaktuKirim());
            pstmt.setInt(7, delivery.getJumlahKirim());
            pstmt.setString(8, "pending");

            int rows = pstmt.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            System.err.println("CRITICAL DATABASE ERROR: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public List<Delivery> getDeliveriesByDate(Date date) {
        List<Delivery> list = new ArrayList<>();
        // Gunakan LEFT JOIN agar jika ada data Master yang terhapus, data transaksi tetap muncul
        String sql = "SELECT d.*, s.nama as school_name, k.nama as kitchen_name, v.plat_nomor as vehicle_name "
                + "FROM delivery_history d "
                + "LEFT JOIN schools s ON d.school_id = s.id "
                + "LEFT JOIN kitchens k ON d.kitchen_id = k.id "
                + "LEFT JOIN vehicles v ON d.vehicle_id = v.id "
                + "WHERE d.tanggal = ? "
                + "ORDER BY d.waktu_kirim DESC";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
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
        d.setSchoolName(rs.getString("school_name"));
        d.setKitchenName(rs.getString("kitchen_name"));
        d.setVehicleName(rs.getString("vehicle_name"));
        return d;
    }

    public List<Delivery> getPendingDeliveriesForSchool(int schoolId, Date tanggal) {
        List<Delivery> list = new ArrayList<>();
        // Menggunakan JOIN agar nama sekolah, dapur, dan kendaraan juga ikut terbawa
        String sql = "SELECT d.*, s.nama as school_name, k.nama as kitchen_name, v.plat_nomor as vehicle_name "
                + "FROM delivery_history d "
                + "LEFT JOIN schools s ON d.school_id = s.id "
                + "LEFT JOIN kitchens k ON d.kitchen_id = k.id "
                + "LEFT JOIN vehicles v ON d.vehicle_id = v.id "
                + "WHERE d.school_id = ? AND d.tanggal = ? AND d.status_pengiriman = 'pending'";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, schoolId);
            pstmt.setDate(2, tanggal);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    // Menggunakan fungsi map yang sudah Anda buat sebelumnya
                    list.add(mapResultSetToDelivery(rs));
                }
            }
        } catch (SQLException e) {
            System.err.println("Error fetching pending deliveries: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    public boolean confirmDelivery(int deliveryId, int qtyReceived, String quality, String notes, String photoPath) {
        // Kita update data pengiriman yang sudah ada
        // Set status menjadi 'received' (sesuaikan dengan enum di database Anda)
        // Serta mencatat waktu tiba (waktu_tiba) secara otomatis menggunakan CURRENT_TIMESTAMP
        String sql = "UPDATE delivery_history SET "
                + "jumlah_terima = ?, "
                + "kualitas_makanan = ?, "
                + "catatan_kualitas = ?, "
                + "foto_bukti = ?, "
                + "status_pengiriman = 'received'::delivery_status, "
                + "waktu_tiba = CURRENT_TIMESTAMP "
                + "WHERE id = ?";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, qtyReceived);
            pstmt.setString(2, quality);
            pstmt.setString(3, notes);
            pstmt.setString(4, photoPath);
            pstmt.setInt(5, deliveryId);

            int rows = pstmt.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            System.err.println("Error confirming delivery: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public int countDeliveriesByStatus(Date date, String status) {
        String sql = "SELECT COUNT(*) FROM delivery_history WHERE tanggal = ? AND status_pengiriman = ?::delivery_status";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setDate(1, date);
            pstmt.setString(2, status);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int countTotalDeliveries(Date date) {
        String sql = "SELECT COUNT(*) FROM delivery_history WHERE tanggal = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setDate(1, date);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
