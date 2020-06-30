package com.gdou.service;

import com.gdou.model.RoomCheckin;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CheckInService {
    Boolean insertCheckin(RoomCheckin checkin);
    RoomCheckin selectByRoomNum(String roomNumber);
    Boolean update(RoomCheckin checkin);
    RoomCheckin selectById(int checkinId);
    List<RoomCheckin> selectAllEffective();
    List<RoomCheckin> selectAllAppoint();
}
