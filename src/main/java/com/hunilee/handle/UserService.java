package com.hunilee.handle;

import com.hunilee.bean.User;

public interface UserService {

    User login(String a_name);

    void insert(User user);

    User findByName(String a_name);
}
