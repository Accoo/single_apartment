package com.gdou.model;

import java.util.Date;

public class Room extends RoomKey {
    private RoomType roomType = new RoomType();

    private Integer roomStatus;

    private String roomLocation;

    private String roomFloor;

    private Float waterStart;

    private Float electricStart;

    private String registrant;

    private Date registerTime;

    private String remark;

    private byte[] roomImages;

    public RoomType getRoomType() {
        return roomType;
    }

    public void setRoomType(RoomType roomType) {
        this.roomType = roomType;
    }

    public Integer getRoomStatus() {
        return roomStatus;
    }

    public void setRoomStatus(Integer roomStatus) {
        this.roomStatus = roomStatus;
    }

    public String getRoomLocation() {
        return roomLocation;
    }

    public void setRoomLocation(String roomLocation) {
        this.roomLocation = roomLocation == null ? null : roomLocation.trim();
    }

    public String getRoomFloor() {
        return roomFloor;
    }

    public void setRoomFloor(String roomFloor) {
        this.roomFloor = roomFloor == null ? null : roomFloor.trim();
    }

    public Float getWaterStart() {
        return waterStart;
    }

    public void setWaterStart(Float waterStart) {
        this.waterStart = waterStart;
    }

    public Float getElectricStart() {
        return electricStart;
    }

    public void setElectricStart(Float electricStart) {
        this.electricStart = electricStart;
    }

    public String getRegistrant() {
        return registrant;
    }

    public void setRegistrant(String registrant) {
        this.registrant = registrant == null ? null : registrant.trim();
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public byte[] getRoomImages() {
        return roomImages;
    }

    public void setRoomImages(byte[] roomImages) {
        this.roomImages = roomImages;
    }
}