package com.gdou.service;

import com.gdou.model.Administrator;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface AdminService {
    Administrator selectByAccount(String account);
    Boolean register(Administrator administrator);
    List<Administrator> selectall();
    Boolean updateAdmin(Administrator administrator);
    Boolean deleteById(int id);
    List<Administrator> search(Administrator administrator);
}
