package com.hunilee.web;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.alibaba.fastjson.JSONObject;
import com.hunilee.bean.Protype;
import com.hunilee.bean.Secprotype;
import com.hunilee.handle.ProtypeService;
import com.hunilee.handle.SecProtypeService;
import net.sf.json.JSONArray;


/**
 * @author hunilee
 * @date 19-3-21
 */
@Controller
@RequestMapping(value = "/protype")
public class ProtypeController {

    /**
     * 注入Service
     */
    @Autowired
    private ProtypeService protypeService;
    
    @Autowired
    private SecProtypeService secprotypeService;
    
    /**
     * 一级大类分页查询
     */
    @RequestMapping(value = "/findByPage")
    public String findByPage(@RequestParam(value = "pageCode", defaultValue = "1", required = false) int pageCode,
                             @RequestParam(value = "pageSize", defaultValue = "10", required = false) int pageSize,
                             HttpServletRequest request,
                             Model model) {
    	
        Map<String, Object> conMap = new HashMap<String, Object>();

        //回显数据
        model.addAttribute("page", protypeService.findByPage(pageCode, pageSize, conMap));
        return "protypeManage";
    }
    
    /**
     * 二级大类分页查询
     */
    @RequestMapping(value = "/secfindByPage")
    public String secfindByPage(@RequestParam(value = "pageCode", defaultValue = "1", required = false) int pageCode,
                             @RequestParam(value = "pageSize", defaultValue = "10", required = false) int pageSize,
                             HttpServletRequest request,
                             Model model,@RequestParam int nid) {
    	Protype pro =protypeService.selectByPrimaryKey(nid);
    	
    	model.addAttribute("pro", pro);
    	
        Map<String, Object> conMap = new HashMap<String, Object>();

        //回显数据
        model.addAttribute("page", secprotypeService.findByPage(pageCode, pageSize, conMap));
        return "secprotypeManage";
    }
    
    /**
     * 跳转更新页面
     */
    @RequestMapping(value="/renew")
    public String  renew(@RequestParam(defaultValue="0" ) int nid,@RequestParam(defaultValue="0" ) int scid,Model model) {
    	if(nid !=0) {
    		System.out.println("----开始更新一级问题大类");
        	System.out.println(nid);
    	Protype pro =protypeService.selectByPrimaryKey(nid);
    	model.addAttribute("pro", pro);
    	return "renew";
    	}else {
    		System.out.println("----开始更新二级问题大类");
    		System.out.println(scid);
    	Secprotype secpro =	 secprotypeService.selectByPrimaryKey(scid);
    	model.addAttribute("secpro", secpro);
    	return "screnew";
		}
    }
    
    /**
     * 创建一级问题标题
     */
    @RequestMapping(value="/createfirst")
    public String createfirst(Protype protype,Model model,@RequestParam(value = "pageCode", defaultValue = "1", required = false) int pageCode){
    	System.out.println(protype.toString());
    	protypeService.insert(protype);
    	return "redirect:findByPage.do?pageCode="+pageCode;
    }
    
    /**
     * 标注问题为热点问题
     */
    @RequestMapping(value="/setHotpro")
    public String setHotpro(@RequestParam int scid,@RequestParam(value = "pageCode", defaultValue = "1", required = false) int pageCode){
    	secprotypeService.setHotpro(scid);
    	return "redirect:secfindByPage.do?pageCode="+pageCode;
    }
    /**
     * 更新一级问题标题
     */
    @RequestMapping(value="/update")
    @ResponseBody
    public String update(Protype protype,Model model){
    	System.out.println(protype.toString());
    	protypeService.updateByPrimaryKeySelective(protype);
    	return "success";
    }
    

    /**
     * 更新二级问题标题
     */
    @RequestMapping(value="/scupdate")
    @ResponseBody
    public String scupdate(Secprotype secprotype,Model model){
    	System.out.println(secprotype.toString());
    	secprotypeService.updateByPrimaryKeySelective(secprotype);
    	return "success";
    }
    
