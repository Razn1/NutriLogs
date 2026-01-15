package dao;

import model.Kitchen;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class KitchenDAO {

    public Kitchen findById(String id) throws SQLException {
        String sql = "SELECT * FROM kitchens WHERE id = ?";
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

    public List<Kitchen> findAll() throws SQLException {
        String sql = "SELECT * FROM kitchens ORDER BY nama ASC";
        List<Kitchen> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                list.add(mapRow(rs));
            }
        }
        return list;
    }

    private Kitchen mapRow(ResultSet rs) throws SQLException {
        Kitchen k = new Kitchen();
        k.setId(rs.getString("id"));
        k.setNama(rs.getString("nama"));
        k.setAlamat(rs.getString("alamat"));
        k.setKapasitas(rs.getInt("kapasitas"));
        k.setJumlahKaryawan(rs.getInt("jumlah_karyawan"));
        return k;
    }
}
