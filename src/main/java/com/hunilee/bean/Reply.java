package com.hunilee.bean;

import java.io.Serializable;

/**
 * @author hunilee
 * @date 19-3-21
 */
public class Reply implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//回复信息编号
    private int re_id;
    //回复名
    private String re_name;
    //回复时间
    private String re_date;
    //回复内容
    private String re_content;
    //给谁回复
    private String re_for_name;
    //哪条留下的回复言
    private String re_for_words;
    //给哪条回复信息回复的
    private String re_for_reply;
    
    private String pic1;

    private String pic2;

    private String pic3;

    private String pic4;

    private String pic5;

    private String pic6;

    private String pic7;

    private String pic8;

    private String pic9;
    
    //回复信息编号
    private int lr_id;
    //回复人
    private String lr_name;
    //回复时间
    private String lr_date;
    //回复内容
    private String lr_content;
    //给谁回复
    private String lr_for_name;
    //哪条留下的回复言
    private String lr_for_words;
    //给哪条回复信息回复的
    private String lr_for_reply;
    //在哪篇文章下的回复
    private String lr_for_article_id;
	public int getRe_id() {
		return re_id;
	}
	public void setRe_id(int re_id) {
		this.re_id = re_id;
	}
	public String getRe_name() {
		return re_name;
	}
	public void setRe_name(String re_name) {
		this.re_name = re_name;
	}
	public String getRe_date() {
		return re_date;
	}
	public void setRe_date(String re_date) {
		this.re_date = re_date;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public String getRe_for_name() {
		return re_for_name;
	}
	public void setRe_for_name(String re_for_name) {
		this.re_for_name = re_for_name;
	}
	public String getRe_for_words() {
		return re_for_words;
	}
	public void setRe_for_words(String re_for_words) {
		this.re_for_words = re_for_words;
	}
	public String getRe_for_reply() {
		return re_for_reply;
	}
	public void setRe_for_reply(String re_for_reply) {
		this.re_for_reply = re_for_reply;
	}
	public int getLr_id() {
		return lr_id;
	}
	public void setLr_id(int lr_id) {
		this.lr_id = lr_id;
	}
	public String getLr_name() {
		return lr_name;
	}
	public void setLr_name(String lr_name) {
		this.lr_name = lr_name;
	}
	public String getLr_date() {
		return lr_date;
	}
	public void setLr_date(String lr_date) {
		this.lr_date = lr_date;
	}
	public String getLr_content() {
		return lr_content;
	}
	public void setLr_content(String lr_content) {
		this.lr_content = lr_content;
	}
	public String getLr_for_name() {
		return lr_for_name;
	}
	public void setLr_for_name(String lr_for_name) {
		this.lr_for_name = lr_for_name;
	}
	public String getLr_for_words() {
		return lr_for_words;
	}
	public void setLr_for_words(String lr_for_words) {
		this.lr_for_words = lr_for_words;
	}
	public String getLr_for_reply() {
		return lr_for_reply;
	}
	public void setLr_for_reply(String lr_for_reply) {
		this.lr_for_reply = lr_for_reply;
	}
	public String getLr_for_article_id() {
		return lr_for_article_id;
	}
	public void setLr_for_article_id(String lr_for_article_id) {
		this.lr_for_article_id = lr_for_article_id;
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
