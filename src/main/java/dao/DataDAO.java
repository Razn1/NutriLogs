package dao;

import model.Kitchen;
import model.School;
import model.Vehicle;
import util.DBConnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DataDAO {
    public List<School> getAllSchools() {
        List<School> list = new ArrayList<>();
        String sql = "SELECT * FROM schools";
        try (Connection conn = DBConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                list.add(new School(
                        rs.getInt("id"),
                        rs.getString("nama"),
                        rs.getString("alamat"),
                        rs.getInt("jumlah_siswa")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Kitchen> getAllKitchens() {
        List<Kitchen> list = new ArrayList<>();
        String sql = "SELECT * FROM kitchens";
        try (Connection conn = DBConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                list.add(new Kitchen(
                        rs.getInt("id"),
                        rs.getString("nama"),
                        rs.getString("alamat"),
                        rs.getInt("kapasitas"),
                        rs.getInt("jumlah_karyawan")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Vehicle> getAllVehicles() {
        List<Vehicle> list = new ArrayList<>();
        String sql = "SELECT * FROM vehicles";
        try (Connection conn = DBConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                list.add(new Vehicle(
                        rs.getInt("id"),
                        rs.getString("nama_kendaraan"),
                        rs.getString("jenis_kendaraan"),
                        rs.getString("plat_nomor"),
                        rs.getInt("kapasitas")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
