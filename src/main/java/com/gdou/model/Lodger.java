package com.gdou.model;

public class Lodger {
    private Integer id;

    private String roomerName;

    private String roomerSex;

    private String roomerPhoto;

    private String roomerId;

    private Integer roomerAge;

    private String mobilephone;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoomerName() {
        return roomerName;
    }

    public void setRoomerName(String roomerName) {
        this.roomerName = roomerName == null ? null : roomerName.trim();
    }

    public String getRoomerSex() {
        return roomerSex;
    }

    public void setRoomerSex(String roomerSex) {
        this.roomerSex = roomerSex == null ? null : roomerSex.trim();
    }

    public String getRoomerPhoto() {
        return roomerPhoto;
    }

    public void setRoomerPhoto(String roomerPhoto) {
        this.roomerPhoto = roomerPhoto == null ? null : roomerPhoto.trim();
    }

    public String getRoomerId() {
        return roomerId;
    }

    public void setRoomerId(String roomerId) {
        this.roomerId = roomerId == null ? null : roomerId.trim();
    }

    public Integer getRoomerAge() {
        return roomerAge;
    }

    public void setRoomerAge(Integer roomerAge) {
        this.roomerAge = roomerAge;
    }

    public String getMobilephone() {
        return mobilephone;
    }

    public void setMobilephone(String mobilephone) {
        this.mobilephone = mobilephone == null ? null : mobilephone.trim();
    }

}