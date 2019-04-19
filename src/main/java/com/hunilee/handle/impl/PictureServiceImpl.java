package com.hunilee.handle.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hunilee.bean.Picture;
import com.hunilee.bean.User;
import com.hunilee.dao.PictureMapper;
import com.hunilee.dao.UserMapper;
import com.hunilee.handle.PictureService;

/**
 * @author hunilee
 * @date 19-3-21
 */
@Service
public class PictureServiceImpl implements PictureService {

    /**
     * 注入service层
     */
    @Autowired
    private UserMapper userMapper;
    
    @Autowired
    private PictureMapper pictureMapper;

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

	
	public int deleteByPrimaryKey(Integer id) {
		pictureMapper.deleteByPrimaryKey(id);
		return 0;
	}

	@Override
	public int insert(Picture record) {
		pictureMapper.insert(record);
		return 0;
	}

	@Override
	public int insertSelective(Picture record) {
		pictureMapper.insertSelective(record);
		return 0;
	}

	@Override
	public Picture selectByPrimaryKey(Integer id) {
		pictureMapper.selectByPrimaryKey(id);
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(Picture record) {
		pictureMapper.updateByPrimaryKeySelective(record);
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Picture record) {
		pictureMapper.updateByPrimaryKey(record);
		return 0;
	}
}
