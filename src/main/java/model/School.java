package model;

public class School {
    private int id;
    private String nama;
    private String alamat;
    private int jumlahSiswa;

    public School() {
    }

    public School(int id, String nama, String alamat, int jumlahSiswa) {
        this.id = id;
        this.nama = nama;
        this.alamat = alamat;
        this.jumlahSiswa = jumlahSiswa;
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

    public int getJumlahSiswa() {
        return jumlahSiswa;
    }

    public void setJumlahSiswa(int jumlahSiswa) {
        this.jumlahSiswa = jumlahSiswa;
    }
}
