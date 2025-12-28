package model;

public class Kitchen {
    private int id;
    private String nama;
    private String alamat;
    private int kapasitas;
    private int jumlahKaryawan;

    public Kitchen() {
    }

    public Kitchen(int id, String nama, String alamat, int kapasitas, int jumlahKaryawan) {
        this.id = id;
        this.nama = nama;
        this.alamat = alamat;
        this.kapasitas = kapasitas;
        this.jumlahKaryawan = jumlahKaryawan;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public int getKapasitas() {
        return kapasitas;
    }

    public void setKapasitas(int kapasitas) {
        this.kapasitas = kapasitas;
    }

    public int getJumlahKaryawan() {
        return jumlahKaryawan;
    }

    public void setJumlahKaryawan(int jumlahKaryawan) {
        this.jumlahKaryawan = jumlahKaryawan;
    }
}
