package com.hunilee.handle;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;
import com.hunilee.bean.PageBean;
import com.hunilee.bean.Protype;

public interface ProtypeService {
	PageBean<Protype> findByPage(int pageCode, int pageSize, Map<String, Object> conMap);
    
    int deleteByPrimaryKey(Integer nId);

    int insert(Protype record);

    int insertSelective(Protype record);

    Protype selectByPrimaryKey(Integer nId);

    int updateByPrimaryKeySelective(Protype record);

    int updateByPrimaryKey(Protype record);
    
    List<Protype> allProype();
    
    public List<Protype> findAllPage(Integer before,Integer after);      
    
    public int count();

	Map<String, Object> uploadImage(HttpServletRequest request ,MultipartFile file) throws Exception;
}