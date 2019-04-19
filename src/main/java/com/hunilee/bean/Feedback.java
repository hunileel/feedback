package com.hunilee.bean;

import java.io.Serializable;

/**
 * 留言信息
 * @author hunilee
 * @date 19-3-21
 */
public class Feedback implements Serializable {

	private static final long serialVersionUID = 1L;
	//编号
    private int fb_id;
    //留言用户id
    private int user_id;
    //留言名
    private String fb_name;
    //留言时间
    private String fb_date;
    //留言内容
    private String fb_content;
    //留言回复
    private String fb_for_reply;
    //标注留言
    private String fb_for_label;
    
    private String pic1;

    private String pic2;

    private String pic3;

    private String pic4;

    private String pic5;

    private String pic6;

    private String pic7;

    private String pic8;

    private String pic9;
    
	public int getFb_id() {
		return fb_id;
	}
	public void setFb_id(int fb_id) {
		this.fb_id = fb_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getFb_name() {
		return fb_name;
	}
	public void setFb_name(String fb_name) {
		this.fb_name = fb_name;
	}
	public String getFb_date() {
		return fb_date;
	}
	public void setFb_date(String fb_date) {
		this.fb_date = fb_date;
	}
	public String getFb_content() {
		return fb_content;
	}
	public void setFb_content(String fb_content) {
		this.fb_content = fb_content;
	}
	public String getFb_for_reply() {
		return fb_for_reply;
	}
	public void setFb_for_reply(String fb_for_reply) {
		this.fb_for_reply = fb_for_reply;
	}
	public String getFb_for_label() {
		return fb_for_label;
	}
	public void setFb_for_label(String fb_for_label) {
		this.fb_for_label = fb_for_label;
	}
	public String getPic1() {
		return pic1;
	}
	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}
	public String getPic2() {
		return pic2;
	}
	public void setPic2(String pic2) {
		this.pic2 = pic2;
	}
	public String getPic3() {
		return pic3;
	}
	public void setPic3(String pic3) {
		this.pic3 = pic3;
	}
	public String getPic4() {
		return pic4;
	}
	public void setPic4(String pic4) {
		this.pic4 = pic4;
	}
	public String getPic5() {
		return pic5;
	}
	public void setPic5(String pic5) {
		this.pic5 = pic5;
	}
	public String getPic6() {
		return pic6;
	}
	public void setPic6(String pic6) {
		this.pic6 = pic6;
	}
	public String getPic7() {
		return pic7;
	}
	public void setPic7(String pic7) {
		this.pic7 = pic7;
	}
	public String getPic8() {
		return pic8;
	}
	public void setPic8(String pic8) {
		this.pic8 = pic8;
	}
	public String getPic9() {
		return pic9;
	}
	public void setPic9(String pic9) {
		this.pic9 = pic9;
	}
	
}
