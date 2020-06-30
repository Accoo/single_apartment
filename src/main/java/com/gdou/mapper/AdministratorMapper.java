package com.gdou.mapper;

import com.gdou.model.Administrator;

import java.util.List;

public interface AdministratorMapper {

    Boolean deleteByPrimaryKey(Integer id);

    Boolean insert(Administrator record);

    List<Administrator> selectall();

    Administrator selectByAccount(String account);

    Administrator selectByPrimaryKey(Integer id);

    Boolean updateByPrimaryKey(Administrator record);

    List<Administrator> search(Administrator administrator);
}