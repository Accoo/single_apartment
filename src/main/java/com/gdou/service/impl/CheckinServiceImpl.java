package com.gdou.service.impl;

import com.gdou.mapper.RoomCheckinMapper;
import com.gdou.model.RoomCheckin;
import com.gdou.service.CheckInService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CheckinServiceImpl implements CheckInService {

    @Autowired
    private RoomCheckinMapper roomCheckinMapper;

    @Override
    public Boolean insertCheckin(RoomCheckin checkin) {
        if (roomCheckinMapper.insert(checkin)){
            return true;
        }
        return false;
    }

    @Override
    public RoomCheckin selectByRoomNum(String roomNumber) {
        return roomCheckinMapper.selectByRoomNum(roomNumber);
    }

    @Override
    public Boolean update(RoomCheckin checkin) {
        if (roomCheckinMapper.updateByPrimaryKey(checkin)){
            return true;
        }
        return false;
    }

    @Override
    public RoomCheckin selectById(int checkinId) {
        return roomCheckinMapper.selectByPrimaryKey(checkinId);
    }

    @Override
    public List<RoomCheckin> selectAllEffective() {
        return roomCheckinMapper.selectAllEffective();
    }

    @Override
    public List<RoomCheckin> selectAllAppoint() {
        return roomCheckinMapper.selectAllAppoint();
    }
}
