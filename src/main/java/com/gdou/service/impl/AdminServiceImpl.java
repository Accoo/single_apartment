package com.gdou.service.impl;

import com.gdou.mapper.AdministratorMapper;
import com.gdou.model.Administrator;
import com.gdou.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdministratorMapper administratorMapper;

    @Override
    public Administrator selectByAccount(String account){
        Administrator administrator = administratorMapper.selectByAccount(account);
        return administrator;
    }

    @Override
    public Boolean register(Administrator administrator){
        if(administratorMapper.insert(administrator)){
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<Administrator> selectall(){
        return administratorMapper.selectall();
    }

    @Override
    public Boolean updateAdmin(Administrator administrator){
        if(administratorMapper.updateByPrimaryKey(administrator)){
            return true;
        }
        return false;
    }

    @Override
    public Boolean deleteById(int id){
        if(administratorMapper.deleteByPrimaryKey(id)){
            return true;
        }
        return false;
    }

    @Override
    public List<Administrator> search(Administrator administrator){
        return administratorMapper.search(administrator);
    }
}
