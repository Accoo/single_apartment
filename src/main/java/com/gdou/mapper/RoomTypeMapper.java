package com.gdou.mapper;

import com.gdou.model.RoomType;

public interface RoomTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RoomType record);

    RoomType selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(RoomType record);
}