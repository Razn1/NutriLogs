package dao;

import model.School;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SchoolDAO {

    public School findById(String id) throws SQLException {
        String sql = "SELECT * FROM schools WHERE id = ?";
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

    public List<School> findAll() throws SQLException {
        String sql = "SELECT * FROM schools ORDER BY nama ASC";
        List<School> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                list.add(mapRow(rs));
            }
        }
        return list;
    }

    private School mapRow(ResultSet rs) throws SQLException {
        School s = new School();
        s.setId(rs.getString("id"));
        s.setNama(rs.getString("nama"));
        s.setAlamat(rs.getString("alamat"));
        s.setJumlahSiswa(rs.getInt("jumlah_siswa"));
        return s;
    }
}
