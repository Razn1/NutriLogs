package util;

import model.Delivery;
import model.enums.FoodQuality;
import model.enums.DeliveryStatus;

import java.time.LocalDateTime;
import java.time.LocalTime;

public class AuditUtils {

    public static class AuditFlags {
        public boolean isLate;
        public boolean isLateSend;
        public boolean hasQuantityMismatch;
        public boolean hasBadQuality;
        public boolean hasIssues;

        public AuditFlags(boolean isLate, boolean isLateSend, boolean hasQuantityMismatch, boolean hasBadQuality,
                boolean hasIssues) {
            this.isLate = isLate;
            this.isLateSend = isLateSend;
            this.hasQuantityMismatch = hasQuantityMismatch;
            this.hasBadQuality = hasBadQuality;
            this.hasIssues = hasIssues;
        }
    }

    public static AuditFlags getAuditFlags(Delivery delivery) {
        LocalDateTime sendTime = delivery.getWaktuKirim();
        LocalDateTime receiveTime = delivery.getWaktuTerima();

        // Late send: after 09:00
        boolean isLateSend = false;
        if (sendTime != null) {
            isLateSend = sendTime.toLocalTime().isAfter(LocalTime.of(9, 0));
        }

        // Late arrival: after 11:00
        boolean isLate = false;
        if (receiveTime != null) {
            isLate = receiveTime.toLocalTime().isAfter(LocalTime.of(11, 0));
        }

        // Quantity mismatch: received < sent
        boolean hasQuantityMismatch = false;
        if (delivery.getJumlahTerima() != null) {
            hasQuantityMismatch = delivery.getJumlahTerima() < delivery.getJumlahKirim();
        }

        // Bad quality
        boolean hasBadQuality = delivery.getKualitasMakanan() == FoodQuality.buruk;

        // Any issues
        boolean hasIssues = delivery.getStatusPengiriman() == DeliveryStatus.bermasalah;

        return new AuditFlags(isLate, isLateSend, hasQuantityMismatch, hasBadQuality, hasIssues);
    }
}