    /**
     * 跳转问题详情页面
     */
    @RequestMapping(value="/toDetail")
    public String todetail(@RequestParam int scid,Model model){
    	Secprotype sec= secprotypeService.selectByPrimaryKey(scid);
    	 model.addAttribute("sec", sec);
    	return "prodetail";
    }
    /**
     * 保存问题信息
     */
    @RequestMapping(value="/save")
    public String save(Secprotype sec,HttpServletRequest request,Model model) {
    	
    	int count = 0;
		for (int i = 1; i < 30; i++) {
			String pic = request.getParameter("pic_pic_" + i);
			if (pic != null) {
				count++;
				switch (count) {
				case 1:
					System.out.println(pic);
					sec.setPic1(pic);
					break;
				case 2:
					System.out.println(pic);
					sec.setPic2(pic);
					break;
				case 3:
					System.out.println(pic);
					sec.setPic3(pic);
					break;
				case 4:
					System.out.println(pic);
					sec.setPic4(pic);
					break;
				case 5:
					System.out.println(pic);
					sec.setPic5(pic);
					break;
				case 6:
					System.out.println(pic);
					sec.setPic6(pic);
					break;
				case 7:
					System.out.println(pic);
					sec.setPic7(pic);
					break;
				case 8:
					System.out.println(pic);
					sec.setPic8(pic);
					break;
				case 9:
					System.out.println(pic);
					sec.setPic9(pic);
					break;
				}
			}
		}
        if(sec != null){
            secprotypeService.insert(sec);
            model.addAttribute("sec", sec);
            return "prodetail";
        }else{
            return null;
        }
        
    }
    /**
     * 跳转到一级问题页面
     */
    //声明用于存放一级问题类型的List集合
    private List<Protype> listProtype;
    @RequestMapping(value="/toProtypeView")
    public String toReplyView(Model model,HttpSession session){
        //封装问题类型
    	listProtype = protypeService.allProype();
        model.addAttribute("listProtype",listProtype);
            return "protype";
    }
    
    /**
     * 跳转二级问题编辑页面
     */
    @RequestMapping(value="/toSecpro")
    public String  toSecpro(Model model,@RequestParam int nId) {
    	model.addAttribute("nId", nId);
    	return "proedit";
    }
    
    
    /**
     * 问题详情编辑
     */
    @RequestMapping(value ="/tohh")
    public String deailedit() {
    	return "/view/article/articleTrash";
    	
    }
    
    
    
    /**
     * 分页功能
     */
    @RequestMapping(value="findallEmp",produces="text/html;charset=utf-8")
    public @ResponseBody String findallEmp(@RequestParam(value = "page", defaultValue = "1", required = false) int page, @RequestParam(value = "limit", defaultValue = "1", required = false)int limit){
        int before = limit * (page - 1) + 1;
        int after = page * limit;
        System.out.println(before+"--------"+after);;
        //带参数从数据库里查询出来放到eilist的集合里
        List<Protype> eilist = protypeService.findAllPage(before, after);
        int count = protypeService.count();
        //用json来传值
        JSONArray json = JSONArray.fromObject(eilist);
        String js = json.toString();
        //*****转为layui需要的json格式，必须要这一步，博主也是没写这一步，在页面上数据就是数据接口异常
        String jso = "{\"code\":0,\"msg\":\"\",\"count\":"+count+",\"data\":"+js+"}";
        return jso;
    }
    
    @ResponseBody
    @RequestMapping(value = "/uploadImage", method = RequestMethod.POST)
    public String uploadImage(HttpServletRequest request ,MultipartFile file) {
        Map<String, Object> res = new HashMap<>();
        try {
        	res = protypeService.uploadImage(request,file);
        	System.out.println(res.get("msg"));
        	 String result = new JSONObject(res).toString();
            return result ;
        } catch (Exception e) {
            e.printStackTrace();
            res.put("code", -1);
            res.put("msg", "上传失败");
            String result = new JSONObject(res).toString();
            return result ;
        }
    }
    
