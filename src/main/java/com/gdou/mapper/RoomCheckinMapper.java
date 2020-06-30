package com.gdou.mapper;

import com.gdou.model.RoomCheckin;

import java.util.List;

public interface RoomCheckinMapper {

    int deleteByPrimaryKey(Integer checkinId);

    Boolean insert(RoomCheckin record);

    RoomCheckin selectByRoomNum(String roomNumber);

    RoomCheckin selectByPrimaryKey(Integer checkinId);

    List<RoomCheckin> selectAllEffective();

    Boolean updateByPrimaryKey(RoomCheckin record);

    List<RoomCheckin> selectAllAppoint();
}