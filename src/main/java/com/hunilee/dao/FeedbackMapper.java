package com.hunilee.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.hunilee.bean.Reply;
import com.hunilee.bean.Feedback;
import com.hunilee.bean.Picture;

/**
 * @author hunilee
 * @date 19-3-21
 */
public interface FeedbackMapper {
	
	int selectCount();

    List<Feedback> findByPage(HashMap<String, Object> map);

    List<Feedback> findConByPage(Map<String, Object> conMap);
    
    Feedback findById(int fb_id);
    
    void saveWords(Feedback words);

    void saveReply(Reply reply);

    List<Feedback> findByWords();
    
    List<Feedback> findWordsById(int user_id);
    
    List<Feedback> findWordsByfbId(int fb_id);
    
    List<Reply> findByReply();
    
    List<Feedback> keynormal();
    
    void savePicture(Picture picture);
    
    void sign(Feedback words);
    
    void updateFeedback(Feedback feedback);
}
