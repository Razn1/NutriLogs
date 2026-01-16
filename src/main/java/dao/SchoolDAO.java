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

    public void insert(School school) throws SQLException {
        String sql = "INSERT INTO schools (id, nama, alamat, jumlah_siswa) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, school.getId());
            pstmt.setString(2, school.getNama());
            pstmt.setString(3, school.getAlamat());
            pstmt.setInt(4, school.getJumlahSiswa());
            pstmt.executeUpdate();
        }
    }

    public void update(School school) throws SQLException {
        String sql = "UPDATE schools SET nama = ?, alamat = ?, jumlah_siswa = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, school.getNama());
            pstmt.setString(2, school.getAlamat());
            pstmt.setInt(3, school.getJumlahSiswa());
            pstmt.setString(4, school.getId());
            pstmt.executeUpdate();
        }
    }

    public void delete(String id) throws SQLException {
        String sql = "DELETE FROM schools WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);
            pstmt.executeUpdate();
        }
    }
}
