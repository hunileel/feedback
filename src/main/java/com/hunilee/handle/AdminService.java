package com.hunilee.handle;

import com.hunilee.bean.Admin;

public interface AdminService {

    Admin login(String a_name);

    void insert(Admin admin);

    Admin findByName(String a_name);
}
