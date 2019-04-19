package com.hunilee.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.hunilee.bean.Article;
import com.hunilee.bean.Reply;
import com.hunilee.bean.Words;
import com.hunilee.handle.ArticleService;

/**
 * @author TyCoding
 * @date 18-4-30上午9:49
 */
@Controller
@RequestMapping(value = "/article")
public class ArticleController {

    /**
     * 声明一个变量用于区别我访问的是文章管理页面，还是回收站页面
     * 0：访问的是文章管理页面     1：表示访问的是回收站页面
     */
    private int goId = 0;

    /**
     * 注入Service
     */
    @Autowired
    private ArticleService articleService;

    /**
     * 跳转到文章编辑页面
     */
    @RequestMapping(value = "/toArticleWrite")
    public String toArticleWrite() {
        return "view/article/articleWrite";
    }

    /**
     * 跳转到文章管理页面
     */
    @RequestMapping(value = "/toArticleManage")
    public String toArticleManage() {
        //设置我区别访问页面的状态码
        goId = 0;
        return "redirect:findByPage.do";
    }

    /**
     * 跳转到回收站页面
     */
    @RequestMapping(value = "/toArticleTrash")
    public String toArticleTrash() {
        //设置这个状态码为1表示我访问的是回收站页面
        goId = 1;
        return "redirect:findByPage.do";
    }

    /**
     * 保存文章
     */
    @RequestMapping(value = "/saveArticle")
    public String saveArticle(Article article, Model model) {
        try {
            articleService.saveArticle(article);
            model.addAttribute("message", "文章添加成功");
            return "view/info/message";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 分页查询
     */
    @RequestMapping(value = "/findByPage")
    public String findByPage(@RequestParam(value = "pageCode", defaultValue = "1", required = false) int pageCode,
                             @RequestParam(value = "pageSize", defaultValue = "3", required = false) int pageSize,
                             HttpServletRequest request,
                             Model model) {
        Map<String, Object> conMap = new HashMap<String, Object>();
           
        //回显数据
        model.addAttribute("page", articleService.findByPage(pageCode, pageSize, conMap));
        if (goId == 1) {
            return "/view/article/articleTrash";
        }
        return "view/article/articleManage";
    }

    /**
     * 删除功能
     */
    @RequestMapping(value = "/delete")
    public String delete(@RequestParam int r_id) {
        articleService.delete(r_id);
        return "redirect:findByPage.do";
    }

    /**
     * 跳转到更新文章信息页面
     */

    @RequestMapping(value = "/toEditPage")
    public String editPage(@RequestParam int r_id, Model model) {
        //先去查询
        Article article = articleService.findById(r_id);
        if (article != null) {
            model.addAttribute("article", article);
            return "view/article/articleUpdate";
        } else {
            return null;
        }
    }

    /**
     * 文章删除（仅放入回收站，即仅仅改变status的值）
     */
    @RequestMapping(value = "/clean")
    public String clean(@RequestParam int r_id) {
        articleService.clean(r_id);
        return "redirect:findByPage.do";
    }

    /**
     * 恢复文章信息功能（即将文章从回收站中取出，改变status值）
     */
    @RequestMapping(value = "/restore")
    public String restore(@RequestParam int r_id) {
        articleService.restore(r_id);
        return "redirect:findByPage.do";
    }

    /**
     * 更新文章信息的方法
     */
    @RequestMapping(value="/update")
    public String update(Article article,Model model){
        if(article != null){
            articleService.update(article);
            return "redirect:toArticleManage.do";
        }else{
            model.addAttribute("message","文章信息获取失败");
            return "view/info/message";
        }
    }

    /**
     * 保存留言信息
     */
    @RequestMapping(value="/saveWords")
    public String saveWords(Words words){
        if(words != null){
            String r_id = words.getLw_for_article_id();
            System.out.println(words.getLw_content());
            articleService.saveWords(words);
            System.out.println("保存留言");
            return "redirect:toArticleView.do?r_id="+r_id;
        }else{
            return null;
        }
    }

    /**
     * 保存回复信息
     */
    @RequestMapping(value="/saveReply")
    public String saveReply(Reply reply){
        if(reply != null){
            articleService.saveReply(reply);
            String r_id = reply.getLr_for_article_id();
            System.out.println("保存回复");
            return "redirect:toArticleView.do?r_id="+r_id;
        }else{
            return null;
        }
    }

    /**
     * 跳转到查看文章内容页面
     */
    //声明用于存放留言回复信息的List集合
    private List<Words> lw_list;
    private List<Reply> lr_list;
    @RequestMapping(value="/toArticleView")
    public String toArticleView(@RequestParam int r_id, Model model){
        //封装留言信息
        lw_list = articleService.findByWords();
        model.addAttribute("lw_list",lw_list);

        //封装回复信息
        lr_list = articleService.findByReply();
        model.addAttribute("lr_list",lr_list);

        //查询文章信息
        Article article = articleService.findById(r_id);
        System.out.println("查询到当前文章的ID值："+article.getR_id());
            model.addAttribute("article", article);
            return "view/article/articleView";
    }

}
