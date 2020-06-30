package com.gdou.service;

import com.gdou.model.Expenditure;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ExpenditureService {
    Boolean insert(Expenditure expenditure);
    List<Expenditure> search(Expenditure expenditure);
    Expenditure selectByExpNum(String expNum);
}
