package model;

import java.sql.Timestamp;
import java.sql.Date;

public class Delivery {
    private int id;
    private Date tanggal;
    private int kitchenId;
    private int schoolId;
    private int vehicleId;
    private int accountIdPengirim;
    private Timestamp waktuKirim;
    private int jumlahKirim;
    private String statusPengiriman;
    private Timestamp waktuTerima;
    private int jumlahTerima;
    private String kualitasMakanan;
    private String catatanKualitas;
    private String fotoBuktiPath;

    // Auxiliary fields (join results)
    private String schoolName;
    private String kitchenName;
    private String vehicleName;

    public Delivery() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getTanggal() {
        return tanggal;
    }

    public void setTanggal(Date tanggal) {
        this.tanggal = tanggal;
    }

    public int getKitchenId() {
        return kitchenId;
    }

    public void setKitchenId(int kitchenId) {
        this.kitchenId = kitchenId;
    }

    public int getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(int schoolId) {
        this.schoolId = schoolId;
    }

    public int getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(int vehicleId) {
        this.vehicleId = vehicleId;
    }

    public int getAccountIdPengirim() {
        return accountIdPengirim;
    }

    public void setAccountIdPengirim(int accountIdPengirim) {
        this.accountIdPengirim = accountIdPengirim;
    }

    public Timestamp getWaktuKirim() {
        return waktuKirim;
    }

    public void setWaktuKirim(Timestamp waktuKirim) {
        this.waktuKirim = waktuKirim;
    }

    public int getJumlahKirim() {
        return jumlahKirim;
    }

    public void setJumlahKirim(int jumlahKirim) {
        this.jumlahKirim = jumlahKirim;
    }

    public String getStatusPengiriman() {
        return statusPengiriman;
    }

    public void setStatusPengiriman(String statusPengiriman) {
        this.statusPengiriman = statusPengiriman;
    }

    public Timestamp getWaktuTerima() {
        return waktuTerima;
    }

    public void setWaktuTerima(Timestamp waktuTerima) {
        this.waktuTerima = waktuTerima;
    }

    public int getJumlahTerima() {
        return jumlahTerima;
    }

    public void setJumlahTerima(int jumlahTerima) {
        this.jumlahTerima = jumlahTerima;
    }

    public String getKualitasMakanan() {
        return kualitasMakanan;
    }

    public void setKualitasMakanan(String kualitasMakanan) {
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

    public String getSchoolName() {
        return schoolName;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }

    public String getKitchenName() {
        return kitchenName;
    }

    public void setKitchenName(String kitchenName) {
        this.kitchenName = kitchenName;
    }

    public String getVehicleName() {
        return vehicleName;
    }

    public void setVehicleName(String vehicleName) {
        this.vehicleName = vehicleName;
    }
}
