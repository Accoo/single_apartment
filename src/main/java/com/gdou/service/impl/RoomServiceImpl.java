package com.gdou.service.impl;

import com.gdou.mapper.RoomMapper;
import com.gdou.model.Room;
import com.gdou.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomServiceImpl implements RoomService {

    @Autowired
    private RoomMapper roomMapper;

    @Override
    public Boolean insertRoom(Room room){
        if (roomMapper.insert(room)){
            return true;
        }
        return false;
    }

    @Override
    public Room selectByNum(String number){
        return roomMapper.selectByNum(number);
    }

    @Override
    public List<Room> search(Room room){
        return roomMapper.search(room);
    }
    @Override
    public Boolean updateRoom(Room room){
        if(roomMapper.updateByPrimaryKey(room)){
            return true;
        }
        return false;
    }

    @Override
    public Boolean deleteByRoomNum(String roomNumber){
        if(roomMapper.deleteByPrimaryKey(roomNumber)){
            return true;
        }
        return false;
    }
}
