package com.hunilee.bean;

import java.io.Serializable;

/**
 * 设备信息
 * @author hunilee
 * @date 19-3-21
 */
public class User implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// ID编号
    private int user_id;
    // 用户姓名
    private String device;
    // 密码
    private String mac;
    // 联系电话
    private String telephone;
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getDevice() {
		return device;
	}
	public void setDevice(String device) {
		this.device = device;
	}
	public String getMac() {
		return mac;
	}
	public void setMac(String mac) {
		this.mac = mac;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

   


}
