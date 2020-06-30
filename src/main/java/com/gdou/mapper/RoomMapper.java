package com.gdou.mapper;

import com.gdou.model.Room;
import com.gdou.model.RoomExample;
import com.gdou.model.RoomKey;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoomMapper {

    Boolean deleteByPrimaryKey(String roomNumber);

    Boolean insert(Room record);

    Room selectByPrimaryKey(RoomKey key);

    Room selectByNum(String Number);

    Boolean updateByPrimaryKey(Room record);

    List<Room> search(Room room);
}