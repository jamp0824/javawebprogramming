package com.devdic.board.service.impl;
 
import java.util.List;
 
import javax.servlet.http.HttpServletRequest;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import com.devdic.board.dao.NoticeDao;
import com.devdic.board.service.NoticeService;
import com.devdic.board.vo.NoticeVO;
import com.devdic.util.file.FileUpload;
 
@Service
public class NoticeServiceImpl implements NoticeService{
    
    @Autowired
    public NoticeDao noticeDao;
 
    @Override
    public int regNotice(HttpServletRequest req, NoticeVO noticeVO) throws Exception {
        // TODO Auto-generated method stub
        
        // 공지사항 정보 등록
        insertNotice(noticeVO);
        
        FileUpload fileUpload = new FileUpload();
        List<NoticeVO> list= fileUpload.parseInsertFileInfo(req);
        int i = 0;
        for(NoticeVO fileList: list){
            i++;
            noticeVO.setAttFileId(i);
            noticeVO.setAttFileNm(fileList.getAttFileNm());
            noticeVO.setAttFileSaveNm(fileList.getAttFileSaveNm());
            noticeVO.setAttFileSize(fileList.getAttFileSize());
            noticeVO.setDelYn("N");
            // 첨부파일 등록
            insertAttFile(noticeVO);
        }
        return 0;
    }
    
    private int insertNotice(NoticeVO noticeVO) throws Exception{
        return noticeDao.insertNotice(noticeVO);
    }
    
    private int insertAttFile(NoticeVO notieceVO) throws Exception{
        return noticeDao.insertAttFile(notieceVO);
    }
 
}


출처: https://devdic.tistory.com/18 [IT'S 모든 것]