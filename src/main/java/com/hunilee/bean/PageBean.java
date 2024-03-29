package com.hunilee.bean;

import java.io.Serializable;
import java.util.List;

/**
 * @author hunilee
 * @date 18-4-28下午3:46
 */
public class PageBean<T> implements Serializable {

	private static final long serialVersionUID = 7150727572183884098L;

	//当前页
    private int pageCode;

    //总页数=总条数/每页显示的条数
    private int totalPage;

    //总记录数
    private int totalCount;

    //每页显示的记录条数
    private int pageSize;

    //每页显示的记录条数
    private List<T> beanList;

    public int getPageCode() {
        return pageCode;
    }

    public void setPageCode(int pageCode) {
        this.pageCode = pageCode;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public List<T> getBeanList() {
        return beanList;
    }

    public void setBeanList(List<T> beanList) {
        this.beanList = beanList;
    }
}
