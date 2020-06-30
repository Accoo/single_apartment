package com.gdou.model;

public class RoomType {
    private Integer typeid;

    private String roomTypename;

    private String roomArea;

    private Float roomDeposit;

    private Float roomRent;

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public String getRoomTypename() {
        return roomTypename;
    }

    public void setRoomTypename(String roomTypename) {
        this.roomTypename = roomTypename == null ? null : roomTypename.trim();
    }

    public String getRoomArea() {
        return roomArea;
    }

    public void setRoomArea(String roomArea) {
        this.roomArea = roomArea == null ? null : roomArea.trim();
    }

    public Float getRoomDeposit() {
        return roomDeposit;
    }

    public void setRoomDeposit(Float roomDeposit) {
        this.roomDeposit = roomDeposit;
    }

    public Float getRoomRent() {
        return roomRent;
    }

    public void setRoomRent(Float roomRent) {
        this.roomRent = roomRent;
    }
}