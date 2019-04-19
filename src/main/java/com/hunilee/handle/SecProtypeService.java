package com.hunilee.handle;

import java.util.List;
import java.util.Map;
import com.hunilee.bean.PageBean;
import com.hunilee.bean.Secprotype;

public interface SecProtypeService {
	PageBean<Secprotype> findByPage(int pageCode, int pageSize, Map<String, Object> conMap);
	
    int deleteByPrimaryKey(Integer nId);

    int insert(Secprotype record);

    int insertSelective(Secprotype record);

    Secprotype selectByPrimaryKey(Integer nId);

    int updateByPrimaryKeySelective(Secprotype record);

    int updateByPrimaryKey(Secprotype record);
    
    List<Secprotype> allSecProype();
    
    public List<Secprotype> findAllPage(Integer before,Integer after);      
    
    public int count();
    
    List<Secprotype> keynormal();
    
    List<Secprotype> selectBynId(Integer nId);
    
    void setHotpro(int scid);
}