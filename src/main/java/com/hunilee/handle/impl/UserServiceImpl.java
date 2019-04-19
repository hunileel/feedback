package com.hunilee.handle.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hunilee.bean.User;
import com.hunilee.dao.UserMapper;
import com.hunilee.handle.UserService;

/**
 * @author hunilee
 * @date 19-3-21
 */
@Service
public class UserServiceImpl implements UserService {

    /**
     * 注入service层
     */
    @Autowired
    private UserMapper userMapper;

    /**
     * 登录的功能
     *
     * @param a_name 输入的用户名
     * @return 返回查询到的该用户名对应的密码
     */
    public User login(String a_name) {
        return userMapper.login(a_name);
    }

    /**
     * 注册功能
     *
     * @param admin 注册的信息
     * @return 返回影响的行数
     */
    public void insert(User user) {
        userMapper.insert(user);
    }

    /**
     * 根据用户名查询
     *
     * @param a_name 用户名
     * @return 返回影响的行数
     */
    public User findByName(String a_name) {
        return userMapper.findByName(a_name);
    }
}
