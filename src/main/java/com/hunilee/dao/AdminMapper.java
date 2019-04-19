package com.hunilee.dao;

import com.hunilee.bean.Admin;

public interface AdminMapper {

    Admin login(String a_name);

    void insert(Admin admin);

    Admin findByName(String a_name);
}
