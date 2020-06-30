package com.gdou.mapper;

import com.gdou.model.RoomLease;

public interface RoomLeaseMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(RoomLease record);

    RoomLease selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(RoomLease record);
}