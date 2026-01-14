package dao;

import model.School;
import util.DBConnection; 
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SchoolDAO {

    public List<School> getAllSchools() {
        List<School> list = new ArrayList<>();
        String sql = "SELECT * FROM sekolah ORDER BY id DESC";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                School s = new School();
                s.setId(rs.getInt("id"));
                s.setNama(rs.getString("nama"));
                s.setAlamat(rs.getString("alamat"));
                s.setJumlahSiswa(rs.getInt("jumlah_siswa"));
                list.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // 2. Tambah Sekolah Baru
    public boolean addSchool(School s) {
        String sql = "INSERT INTO sekolah (nama, alamat, jumlah_siswa) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, s.getNama());
            ps.setString(2, s.getAlamat());
            ps.setInt(3, s.getJumlahSiswa());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 3. Update Data Sekolah
    public boolean updateSchool(School s) {
        String sql = "UPDATE sekolah SET nama=?, alamat=?, jumlah_siswa=? WHERE id=?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, s.getNama());
            ps.setString(2, s.getAlamat());
            ps.setInt(3, s.getJumlahSiswa());
            ps.setInt(4, s.getId());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 4. Hapus Sekolah
    public boolean deleteSchool(int id) {
        String sql = "DELETE FROM sekolah WHERE id=?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 5. Ambil Detail Sekolah Berdasarkan ID
    public School getSchoolById(int id) {
        String sql = "SELECT * FROM sekolah WHERE id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    School s = new School();
                    s.setId(rs.getInt("id"));
                    s.setNama(rs.getString("nama"));
                    s.setAlamat(rs.getString("alamat"));
                    s.setJumlahSiswa(rs.getInt("jumlah_siswa"));
                    return s;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
