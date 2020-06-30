package com.gdou.mapper;

import com.gdou.model.Expenditure;

import java.util.List;

public interface ExpenditureMapper {

    int deleteByPrimaryKey(Integer id);

    Boolean insert(Expenditure record);

    Expenditure selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(Expenditure record);

    List<Expenditure> search(Expenditure expenditure);

    Expenditure selectByExpNum(String expNum);
}