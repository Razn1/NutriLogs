package dao;

import model.*;
import model.enums.*;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DeliveryDAO {

    private KitchenDAO kitchenDAO = new KitchenDAO();
    private SchoolDAO schoolDAO = new SchoolDAO();
    private VehicleDAO vehicleDAO = new VehicleDAO();

    public void create(Delivery delivery) throws SQLException {
        String sql = "INSERT INTO delivery_history (id, tanggal, status_pengiriman, kitchen_id, school_id, vehicle_id, waktu_kirim, jumlah_kirim) "
                +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, delivery.getId());
            pstmt.setDate(2, Date.valueOf(delivery.getTanggal()));
            pstmt.setString(3, delivery.getStatusPengiriman().name());
            pstmt.setString(4, delivery.getKitchenId());
            pstmt.setString(5, delivery.getSchoolId());
            pstmt.setString(6, delivery.getVehicleId());
            pstmt.setTimestamp(7,
                    delivery.getWaktuKirim() != null ? Timestamp.valueOf(delivery.getWaktuKirim()) : null);
            pstmt.setInt(8, delivery.getJumlahKirim());

            pstmt.executeUpdate();
        }
    }

    public void updateReceivingInfo(Delivery delivery) throws SQLException {
        String sql = "UPDATE delivery_history SET status_pengiriman = ?, waktu_terima = ?, jumlah_terima = ?, kualitas_makanan = ?, "
                +
                "catatan_kualitas = ?, foto_bukti_path = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, delivery.getStatusPengiriman().name());
            pstmt.setTimestamp(2,
                    delivery.getWaktuTerima() != null ? Timestamp.valueOf(delivery.getWaktuTerima()) : null);
            if (delivery.getJumlahTerima() != null)
                pstmt.setInt(3, delivery.getJumlahTerima());
            else
                pstmt.setNull(3, Types.INTEGER);
            if (delivery.getKualitasMakanan() != null)
                pstmt.setString(4, delivery.getKualitasMakanan().name());
            else
                pstmt.setNull(4, Types.VARCHAR);
            pstmt.setString(5, delivery.getCatatanKualitas());
            pstmt.setString(6, delivery.getFotoBuktiPath());
            pstmt.setString(7, delivery.getId());

            pstmt.executeUpdate();
        }
    }

    // Simplified list fetch without joins for now, or we can fetch eagerly
    public List<Delivery> findAll() throws SQLException {
        String sql = "SELECT * FROM delivery_history ORDER BY tanggal DESC, waktu_kirim DESC";
        return fetchList(sql);
    }

    public List<Delivery> findByKitchen(String kitchenId) throws SQLException {
        String sql = "SELECT * FROM delivery_history WHERE kitchen_id = ? ORDER BY tanggal DESC";
        return fetchList(sql, kitchenId);
    }

    public List<Delivery> findBySchool(String schoolId) throws SQLException {
        String sql = "SELECT * FROM delivery_history WHERE school_id = ? ORDER BY tanggal DESC";
        return fetchList(sql, schoolId);
    }

    public Delivery findById(String id) throws SQLException {
        String sql = "SELECT * FROM delivery_history WHERE id = ?";
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

    private List<Delivery> fetchList(String sql, String... params) throws SQLException {
        List<Delivery> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            for (int i = 0; i < params.length; i++) {
                pstmt.setString(i + 1, params[i]);
            }

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    list.add(mapRow(rs));
                }
            }
        }
        return list;
    }

    private Delivery mapRow(ResultSet rs) throws SQLException {
        Delivery d = new Delivery();
        d.setId(rs.getString("id"));
        d.setTanggal(rs.getDate("tanggal").toLocalDate());
        d.setStatusPengiriman(DeliveryStatus.valueOf(rs.getString("status_pengiriman")));
        d.setKitchenId(rs.getString("kitchen_id"));
        d.setSchoolId(rs.getString("school_id"));
        d.setVehicleId(rs.getString("vehicle_id"));

        Timestamp tsKirim = rs.getTimestamp("waktu_kirim");
        if (tsKirim != null)
            d.setWaktuKirim(tsKirim.toLocalDateTime());

        d.setJumlahKirim(rs.getInt("jumlah_kirim"));

        Timestamp tsTerima = rs.getTimestamp("waktu_terima");
        if (tsTerima != null)
            d.setWaktuTerima(tsTerima.toLocalDateTime());

        int jmlTerima = rs.getInt("jumlah_terima");
        if (!rs.wasNull())
            d.setJumlahTerima(jmlTerima);

        String qual = rs.getString("kualitas_makanan");
        if (qual != null)
            d.setKualitasMakanan(FoodQuality.valueOf(qual));

        d.setCatatanKualitas(rs.getString("catatan_kualitas"));
        d.setFotoBuktiPath(rs.getString("foto_bukti_path"));

        // Eager load relations (simple N+1 for now, optimized later if needed)
        // ideally we join, but for demo simpler code is better
        d.setKitchen(kitchenDAO.findById(d.getKitchenId()));
        d.setSchool(schoolDAO.findById(d.getSchoolId()));
        d.setVehicle(vehicleDAO.findById(d.getVehicleId()));

        return d;
    }
}
