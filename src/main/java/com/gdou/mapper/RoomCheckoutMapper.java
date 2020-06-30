package com.gdou.mapper;

import com.gdou.model.RoomCheckout;

import java.util.List;

public interface RoomCheckoutMapper {

    int deleteByPrimaryKey(Integer id);

    Boolean insert(RoomCheckout record);

    RoomCheckout selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(RoomCheckout record);

    List<RoomCheckout> selectAll();
}