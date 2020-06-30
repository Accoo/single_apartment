package com.gdou.model;

import java.util.Date;

public class RoomLease {
    private Integer leaseId;

    private String roomNum;

    private Integer hirer;

    private Date hireStart;

    private Date hireEnd;

    private String chargeType;

    private Date contractStart;

    private Date contractEnd;

    private Float hireMoney;

    private Float roomDeposit;

    private Float receivableCharge;

    private Float actualCharge;

    private Date chargeTime;

    private Integer register;

    private String remark;

    public Integer getLeaseId() {
        return leaseId;
    }

    public void setLeaseId(Integer leaseId) {
        this.leaseId = leaseId;
    }

    public String getRoomNum() {
        return roomNum;
    }

    public void setRoomNum(String roomNum) {
        this.roomNum = roomNum == null ? null : roomNum.trim();
    }

    public Integer getHirer() {
        return hirer;
    }

    public void setHirer(Integer hirer) {
        this.hirer = hirer;
    }

    public Date getHireStart() {
        return hireStart;
    }

    public void setHireStart(Date hireStart) {
        this.hireStart = hireStart;
    }

    public Date getHireEnd() {
        return hireEnd;
    }

    public void setHireEnd(Date hireEnd) {
        this.hireEnd = hireEnd;
    }

    public String getChargeType() {
        return chargeType;
    }

    public void setChargeType(String chargeType) {
        this.chargeType = chargeType == null ? null : chargeType.trim();
    }

    public Date getContractStart() {
        return contractStart;
    }

    public void setContractStart(Date contractStart) {
        this.contractStart = contractStart;
    }

    public Date getContractEnd() {
        return contractEnd;
    }

    public void setContractEnd(Date contractEnd) {
        this.contractEnd = contractEnd;
    }

    public Float getHireMoney() {
        return hireMoney;
    }

    public void setHireMoney(Float hireMoney) {
        this.hireMoney = hireMoney;
    }

    public Float getRoomDeposit() {
        return roomDeposit;
    }

    public void setRoomDeposit(Float roomDeposit) {
        this.roomDeposit = roomDeposit;
    }

    public Float getReceivableCharge() {
        return receivableCharge;
    }

    public void setReceivableCharge(Float receivableCharge) {
        this.receivableCharge = receivableCharge;
    }

    public Float getActualCharge() {
        return actualCharge;
    }

    public void setActualCharge(Float actualCharge) {
        this.actualCharge = actualCharge;
    }

    public Date getChargeTime() {
        return chargeTime;
    }

    public void setChargeTime(Date chargeTime) {
        this.chargeTime = chargeTime;
    }

    public Integer getRegister() {
        return register;
    }

    public void setRegister(Integer register) {
        this.register = register;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}