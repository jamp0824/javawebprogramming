package com.devdic.board.dao.impl;
 
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 
import com.devdic.board.dao.NoticeDao;
import com.devdic.board.vo.NoticeVO;
 
@Repository
public class NoticeDaoImpl implements NoticeDao{
    
    @Autowired
    private SqlSessionTemplate sqlSession;
    
    private final String namespace = "SqlMapNoticeDao";
    
    public int insertNotice(NoticeVO noticeVO) throws Exception{
        return sqlSession.insert(namespace+".insertNotice", noticeVO);
    }
    
    public int insertAttFile(NoticeVO noticeVO) throws Exception{
        return sqlSession.insert(namespace+".insertAttFile", noticeVO);
    }
 
}


출처: https://devdic.tistory.com/18 [IT'S 모든 것]