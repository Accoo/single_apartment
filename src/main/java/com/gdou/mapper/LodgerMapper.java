package com.gdou.mapper;

import com.gdou.model.Lodger;

public interface LodgerMapper {

    int deleteByPrimaryKey(Integer id);

    Boolean insert(Lodger record);

    Lodger selectByRoomerId(String roomId);

    Lodger selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(Lodger record);
}