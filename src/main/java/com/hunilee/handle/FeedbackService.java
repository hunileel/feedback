package com.hunilee.handle;


import java.util.List;
import java.util.Map;
import com.hunilee.bean.Reply;
import com.hunilee.bean.Feedback;
import com.hunilee.bean.PageBean;

/**
 * @author hunilee
 * @date 19-3-21
 */
public interface FeedbackService {

    PageBean<Feedback> findByPage(int pageCode, int pageSize, Map<String, Object> conMap);
    
    Feedback findById(int fb_id);

    void saveWords(Feedback words);

    void saveReply(Reply reply);

    List<Feedback> findByWords();
    
    List<Feedback> findWordsById(int user_id);
    
    List<Feedback> findWordsByfbId(int fb_id);
    
    List<Feedback> keynormal();

    List<Reply> findByReply();
    
    void updateFeedback(int fb_id);
    
    void sign(int fb_id);
}
