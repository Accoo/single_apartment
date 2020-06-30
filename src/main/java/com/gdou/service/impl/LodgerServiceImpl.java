package com.gdou.service.impl;

import com.gdou.mapper.LodgerMapper;
import com.gdou.model.Lodger;
import com.gdou.service.LodgerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LodgerServiceImpl implements LodgerService {

    @Autowired
    private LodgerMapper lodgerMapper;

    @Override
    public Boolean insertLodger(Lodger roomer) {
        if (lodgerMapper.insert(roomer)){
            return true;
        }
        return false;
    }

    @Override
    public Lodger selectByRoomerId(String roomerId) {
        return lodgerMapper.selectByRoomerId(roomerId);
    }
}
