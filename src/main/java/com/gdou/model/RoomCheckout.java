package com.gdou.model;

import java.util.Date;

public class RoomCheckout {
    private Integer checkId;

    private Room room = new Room();

    private Lodger lodger = new Lodger();

    private Float checkoutDeposit;

    private Float hireMoney;

    private Float waterMoney;

    private Float electricMoney;

    private Float checkoutMoey;

    private Date checkoutDate;

    private Date refundDate;

    private Integer operator;

    private String remark;

    public Integer getCheckId() {
        return checkId;
    }

    public void setCheckId(Integer checkId) {
        this.checkId = checkId;
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

    public Float getCheckoutDeposit() {
        return checkoutDeposit;
    }

    public void setCheckoutDeposit(Float checkoutDeposit) {
        this.checkoutDeposit = checkoutDeposit;
    }

    public Float getHireMoney() {
        return hireMoney;
    }

    public void setHireMoney(Float hireMoney) {
        this.hireMoney = hireMoney;
    }

    public Float getWaterMoney() {
        return waterMoney;
    }

    public void setWaterMoney(Float waterMoney) {
        this.waterMoney = waterMoney;
    }

    public Float getElectricMoney() {
        return electricMoney;
    }

    public void setElectricMoney(Float electricMoney) {
        this.electricMoney = electricMoney;
    }

    public Float getCheckoutMoey() {
        return checkoutMoey;
    }

    public void setCheckoutMoey(Float checkoutMoey) {
        this.checkoutMoey = checkoutMoey;
    }

    public Date getCheckoutDate() {
        return checkoutDate;
    }

    public void setCheckoutDate(Date checkoutDate) {
        this.checkoutDate = checkoutDate;
    }

    public Date getRefundDate() {
        return refundDate;
    }

    public void setRefundDate(Date refundDate) {
        this.refundDate = refundDate;
    }

    public Integer getOperator() {
        return operator;
    }

    public void setOperator(Integer operator) {
        this.operator = operator;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}