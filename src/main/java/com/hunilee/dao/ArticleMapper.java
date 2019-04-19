package com.hunilee.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hunilee.bean.Article;
import com.hunilee.bean.Reply;
import com.hunilee.bean.Words;

/**
 * @author TyCoding
 * @date 18-4-30上午9:50
 */
public interface ArticleMapper {

    void saveArticle(Article article);

    int selectCount();

    List<Article> findByPage(HashMap<String, Object> map);

    List<Article> findConByPage(Map<String, Object> conMap);

    void delete(int r_id);

    void update(Article article);

    Article findById(int r_id);

    void clean(int r_id);

    int selectCount2();

    void restore(int r_id);

    void saveWords(Words words);

    void saveReply(Reply reply);

    List<Words> findByWords();

    List<Reply> findByReply();
}
