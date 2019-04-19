package com.hunilee.handle.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hunilee.bean.Reply;
import com.hunilee.bean.Feedback;
import com.hunilee.bean.PageBean;
import com.hunilee.dao.FeedbackMapper;
import com.hunilee.handle.FeedbackService;

/**
 * @author hunilee
 * @date 19-3-21
 */
@Service
public class FeedbackServiceImpl implements FeedbackService {

    /**
     * 注入Mapper层
     */
    @Autowired
    private FeedbackMapper articleMapper;
    
    /**
     * 分页查询的方法
     * @param pageCode 当前页
     * @param pageSize 每页显示的记录条数
     * @param conMap 分页查询的数据
     * @return 分页查询的结果
     */
    public PageBean<Feedback> findByPage(int pageCode, int pageSize, Map<String, Object> conMap) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        PageBean<Feedback> pageBean = new PageBean<Feedback>();


        //封装数据
        pageBean.setPageCode(pageCode);
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = 0;
            totalCount = articleMapper.selectCount();
        
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num = Math.ceil(tc / pageSize);
        pageBean.setTotalPage(num.intValue());

        //设置limit起始位置和终止位置
        map.put("start",(pageCode - 1) * pageSize);
        map.put("size",pageBean.getPageSize());

        //封装每页显示的数据
        List<Feedback> list = articleMapper.findByPage(map);
        pageBean.setBeanList(list);

        for(Object obj : list){
            System.out.println(obj);
        }

        //条件查询的封装
        conMap.put("start",(pageCode - 1) * pageSize);
        conMap.put("size",pageBean.getPageSize());

        List<Feedback> conList = articleMapper.findConByPage(conMap);
        pageBean.setBeanList(conList);
        return pageBean;
    }

    /**
     * 保存留言信息功能
     * @param words 保存的信息
     */
    public void saveWords(Feedback words) {
        articleMapper.saveWords(words);
    }

    /**
     * 保存回复信息内容
     * @param reply 回复信息
     */
    public void saveReply(Reply reply) {
        articleMapper.saveReply(reply);
    }

    /**
     * 查询所有留言信息
     * @return 返回查询查询到的留言信息并存放到List集合中
     */
    public List<Feedback> findByWords() {
        return articleMapper.findByWords();
    }
    
    /**
     * 根据id查询所有留言信息
     * @return 返回查询查询到的留言信息并存放到List集合中
     */
    public List<Feedback> findWordsById(int user_id) {
        return articleMapper.findWordsById(user_id);
    }

    /**
     * 查询所有的回复信息
     * @return 返回查询到的回复信息并存放到List集合中
     */
    public List<Reply> findByReply() {
        return articleMapper.findByReply();
    }

	@Override
	public List<Feedback> keynormal() {
		return articleMapper.keynormal();
	}

	@Override
	public Feedback findById(int fb_id) {
		return articleMapper.findById(fb_id);
	}

	@Override
	public void sign(int fb_id) {
		System.out.println("开始标记");
		Feedback fb= articleMapper.findById(fb_id);
		if(fb.getFb_for_reply().equals("") ||fb.getFb_for_reply().equals("0"))
		{
			System.out.println("标记反馈");
			fb.setFb_for_reply("1");
			articleMapper.sign(fb);
		}
		else {
			System.out.println("取消标记反馈");
			fb.setFb_for_reply("0");
			articleMapper.sign(fb);
		}
		
	}

	@Override
	public void updateFeedback(int fb_id) {
		Feedback fb = new Feedback();
		fb.setFb_id(fb_id);
		fb.setFb_for_reply("1");
	    articleMapper.updateFeedback(fb);
		
	}

	@Override
	public List<Feedback> findWordsByfbId(int fb_id) {
		return articleMapper.findWordsByfbId(fb_id);
	}


}
