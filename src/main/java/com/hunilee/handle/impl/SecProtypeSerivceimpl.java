package com.hunilee.handle.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hunilee.bean.PageBean;
import com.hunilee.bean.Secprotype;
import com.hunilee.dao.SecprotypeMapper;
import com.hunilee.handle.SecProtypeService;

@Service
public class SecProtypeSerivceimpl implements SecProtypeService {
	/**
	 * 注入service层
	 */
	@Autowired
	private SecprotypeMapper secprotypeMapper;

	

	@Override
	public PageBean<Secprotype> findByPage(int pageCode, int pageSize, Map<String, Object> conMap) {
		 HashMap<String,Object> map = new HashMap<String,Object>();
	        PageBean<Secprotype> pageBean = new PageBean<Secprotype>();

	        //封装数据
	        pageBean.setPageCode(pageCode);
	        pageBean.setPageSize(pageSize);

	        //封装总记录数
	        int totalCount = 0;
	            totalCount = secprotypeMapper.selectCount();
	        
	        pageBean.setTotalCount(totalCount);

	        //封装总页数
	        double tc = totalCount;
	        Double num = Math.ceil(tc / pageSize);
	        pageBean.setTotalPage(num.intValue());

	        //设置limit起始位置和终止位置
	        map.put("start",(pageCode - 1) * pageSize);
	        map.put("size",pageBean.getPageSize());

	        //封装每页显示的数据
	        List<Secprotype> list = secprotypeMapper.findByPage(map);
	        pageBean.setBeanList(list);

	        for(Object obj : list){
	            System.out.println(obj);
	        }

	        //条件查询的封装
	        conMap.put("start",(pageCode - 1) * pageSize);
	        conMap.put("size",pageBean.getPageSize());

	        List<Secprotype> conList = secprotypeMapper.findConByPage(conMap);
	        pageBean.setBeanList(conList);
	        return pageBean;
	}



	@Override
	public int deleteByPrimaryKey(Integer nId) {
		secprotypeMapper.deleteByPrimaryKey(nId);
		return 0;
	}



	@Override
	public int insert(Secprotype record) {
		secprotypeMapper.insert(record);
		return 0;
	}



	@Override
	public int insertSelective(Secprotype record) {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public Secprotype selectByPrimaryKey(Integer scId) {
		return secprotypeMapper.selectByPrimaryKey(scId);
	}



	@Override
	public int updateByPrimaryKeySelective(Secprotype record) {
		secprotypeMapper.updateByPrimaryKeySelective(record);
		return 0;
	}



	@Override
	public int updateByPrimaryKey(Secprotype record) {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public List<Secprotype> findAllPage(Integer before, Integer after) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public List<Secprotype> allSecProype() {
		return secprotypeMapper.allSecProype();
	}



	@Override
	public List<Secprotype> keynormal() {
		return secprotypeMapper.keynormal();
	}



	@Override
	public List<Secprotype> selectBynId(Integer nId) {
		
		return secprotypeMapper.selectBynId(nId);
	}



	@Override
	public void setHotpro(int scid) {
		System.out.println("开始标记");
		Secprotype sc= secprotypeMapper.selectByPrimaryKey(scid);
		if(sc.getHotPro().equals("0"))
		{
			System.out.println("标记问题");
			sc.setHotPro("1");
			secprotypeMapper.updateByPrimaryKeySelective(sc);
		}
		else {
			System.out.println("取消标记问题");
			sc.setHotPro("0");
			secprotypeMapper.updateByPrimaryKeySelective(sc);
		}
		
	}


}
