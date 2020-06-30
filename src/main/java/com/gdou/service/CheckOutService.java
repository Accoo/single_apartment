package com.gdou.service;

import com.gdou.model.RoomCheckout;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CheckOutService {

    Boolean insert(RoomCheckout roomCheckout);
    List<RoomCheckout> selectAll();

}
