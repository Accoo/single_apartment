package com.gdou.service;

import com.gdou.model.Lodger;
import org.springframework.stereotype.Service;

@Service
public interface LodgerService {
    Boolean insertLodger(Lodger roomer);
    Lodger selectByRoomerId(String roomerId);
}
