package com.gdou.model;

import java.util.Date;

public class RoomCheckin {
    private Integer checkinId;

    private Room room = new Room();

    private Lodger lodger = new Lodger();

    private Integer paymentType;

    private Integer paymentStatus;

    private Integer checkinLength;

    private Date checkinTime;

    private String checkinRegisterant;

    private String checkinRemark;

    public Integer getCheckinId() {
        return checkinId;
    }

    public void setCheckinId(Integer checkinId) {
        this.checkinId = checkinId;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Lodger getLodger() {
        return lodger;
    }

    public void setLodger(Lodger lodger) {
        this.lodger = lodger;
    }

    public Integer getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(Integer paymentType) {
        this.paymentType = paymentType;
    }

    public Integer getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(Integer paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public Integer getCheckinLength() {
        return checkinLength;
    }

    public void setCheckinLength(Integer checkinLength) {
        this.checkinLength = checkinLength;
    }

    public Date getCheckinTime() {
        return checkinTime;
    }

    public void setCheckinTime(Date checkinTime) {
        this.checkinTime = checkinTime;
    }

    public String getCheckinRegisterant() {
        return checkinRegisterant;
    }

    public void setCheckinRegisterant(String checkinRegisterant) {
        this.checkinRegisterant = checkinRegisterant == null ? null : checkinRegisterant.trim();
    }

    public String getCheckinRemark() {
        return checkinRemark;
    }

    public void setCheckinRemark(String checkinRemark) {
        this.checkinRemark = checkinRemark == null ? null : checkinRemark.trim();
    }
}