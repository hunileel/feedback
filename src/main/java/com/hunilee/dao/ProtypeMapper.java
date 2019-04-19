package com.hunilee.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.hunilee.bean.Protype;

public interface ProtypeMapper {
	int selectCount();

    List<Protype> findByPage(HashMap<String, Object> map);

    List<Protype> findConByPage(Map<String, Object> conMap);
    
    int deleteByPrimaryKey(Integer nId);

    int insert(Protype record);

    int insertSelective(Protype record);

    Protype selectByPrimaryKey(Integer nId);

    int updateByPrimaryKeySelective(Protype record);

    int updateByPrimaryKey(Protype record);
    
    List<Protype> allProype();
    
    List<Protype> findAllPage(HashMap<String, Object> map);
 
    int count();
}