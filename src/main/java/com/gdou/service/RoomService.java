package com.gdou.service;

import com.gdou.model.Room;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RoomService {

    Boolean insertRoom(Room room);
    Room selectByNum(String Number);
    List<Room> search(Room room);
    Boolean updateRoom(Room room);
    Boolean deleteByRoomNum(String roomNumber);

}
