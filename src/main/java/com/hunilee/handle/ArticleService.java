package com.hunilee.handle;


import java.util.List;
import java.util.Map;

import com.hunilee.bean.Article;
import com.hunilee.bean.PageBean;
import com.hunilee.bean.Reply;
import com.hunilee.bean.Words;

/**
 * @author TyCoding
 * @date 2018/5/3 上午8:36
 */
public interface ArticleService {

    void saveArticle(Article article);

    PageBean<Article> findByPage(int pageCode, int pageSize, Map<String, Object> conMap);

    void delete(int r_id);

    void update(Article article);

    Article findById(int r_id);

    void clean(int r_id);

    void restore(int r_id);

    void saveWords(Words words);

    void saveReply(Reply reply);

    List<Words> findByWords();

    List<Reply> findByReply();
}