    /**
     * 展示标注问题
     */
    //声明用于存放热点问题的List集合
    private List<Secprotype> keynormal;
    @RequestMapping(value="/keynormal")
    public String keynormal( Model model,HttpSession session){
        //封装热点问题
    	keynormal = secprotypeService.keynormal();
        model.addAttribute("keynormal",keynormal);
        //查询文章信息
            return "normal";
    }
    
    /**
     *删除问题
     */
    @RequestMapping(value="/clean")
    public String clean(@RequestParam int scId,@RequestParam int nId){
    	System.out.println("*----------------------*"+scId);
    	 secprotypeService.deleteByPrimaryKey(scId);
            return "redirect:secfindByPage.do?nid="+nId;
    }
    
 // 图片上传
 	@RequestMapping(value = "upload", method = RequestMethod.POST)
 	public @ResponseBody String upload(MultipartFile file, Model model, HttpSession session,HttpServletRequest request) throws Exception {
 		JSONObject json = new JSONObject();
 		// 原始名称
 		String originalFilename = file.getOriginalFilename();
 		// 上传图片
 		if (file != null && originalFilename != null && originalFilename.length() > 0) {

 		// 存储图片的物理路径
 			String pic_path = request.getSession().getServletContext().getRealPath("/upload/");

 			// 新的图片名称
 			String newFileName = UUID.randomUUID().toString().replace("-", "") + originalFilename.substring(originalFilename.lastIndexOf("."));
 			String pic_1, pic_2, pic_3, pic_4, pic_5, pic_6, pic_7, pic_8, pic_9;
 			pic_1 = (String) session.getAttribute("pic_1");
 			System.out.println(pic_1);
 			pic_2 = (String) session.getAttribute("pic_2");
 			pic_3 = (String) session.getAttribute("pic_3");
 			pic_3 = (String) session.getAttribute("pic_3");
 			pic_4 = (String) session.getAttribute("pic_4");
 			pic_5 = (String) session.getAttribute("pic_5");
 			pic_6 = (String) session.getAttribute("pic_6");
 			pic_7 = (String) session.getAttribute("pic_7");
 			pic_8 = (String) session.getAttribute("pic_8");
 			pic_9 = (String) session.getAttribute("pic_9");
 			if (pic_1 == null) {
 				pic_1 = newFileName;
 				session.setAttribute("pic_1", newFileName);
 			} else if (pic_2 == null) {
 				pic_2 = newFileName;
 				session.setAttribute("pic_2", newFileName);
 			} else if (pic_3 == null) {
 				pic_3 = newFileName;
 				session.setAttribute("pic_3", newFileName);
 			} else if (pic_4 == null) {
 				pic_3 = newFileName;
 				session.setAttribute("pic_4", newFileName);
 			} else if (pic_5 == null) {
 				pic_3 = newFileName;
 				session.setAttribute("pic_5", newFileName);
 			} else if (pic_6 == null) {
 				pic_3 = newFileName;
 				session.setAttribute("pic_6", newFileName);
 			} else if (pic_7 == null) {
 				pic_3 = newFileName;
 				session.setAttribute("pic_7", newFileName);
 			} else if (pic_8 == null) {
 				pic_3 = newFileName;
 				session.setAttribute("pic_8", newFileName);
 			} else if (pic_9 == null) {
 				pic_3 = newFileName;
 				session.setAttribute("pic_9", newFileName);
 			}
 			// 新图片
 			File newFile = new File(pic_path + newFileName);

 			// 将内存中的数据写入磁盘
 			file.transferTo(newFile);

 			// 将新图片名称写到user中

 			json.put("status", "OK");
 			json.put("picName", newFileName);
 			System.out.println(json.toString());
 			return json.toString();
 		}
 		json.put("status", "NO");
 		System.out.println(json.toString());
 		return json.toString();
 	}

}
