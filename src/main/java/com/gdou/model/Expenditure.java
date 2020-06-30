package com.gdou.model;

import java.util.Date;

public class Expenditure {
    private Integer expId;

    private String expNum;

    private Room room = new Room();

    private String expendType;

    private String expendContent;

    private Float materialCharge;

    private Float employeeCharge;

    private Float totalCharge;

    private Date payDate;

    private String operator;

    private Date expendStart;

    private Date expendEnd;

    public Date getExpendStart() {
        return expendStart;
    }

    public void setExpendStart(Date expendStart) {
        this.expendStart = expendStart;
    }

    public Date getExpendEnd() {
        return expendEnd;
    }

    public void setExpendEnd(Date expendEnd) {
        this.expendEnd = expendEnd;
    }

    public Integer getExpId() {
        return expId;
    }

    public void setExpId(Integer expId) {
        this.expId = expId;
    }

    public String getExpNum() {
        return expNum;
    }

    public void setExpNum(String expNum) {
        this.expNum = expNum;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public String getExpendType() {
        return expendType;
    }

    public void setExpendType(String expendType) {
        this.expendType = expendType == null ? null : expendType.trim();
    }

    public String getExpendContent() {
        return expendContent;
    }

    public void setExpendContent(String expendContent) {
        this.expendContent = expendContent == null ? null : expendContent.trim();
    }

    public Float getMaterialCharge() {
        return materialCharge;
    }

    public void setMaterialCharge(Float materialCharge) {
        this.materialCharge = materialCharge;
    }

    public Float getEmployeeCharge() {
        return employeeCharge;
    }

    public void setEmployeeCharge(Float employeeCharge) {
        this.employeeCharge = employeeCharge;
    }

    public Float getTotalCharge() {
        return totalCharge;
    }

    public void setTotalCharge(Float totalCharge) {
        this.totalCharge = totalCharge;
    }

    public Date getPayDate() {
        return payDate;
    }

    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }
}