package model;

import model.enums.DeliveryStatus;
import model.enums.FoodQuality;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class Delivery {
    private String id;
    private LocalDate tanggal;
    private DeliveryStatus statusPengiriman;

    // Foreign Keys
    private String kitchenId;
    private String schoolId;
    private String vehicleId;

    // Sending Info
    private LocalDateTime waktuKirim;
    private int jumlahKirim;

    // Receiving Info
    private LocalDateTime waktuTerima;
    private Integer jumlahTerima; // Nullable
    private FoodQuality kualitasMakanan; // Nullable
    private String catatanKualitas; // Nullable
    private String fotoBuktiPath; // Nullable

    // Relations (for display)
    private Kitchen kitchen;
    private School school;
    private Vehicle vehicle;

    public Delivery() {
    }

    // Getters and Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public LocalDate getTanggal() {
        return tanggal;
    }

    public void setTanggal(LocalDate tanggal) {
        this.tanggal = tanggal;
    }

    public DeliveryStatus getStatusPengiriman() {
        return statusPengiriman;
    }

    public void setStatusPengiriman(DeliveryStatus statusPengiriman) {
        this.statusPengiriman = statusPengiriman;
    }

    public String getKitchenId() {
        return kitchenId;
    }

    public void setKitchenId(String kitchenId) {
        this.kitchenId = kitchenId;
    }

    public String getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(String schoolId) {
        this.schoolId = schoolId;
    }

    public String getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(String vehicleId) {
        this.vehicleId = vehicleId;
    }

    public LocalDateTime getWaktuKirim() {
        return waktuKirim;
    }

    public void setWaktuKirim(LocalDateTime waktuKirim) {
        this.waktuKirim = waktuKirim;
    }

    public int getJumlahKirim() {
        return jumlahKirim;
    }

    public void setJumlahKirim(int jumlahKirim) {
        this.jumlahKirim = jumlahKirim;
    }

    public LocalDateTime getWaktuTerima() {
        return waktuTerima;
    }

    public void setWaktuTerima(LocalDateTime waktuTerima) {
        this.waktuTerima = waktuTerima;
    }

    public Integer getJumlahTerima() {
        return jumlahTerima;
    }

    public void setJumlahTerima(Integer jumlahTerima) {
        this.jumlahTerima = jumlahTerima;
    }

    public FoodQuality getKualitasMakanan() {
        return kualitasMakanan;
    }

    public void setKualitasMakanan(FoodQuality kualitasMakanan) {
        this.kualitasMakanan = kualitasMakanan;
    }

    public String getCatatanKualitas() {
        return catatanKualitas;
    }

    public void setCatatanKualitas(String catatanKualitas) {
        this.catatanKualitas = catatanKualitas;
    }

    public String getFotoBuktiPath() {
        return fotoBuktiPath;
    }

    public void setFotoBuktiPath(String fotoBuktiPath) {
        this.fotoBuktiPath = fotoBuktiPath;
    }

    public Kitchen getKitchen() {
        return kitchen;
    }

    public void setKitchen(Kitchen kitchen) {
        this.kitchen = kitchen;
    }

    public School getSchool() {
        return school;
    }

    public void setSchool(School school) {
        this.school = school;
    }

    public Vehicle getVehicle() {
        return vehicle;
    }

    public void setVehicle(Vehicle vehicle) {
        this.vehicle = vehicle;
    }
}
