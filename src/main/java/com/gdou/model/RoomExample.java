package com.gdou.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RoomExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public RoomExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("Id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("Id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("Id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("Id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("Id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("Id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("Id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("Id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("Id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("Id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("Id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("Id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andRoomNumberIsNull() {
            addCriterion("Room_Number is null");
            return (Criteria) this;
        }

        public Criteria andRoomNumberIsNotNull() {
            addCriterion("Room_Number is not null");
            return (Criteria) this;
        }

        public Criteria andRoomNumberEqualTo(String value) {
            addCriterion("Room_Number =", value, "roomNumber");
            return (Criteria) this;
        }

        public Criteria andRoomNumberNotEqualTo(String value) {
            addCriterion("Room_Number <>", value, "roomNumber");
            return (Criteria) this;
        }

        public Criteria andRoomNumberGreaterThan(String value) {
            addCriterion("Room_Number >", value, "roomNumber");
            return (Criteria) this;
        }

        public Criteria andRoomNumberGreaterThanOrEqualTo(String value) {
            addCriterion("Room_Number >=", value, "roomNumber");
            return (Criteria) this;
        }

        public Criteria andRoomNumberLessThan(String value) {
            addCriterion("Room_Number <", value, "roomNumber");
            return (Criteria) this;
        }

        public Criteria andRoomNumberLessThanOrEqualTo(String value) {
            addCriterion("Room_Number <=", value, "roomNumber");
            return (Criteria) this;
        }

        public Criteria andRoomNumberLike(String value) {
            addCriterion("Room_Number like", value, "roomNumber");
            return (Criteria) this;
        }

        public Criteria andRoomNumberNotLike(String value) {
            addCriterion("Room_Number not like", value, "roomNumber");
            return (Criteria) this;
        }

        public Criteria andRoomNumberIn(List<String> values) {
            addCriterion("Room_Number in", values, "roomNumber");
            return (Criteria) this;
        }

        public Criteria andRoomNumberNotIn(List<String> values) {
            addCriterion("Room_Number not in", values, "roomNumber");
            return (Criteria) this;
        }

        public Criteria andRoomNumberBetween(String value1, String value2) {
            addCriterion("Room_Number between", value1, value2, "roomNumber");
            return (Criteria) this;
        }

        public Criteria andRoomNumberNotBetween(String value1, String value2) {
            addCriterion("Room_Number not between", value1, value2, "roomNumber");
            return (Criteria) this;
        }

        public Criteria andRoomTypeIsNull() {
            addCriterion("Room_Type is null");
            return (Criteria) this;
        }

        public Criteria andRoomTypeIsNotNull() {
            addCriterion("Room_Type is not null");
            return (Criteria) this;
        }

        public Criteria andRoomTypeEqualTo(Integer value) {
            addCriterion("Room_Type =", value, "roomType");
            return (Criteria) this;
        }

        public Criteria andRoomTypeNotEqualTo(Integer value) {
            addCriterion("Room_Type <>", value, "roomType");
            return (Criteria) this;
        }

        public Criteria andRoomTypeGreaterThan(Integer value) {
            addCriterion("Room_Type >", value, "roomType");
            return (Criteria) this;
        }

        public Criteria andRoomTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("Room_Type >=", value, "roomType");
            return (Criteria) this;
        }

        public Criteria andRoomTypeLessThan(Integer value) {
            addCriterion("Room_Type <", value, "roomType");
            return (Criteria) this;
        }

        public Criteria andRoomTypeLessThanOrEqualTo(Integer value) {
            addCriterion("Room_Type <=", value, "roomType");
            return (Criteria) this;
        }

        public Criteria andRoomTypeIn(List<Integer> values) {
            addCriterion("Room_Type in", values, "roomType");
            return (Criteria) this;
        }

        public Criteria andRoomTypeNotIn(List<Integer> values) {
            addCriterion("Room_Type not in", values, "roomType");
            return (Criteria) this;
        }

        public Criteria andRoomTypeBetween(Integer value1, Integer value2) {
            addCriterion("Room_Type between", value1, value2, "roomType");
            return (Criteria) this;
        }

        public Criteria andRoomTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("Room_Type not between", value1, value2, "roomType");
            return (Criteria) this;
        }

        public Criteria andRoomStatusIsNull() {
            addCriterion("Room_Status is null");
            return (Criteria) this;
        }

        public Criteria andRoomStatusIsNotNull() {
            addCriterion("Room_Status is not null");
            return (Criteria) this;
        }

        public Criteria andRoomStatusEqualTo(Integer value) {
            addCriterion("Room_Status =", value, "roomStatus");
            return (Criteria) this;
        }

        public Criteria andRoomStatusNotEqualTo(Integer value) {
            addCriterion("Room_Status <>", value, "roomStatus");
            return (Criteria) this;
        }

        public Criteria andRoomStatusGreaterThan(Integer value) {
            addCriterion("Room_Status >", value, "roomStatus");
            return (Criteria) this;
        }

        public Criteria andRoomStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("Room_Status >=", value, "roomStatus");
            return (Criteria) this;
        }

        public Criteria andRoomStatusLessThan(Integer value) {
            addCriterion("Room_Status <", value, "roomStatus");
            return (Criteria) this;
        }

        public Criteria andRoomStatusLessThanOrEqualTo(Integer value) {
            addCriterion("Room_Status <=", value, "roomStatus");
            return (Criteria) this;
        }

        public Criteria andRoomStatusIn(List<Integer> values) {
            addCriterion("Room_Status in", values, "roomStatus");
            return (Criteria) this;
        }

        public Criteria andRoomStatusNotIn(List<Integer> values) {
            addCriterion("Room_Status not in", values, "roomStatus");
            return (Criteria) this;
        }

        public Criteria andRoomStatusBetween(Integer value1, Integer value2) {
            addCriterion("Room_Status between", value1, value2, "roomStatus");
            return (Criteria) this;
        }

        public Criteria andRoomStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("Room_Status not between", value1, value2, "roomStatus");
            return (Criteria) this;
        }

        public Criteria andRoomLocationIsNull() {
            addCriterion("Room_Location is null");
            return (Criteria) this;
        }

        public Criteria andRoomLocationIsNotNull() {
            addCriterion("Room_Location is not null");
            return (Criteria) this;
        }

        public Criteria andRoomLocationEqualTo(String value) {
            addCriterion("Room_Location =", value, "roomLocation");
            return (Criteria) this;
        }

        public Criteria andRoomLocationNotEqualTo(String value) {
            addCriterion("Room_Location <>", value, "roomLocation");
            return (Criteria) this;
        }

        public Criteria andRoomLocationGreaterThan(String value) {
            addCriterion("Room_Location >", value, "roomLocation");
            return (Criteria) this;
        }

        public Criteria andRoomLocationGreaterThanOrEqualTo(String value) {
            addCriterion("Room_Location >=", value, "roomLocation");
            return (Criteria) this;
        }

        public Criteria andRoomLocationLessThan(String value) {
            addCriterion("Room_Location <", value, "roomLocation");
            return (Criteria) this;
        }

        public Criteria andRoomLocationLessThanOrEqualTo(String value) {
            addCriterion("Room_Location <=", value, "roomLocation");
            return (Criteria) this;
        }

        public Criteria andRoomLocationLike(String value) {
            addCriterion("Room_Location like", value, "roomLocation");
            return (Criteria) this;
        }

        public Criteria andRoomLocationNotLike(String value) {
            addCriterion("Room_Location not like", value, "roomLocation");
            return (Criteria) this;
        }

        public Criteria andRoomLocationIn(List<String> values) {
            addCriterion("Room_Location in", values, "roomLocation");
            return (Criteria) this;
        }

        public Criteria andRoomLocationNotIn(List<String> values) {
            addCriterion("Room_Location not in", values, "roomLocation");
            return (Criteria) this;
        }

        public Criteria andRoomLocationBetween(String value1, String value2) {
            addCriterion("Room_Location between", value1, value2, "roomLocation");
            return (Criteria) this;
        }

        public Criteria andRoomLocationNotBetween(String value1, String value2) {
            addCriterion("Room_Location not between", value1, value2, "roomLocation");
            return (Criteria) this;
        }

        public Criteria andRoomFloorIsNull() {
            addCriterion("Room_Floor is null");
            return (Criteria) this;
        }

        public Criteria andRoomFloorIsNotNull() {
            addCriterion("Room_Floor is not null");
            return (Criteria) this;
        }

        public Criteria andRoomFloorEqualTo(String value) {
            addCriterion("Room_Floor =", value, "roomFloor");
            return (Criteria) this;
        }

        public Criteria andRoomFloorNotEqualTo(String value) {
            addCriterion("Room_Floor <>", value, "roomFloor");
            return (Criteria) this;
        }

        public Criteria andRoomFloorGreaterThan(String value) {
            addCriterion("Room_Floor >", value, "roomFloor");
            return (Criteria) this;
        }

        public Criteria andRoomFloorGreaterThanOrEqualTo(String value) {
            addCriterion("Room_Floor >=", value, "roomFloor");
            return (Criteria) this;
        }

        public Criteria andRoomFloorLessThan(String value) {
            addCriterion("Room_Floor <", value, "roomFloor");
            return (Criteria) this;
        }

        public Criteria andRoomFloorLessThanOrEqualTo(String value) {
            addCriterion("Room_Floor <=", value, "roomFloor");
            return (Criteria) this;
        }

        public Criteria andRoomFloorLike(String value) {
            addCriterion("Room_Floor like", value, "roomFloor");
            return (Criteria) this;
        }

        public Criteria andRoomFloorNotLike(String value) {
            addCriterion("Room_Floor not like", value, "roomFloor");
            return (Criteria) this;
        }

        public Criteria andRoomFloorIn(List<String> values) {
            addCriterion("Room_Floor in", values, "roomFloor");
            return (Criteria) this;
        }

        public Criteria andRoomFloorNotIn(List<String> values) {
            addCriterion("Room_Floor not in", values, "roomFloor");
            return (Criteria) this;
        }

        public Criteria andRoomFloorBetween(String value1, String value2) {
            addCriterion("Room_Floor between", value1, value2, "roomFloor");
            return (Criteria) this;
        }

        public Criteria andRoomFloorNotBetween(String value1, String value2) {
            addCriterion("Room_Floor not between", value1, value2, "roomFloor");
            return (Criteria) this;
        }

        public Criteria andWaterStartIsNull() {
            addCriterion("Water_Start is null");
            return (Criteria) this;
        }

        public Criteria andWaterStartIsNotNull() {
            addCriterion("Water_Start is not null");
            return (Criteria) this;
        }

        public Criteria andWaterStartEqualTo(Float value) {
            addCriterion("Water_Start =", value, "waterStart");
            return (Criteria) this;
        }

        public Criteria andWaterStartNotEqualTo(Float value) {
            addCriterion("Water_Start <>", value, "waterStart");
            return (Criteria) this;
        }

        public Criteria andWaterStartGreaterThan(Float value) {
            addCriterion("Water_Start >", value, "waterStart");
            return (Criteria) this;
        }

        public Criteria andWaterStartGreaterThanOrEqualTo(Float value) {
            addCriterion("Water_Start >=", value, "waterStart");
            return (Criteria) this;
        }

        public Criteria andWaterStartLessThan(Float value) {
            addCriterion("Water_Start <", value, "waterStart");
            return (Criteria) this;
        }

        public Criteria andWaterStartLessThanOrEqualTo(Float value) {
            addCriterion("Water_Start <=", value, "waterStart");
            return (Criteria) this;
        }

        public Criteria andWaterStartIn(List<Float> values) {
            addCriterion("Water_Start in", values, "waterStart");
            return (Criteria) this;
        }

        public Criteria andWaterStartNotIn(List<Float> values) {
            addCriterion("Water_Start not in", values, "waterStart");
            return (Criteria) this;
        }

        public Criteria andWaterStartBetween(Float value1, Float value2) {
            addCriterion("Water_Start between", value1, value2, "waterStart");
            return (Criteria) this;
        }

        public Criteria andWaterStartNotBetween(Float value1, Float value2) {
            addCriterion("Water_Start not between", value1, value2, "waterStart");
            return (Criteria) this;
        }

        public Criteria andElectricStartIsNull() {
            addCriterion("Electric_Start is null");
            return (Criteria) this;
        }

        public Criteria andElectricStartIsNotNull() {
            addCriterion("Electric_Start is not null");
            return (Criteria) this;
        }

        public Criteria andElectricStartEqualTo(Float value) {
            addCriterion("Electric_Start =", value, "electricStart");
            return (Criteria) this;
        }

        public Criteria andElectricStartNotEqualTo(Float value) {
            addCriterion("Electric_Start <>", value, "electricStart");
            return (Criteria) this;
        }

        public Criteria andElectricStartGreaterThan(Float value) {
            addCriterion("Electric_Start >", value, "electricStart");
            return (Criteria) this;
        }

        public Criteria andElectricStartGreaterThanOrEqualTo(Float value) {
            addCriterion("Electric_Start >=", value, "electricStart");
            return (Criteria) this;
        }

        public Criteria andElectricStartLessThan(Float value) {
            addCriterion("Electric_Start <", value, "electricStart");
            return (Criteria) this;
        }

        public Criteria andElectricStartLessThanOrEqualTo(Float value) {
            addCriterion("Electric_Start <=", value, "electricStart");
            return (Criteria) this;
        }

        public Criteria andElectricStartIn(List<Float> values) {
            addCriterion("Electric_Start in", values, "electricStart");
            return (Criteria) this;
        }

        public Criteria andElectricStartNotIn(List<Float> values) {
            addCriterion("Electric_Start not in", values, "electricStart");
            return (Criteria) this;
        }

        public Criteria andElectricStartBetween(Float value1, Float value2) {
            addCriterion("Electric_Start between", value1, value2, "electricStart");
            return (Criteria) this;
        }

        public Criteria andElectricStartNotBetween(Float value1, Float value2) {
            addCriterion("Electric_Start not between", value1, value2, "electricStart");
            return (Criteria) this;
        }

        public Criteria andRegistrantIsNull() {
            addCriterion("Registrant is null");
            return (Criteria) this;
        }

        public Criteria andRegistrantIsNotNull() {
            addCriterion("Registrant is not null");
            return (Criteria) this;
        }

        public Criteria andRegistrantEqualTo(String value) {
            addCriterion("Registrant =", value, "registrant");
            return (Criteria) this;
        }

        public Criteria andRegistrantNotEqualTo(String value) {
            addCriterion("Registrant <>", value, "registrant");
            return (Criteria) this;
        }

        public Criteria andRegistrantGreaterThan(String value) {
            addCriterion("Registrant >", value, "registrant");
            return (Criteria) this;
        }

        public Criteria andRegistrantGreaterThanOrEqualTo(String value) {
            addCriterion("Registrant >=", value, "registrant");
            return (Criteria) this;
        }

        public Criteria andRegistrantLessThan(String value) {
            addCriterion("Registrant <", value, "registrant");
            return (Criteria) this;
        }

        public Criteria andRegistrantLessThanOrEqualTo(String value) {
            addCriterion("Registrant <=", value, "registrant");
            return (Criteria) this;
        }

        public Criteria andRegistrantLike(String value) {
            addCriterion("Registrant like", value, "registrant");
            return (Criteria) this;
        }

        public Criteria andRegistrantNotLike(String value) {
            addCriterion("Registrant not like", value, "registrant");
            return (Criteria) this;
        }

        public Criteria andRegistrantIn(List<String> values) {
            addCriterion("Registrant in", values, "registrant");
            return (Criteria) this;
        }

        public Criteria andRegistrantNotIn(List<String> values) {
            addCriterion("Registrant not in", values, "registrant");
            return (Criteria) this;
        }

        public Criteria andRegistrantBetween(String value1, String value2) {
            addCriterion("Registrant between", value1, value2, "registrant");
            return (Criteria) this;
        }

        public Criteria andRegistrantNotBetween(String value1, String value2) {
            addCriterion("Registrant not between", value1, value2, "registrant");
            return (Criteria) this;
        }

        public Criteria andRegisterTimeIsNull() {
            addCriterion("Register_Time is null");
            return (Criteria) this;
        }

        public Criteria andRegisterTimeIsNotNull() {
            addCriterion("Register_Time is not null");
            return (Criteria) this;
        }

        public Criteria andRegisterTimeEqualTo(Date value) {
            addCriterion("Register_Time =", value, "registerTime");
            return (Criteria) this;
        }

        public Criteria andRegisterTimeNotEqualTo(Date value) {
            addCriterion("Register_Time <>", value, "registerTime");
            return (Criteria) this;
        }

        public Criteria andRegisterTimeGreaterThan(Date value) {
            addCriterion("Register_Time >", value, "registerTime");
            return (Criteria) this;
        }

        public Criteria andRegisterTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("Register_Time >=", value, "registerTime");
            return (Criteria) this;
        }

        public Criteria andRegisterTimeLessThan(Date value) {
            addCriterion("Register_Time <", value, "registerTime");
            return (Criteria) this;
        }

        public Criteria andRegisterTimeLessThanOrEqualTo(Date value) {
            addCriterion("Register_Time <=", value, "registerTime");
            return (Criteria) this;
        }

        public Criteria andRegisterTimeIn(List<Date> values) {
            addCriterion("Register_Time in", values, "registerTime");
            return (Criteria) this;
        }

        public Criteria andRegisterTimeNotIn(List<Date> values) {
            addCriterion("Register_Time not in", values, "registerTime");
            return (Criteria) this;
        }

        public Criteria andRegisterTimeBetween(Date value1, Date value2) {
            addCriterion("Register_Time between", value1, value2, "registerTime");
            return (Criteria) this;
        }

        public Criteria andRegisterTimeNotBetween(Date value1, Date value2) {
            addCriterion("Register_Time not between", value1, value2, "registerTime");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNull() {
            addCriterion("Remark is null");
            return (Criteria) this;
        }

        public Criteria andRemarkIsNotNull() {
            addCriterion("Remark is not null");
            return (Criteria) this;
        }

        public Criteria andRemarkEqualTo(String value) {
            addCriterion("Remark =", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotEqualTo(String value) {
            addCriterion("Remark <>", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThan(String value) {
            addCriterion("Remark >", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkGreaterThanOrEqualTo(String value) {
            addCriterion("Remark >=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThan(String value) {
            addCriterion("Remark <", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLessThanOrEqualTo(String value) {
            addCriterion("Remark <=", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkLike(String value) {
            addCriterion("Remark like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotLike(String value) {
            addCriterion("Remark not like", value, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkIn(List<String> values) {
            addCriterion("Remark in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotIn(List<String> values) {
            addCriterion("Remark not in", values, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkBetween(String value1, String value2) {
            addCriterion("Remark between", value1, value2, "remark");
            return (Criteria) this;
        }

        public Criteria andRemarkNotBetween(String value1, String value2) {
            addCriterion("Remark not between", value1, value2, "remark");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}