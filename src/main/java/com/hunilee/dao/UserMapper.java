package com.hunilee.dao;

import com.hunilee.bean.User;

public interface UserMapper {

    User login(String device);

    void insert(User user);

    User findByName(String device);
    
}
