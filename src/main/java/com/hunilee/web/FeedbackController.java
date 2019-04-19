package com.hunilee.web;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.alibaba.fastjson.JSONObject;
import com.hunilee.bean.Feedback;
import com.hunilee.bean.Picture;
import com.hunilee.bean.Protype;
import com.hunilee.bean.Reply;
import com.hunilee.bean.Secprotype;
import com.hunilee.handle.FeedbackService;
import com.hunilee.handle.PictureService;
import com.hunilee.handle.ProtypeService;
import com.hunilee.handle.SecProtypeService;


/**
 * @author hunilee
 * @date 19-3-21
 */
@Controller
@RequestMapping(value = "/feedback")
public class FeedbackController {

    /**
     * 注入Service
     */
    @Autowired
    private FeedbackService articleService;
    
    @Autowired
    private PictureService pictureService;
    
    @Autowired
    private SecProtypeService secprotypeService;
    
    @Autowired
    private ProtypeService protypeService;

    /**
     * 保存回复信息
     */
    @RequestMapping(value="/saveReply")
    public String saveReply(Reply reply,int re_for_words,HttpServletRequest request) {
    	
    	int count = 0;
		for (int i = 1; i < 30; i++) {
			String pic = request.getParameter("pic_pic_" + i);
			if (pic != null) {
				count++;
				switch (count) {
				case 1:
					System.out.println(pic);
					reply.setPic1(pic);
					break;
				case 2:
					System.out.println(pic);
					reply.setPic2(pic);
					break;
				case 3:
					System.out.println(pic);
					reply.setPic3(pic);
					break;
				case 4:
					System.out.println(pic);
					reply.setPic4(pic);
					break;
				case 5:
					System.out.println(pic);
					reply.setPic5(pic);
					break;
				case 6:
					System.out.println(pic);
					reply.setPic6(pic);
					break;
				case 7:
					System.out.println(pic);
					reply.setPic7(pic);
					break;
				case 8:
					System.out.println(pic);
					reply.setPic8(pic);
					break;
				case 9:
					System.out.println(pic);
					reply.setPic9(pic);
					break;
				}
			}
		}
        if(reply != null){
            System.out.println("---------------"+re_for_words);
            articleService.saveReply(reply);
            articleService.updateFeedback(re_for_words);
            return "redirect:toArticleView.do?fb_id="+re_for_words;
        }else{
            return null;
        }
        
    }
    
    /**
     * 分页查询
     */
    @RequestMapping(value = "/findByPage")
    public String findByPage(@RequestParam(value = "pageCode", defaultValue = "1", required = false) int pageCode,
                             @RequestParam(value = "pageSize", defaultValue = "10", required = false) int pageSize,
                             HttpServletRequest request,
                             Model model) {
    	int goId = 0;
        // 封装分页数据
        String verify = request.getParameter("r_verify");
        String publish = request.getParameter("r_publish");
        String status = request.getParameter("r_status");
        int r_verify = 0, r_publish = 0, r_status = 0;
        if (verify != null) {
            if (verify.equals("已审核")) {
                r_verify = 1;
            } else if (verify.equals("未审核")) {
                r_verify = 0;
            }
        }
        if (publish != null) {
            if (publish.equals("已发布")) {
                r_publish = 1;
            } else if (verify.equals("未发布")) {
                r_publish = 0;
            }
        }
        if (status != null) {
            if (status.equals("存在")) {
                r_status = 0;
            } else if (status.equals("已删除")) {
                r_status = 1;
            }
        }
        Map<String, Object> conMap = new HashMap<String, Object>();
        conMap.put("r_verify", r_verify);
        conMap.put("r_publish", r_publish);
        conMap.put("r_status", r_status);

        //把状态码也放入Map集合中
        conMap.put("goId", goId);

        //回显数据
        model.addAttribute("page", articleService.findByPage(pageCode, pageSize, conMap));
        if (goId == 1) {
            return "/view/article/articleTrash";
        }
        return "articleManage";
    }
    
    /**
     * 跳转到查看文章内容页面
     */
    //声明用于存放留言回复信息的List集合
    private List<Feedback> listWords;
    private List<Reply> listReply;
    @RequestMapping(value="/toReplyView")
    public String toReplyView( Model model,HttpSession session){
        //封装留言信息
    	int user_id = (int) session.getAttribute("id");
    	listWords = articleService.findWordsById(user_id);
        model.addAttribute("listWords",listWords);

        //封装回复信息
        listReply = articleService.findByReply();
        model.addAttribute("listReply",listReply);

        //查询文章信息
            return "reply";
    }
    
