package com.gdou.mapper;

import com.gdou.model.Role;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer roleId);

    int insert(Role record);

    Role selectByPrimaryKey(Integer roleId);

    int updateByPrimaryKey(Role record);
}