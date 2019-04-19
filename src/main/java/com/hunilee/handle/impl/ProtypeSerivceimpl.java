package com.hunilee.handle.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hunilee.bean.PageBean;
import com.hunilee.bean.Picture;
import com.hunilee.bean.Protype;
import com.hunilee.dao.ProtypeMapper;
import com.hunilee.handle.PictureService;
import com.hunilee.handle.ProtypeService;

@Service
public class ProtypeSerivceimpl implements ProtypeService {
	/**
	 * 注入service层
	 */
	@Autowired
	private ProtypeMapper protypeMapper;
	
	 @Autowired
	private PictureService pictureService;

	@Override
	public int deleteByPrimaryKey(Integer nId) {
		
		return 0;
	}

	@Override
	public int insert(Protype record) {
		protypeMapper.insert(record);
		return 0;
	}

	@Override
	public int insertSelective(Protype record) {
		// TODO Auto-generated method stub
		return 0;
	}

	public Protype selectByPrimaryKey(Integer nId) {
		return protypeMapper.selectByPrimaryKey(nId);
	}

	@Override
	public int updateByPrimaryKeySelective(Protype record) {
		protypeMapper.updateByPrimaryKeySelective(record);
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Protype record) {
		protypeMapper.updateByPrimaryKey(record);
		return 0;
	}

	@Override
	public List<Protype> allProype() {
		
		return protypeMapper.allProype();
	}

	@Override
	public PageBean<Protype> findByPage(int pageCode, int pageSize, Map<String, Object> conMap) {
		 HashMap<String,Object> map = new HashMap<String,Object>();
	        PageBean<Protype> pageBean = new PageBean<Protype>();

	        //封装数据
	        pageBean.setPageCode(pageCode);
	        pageBean.setPageSize(pageSize);

	        //封装总记录数
	        int totalCount = 0;
	            totalCount = protypeMapper.selectCount();
	        
	        pageBean.setTotalCount(totalCount);

	        //封装总页数
	        double tc = totalCount;
	        Double num = Math.ceil(tc / pageSize);
	        pageBean.setTotalPage(num.intValue());

	        //设置limit起始位置和终止位置
	        map.put("start",(pageCode - 1) * pageSize);
	        map.put("size",pageBean.getPageSize());

	        //封装每页显示的数据
	        List<Protype> list = protypeMapper.findByPage(map);
	        pageBean.setBeanList(list);

	        for(Object obj : list){
	            System.out.println(obj);
	        }

	        //条件查询的封装
	        conMap.put("start",(pageCode - 1) * pageSize);
	        conMap.put("size",pageBean.getPageSize());

	        List<Protype> conList = protypeMapper.findConByPage(conMap);
	        pageBean.setBeanList(conList);
	        return pageBean;
	}
	
	/**
     * 查询数据
     */
    public List<Protype> findAllPage(Integer before,Integer after){
    	 HashMap<String,Object> map = new HashMap<String,Object>();
    	 
    	 map.put("before",before );
         map.put("after",after);
        return protypeMapper.findAllPage(map);
    }
    /**
     * 查询条数
     */
    public int count(){
        return protypeMapper.count();
    }

	public Map<String, Object> uploadImage(HttpServletRequest request ,MultipartFile file) throws Exception{
		Map<String, Object> res = new HashMap<>();
		Map<String, Object> data = new HashMap<>();
		Picture pic = new Picture();
		//使用UUID给图片重命名，并去掉四个“-”
    	String name = UUID.randomUUID().toString().replace("-", "");
    	//获取文件的扩展名
    	String ext = FilenameUtils.getExtension(file.getOriginalFilename());
    	//设置图片上传路径
    	//String filePath = "E:\\upload";//保存图片的路径
    	String url = request.getSession().getServletContext().getRealPath("/upload/");
    	System.out.println(url);
    	
    	//以绝对路径保存重名命后的图片
    	file.transferTo(new File(url+"/"+name + "." + ext));
    	pic.setImage(name);
    	pic.setFile("upload/"+name + "." + ext);
    	pictureService.insert(pic);
    	
    	pic.setFile(url+ name +"." + ext);
		res.put("code",0);
		res.put("msg","上传成功");
		res.put("data",data);
		data.put("src","upload/"+ name + "." + ext);
		data.put("title",name + "." + ext);
		return res;
	}


}
