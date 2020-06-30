package com.gdou.service.impl;

import com.gdou.mapper.ExpenditureMapper;
import com.gdou.model.Expenditure;
import com.gdou.service.ExpenditureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExpenditureServiceImpl implements ExpenditureService {

    @Autowired
    private ExpenditureMapper expenditureMapper;

    @Override
    public Boolean insert(Expenditure expenditure) {
        return expenditureMapper.insert(expenditure);
    }

    @Override
    public List<Expenditure> search(Expenditure expenditure) {
        return expenditureMapper.search(expenditure);
    }

    @Override
    public Expenditure selectByExpNum(String expNum) {
        return expenditureMapper.selectByExpNum(expNum);
    }
}