    /**
     * 保存留言信息
     */
    @RequestMapping(value="/saveWord")
    public String saveWord(Feedback words,HttpSession session,MultipartFile file,HttpServletRequest request)throws Exception{
    	int count = 0;
		for (int i = 1; i < 30; i++) {
			String pic = request.getParameter("pic_pic_" + i);
			if (pic != null) {
				count++;
				switch (count) {
				case 1:
					System.out.println(pic);
					words.setPic1(pic);
					break;
				case 2:
					System.out.println(pic);
					words.setPic2(pic);
					break;
				case 3:
					System.out.println(pic);
					words.setPic3(pic);
					break;
				case 4:
					System.out.println(pic);
					words.setPic4(pic);
					break;
				case 5:
					System.out.println(pic);
					words.setPic5(pic);
					break;
				case 6:
					System.out.println(pic);
					words.setPic6(pic);
					break;
				case 7:
					System.out.println(pic);
					words.setPic7(pic);
					break;
				case 8:
					System.out.println(pic);
					words.setPic8(pic);
					break;
				case 9:
					System.out.println(pic);
					words.setPic9(pic);
					break;
				}
			}
		}
		
//    	System.out.println("获取的图片名"+request.getParameter("file")+ "--------"+file.getOriginalFilename());
    	Picture pic = new Picture();
    	if(null !=  file) {
    	try {
    	String name = UUID.randomUUID().toString().replaceAll("-", "");
    	String ext = FilenameUtils.getExtension(file.getOriginalFilename());
    	String url  = request.getSession().getServletContext().getRealPath("/upload/");
    	pic.setImage(name);
    	pic.setFile(url);
    	pictureService.insert(pic);
    	System.out.println("上传路径"+"--------------"+url);
    	file.transferTo(new File(url +"/"+name + "."+ext));
    	System.out.println("--------------"+file.toString());} 
    	catch (Exception e) {
    		System.out.println("-------失败了");
    		e.printStackTrace();
    		
		}}
    	if(null !=words){
        	words.setUser_id((int)session.getAttribute("id"));
        	words.setFb_for_reply("0");
            articleService.saveWords(words);
            return "redirect:toReplyView.do";
        }else{
            return null;
        }
    }

    /**
     * 跳转到查看文章内容页面
     */
    //声明用于存放留言回复信息的List集合
    private List<Feedback> listWord;
    private List<Reply> listRepl;
    @RequestMapping(value="/toRewordView")
    public String toRewordView(Model model,HttpSession session,@RequestParam int fb_id){
        //封装留言信息
//    	int user_id = (int) session.getAttribute("id");
    	listWord = articleService.findWordsByfbId(fb_id);
    	
        model.addAttribute("listWord",listWord);

        //封装回复信息
        listRepl = articleService.findByReply();
        model.addAttribute("listRepl",listRepl);

        //查询文章信息
            return "word";
    }
    
    /**
     * 跳转回意见反馈页面
     */
    @RequestMapping(value="/toText")
    public String  toText(HttpSession session) {
    	return "text";
    }
    
    /**
     * 跳转继续反馈页面
     */
    @RequestMapping(value="/toSreply")
    public String  toSreply() {
    	return "Sreply";
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
            return "hotpro";
    }
    
    /**
     * 展示标注问题
     */
    @RequestMapping(value="/toProdetail")
    public String toProdetail( Model model,HttpSession session,@RequestParam int scId){
    	Secprotype sec = new Secprotype();
    	sec = secprotypeService.selectByPrimaryKey(scId);
        model.addAttribute("sec",sec);
       
            return "detail";
    }
    
    /**
     * 跳转到查看反馈内容页面
     */
    //声明用于存放留言回复信息的List集合
    private List<Feedback> lw_list;
    private List<Reply> lr_list;
    @RequestMapping(value="/toArticleView")
    public String toArticleView(@RequestParam int fb_id, Model model){
    	
        //封装留言信息
        lw_list = articleService.findByWords();
        model.addAttribute("lw_list",lw_list);

        //封装回复信息
        lr_list = articleService.findByReply();
        model.addAttribute("lr_list",lr_list);

        //查询文章信息
        Feedback feedback = articleService.findById(fb_id);
        System.out.println("查询到当前文章的ID值："+feedback.getFb_id());
            model.addAttribute("article", feedback);
            return "articleView";
    }
    
    /**
     * 保存留言信息
     */
    @RequestMapping(value="/saveWords")
    public String saveWord(Feedback words){
    	if(words != null){
            articleService.saveWords(words);
            return "redirect:toReplyView.do";
        }else{
            return null;
        }
    }
    
    /**
     * 标星留言信息
     */
    @RequestMapping(value="/sign")
    public String sign(@RequestParam int fb_id, @RequestParam int pageCode) {
    	int page = pageCode+1;
    	articleService.sign(fb_id);
    	
    	System.out.println("----------------标记成功");
    	return "redirect:findByPage.do?pageCode="+page;
    }
    
    /**
     * 跳转所有问题
     */
  //声明用于存放一级标题问题的List集合
    private List<Protype> allpro;
    @RequestMapping(value="/toAllpro")
    public String toHotpro(Model model) {
    	allpro =  protypeService.allProype();
    	model.addAttribute("allpro", allpro);
    	return "allnormal";
    }
    
    /**
     * 跳转所有二级问题
     */
    @RequestMapping(value="/toSecpro")
    public String toSecpro(Model model,@RequestParam int nId) {
    	keynormal =  secprotypeService.selectBynId(nId);
    	model.addAttribute("keynormal", keynormal);
    	return "normal";
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
