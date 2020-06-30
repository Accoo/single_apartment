package com.gdou.service.impl;

import com.gdou.mapper.RoomCheckoutMapper;
import com.gdou.model.RoomCheckout;
import com.gdou.service.CheckOutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CheckOutServiceImpl implements CheckOutService {

    @Autowired
    private RoomCheckoutMapper roomCheckoutMapper;

    @Override
    public Boolean insert(RoomCheckout roomCheckout) {
        if (roomCheckoutMapper.insert(roomCheckout)){
            return true;
        }
        return false;
    }

    @Override
    public List<RoomCheckout> selectAll() {
        return roomCheckoutMapper.selectAll();
    }
}
