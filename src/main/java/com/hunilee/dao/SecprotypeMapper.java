package com.hunilee.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.hunilee.bean.Secprotype;

public interface SecprotypeMapper {
	
	int selectCount();

    List<Secprotype> findByPage(HashMap<String, Object> map);

    List<Secprotype> findConByPage(Map<String, Object> conMap);
    
    int deleteByPrimaryKey(Integer scId);

    int insert(Secprotype record);

    int insertSelective(Secprotype record);

    Secprotype selectByPrimaryKey(Integer scId);

    int updateByPrimaryKeySelective(Secprotype record);

    int updateByPrimaryKey(Secprotype record);

	List<Secprotype> allSecProype();
	
	List<Secprotype> keynormal();
	
	List<Secprotype> selectBynId(Integer nId);
}