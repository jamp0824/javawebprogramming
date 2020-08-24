package com.devdic.board.controller;
 
import javax.servlet.http.HttpServletRequest;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
 
import com.devdic.board.service.NoticeService;
import com.devdic.board.vo.NoticeVO;
 
@Controller
public class NoticeController {
    
    @Autowired
    public NoticeService noticeService;
    
    private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
    
    // 등록화면 보여주기
    @RequestMapping(value="/regNoticeView")
    public String regNoticeView(HttpServletRequest request) throws Throwable {
        
        return "/notice/regNotice";
    }
    
    // request정보 등록
    @RequestMapping(value="/regNotice")
    public String regNotice(HttpServletRequest request, NoticeVO noticeVO) throws Throwable {
        noticeService.regNotice(request, noticeVO);
        return "/notice/regNotice";
    }
}


출처: https://devdic.tistory.com/18 [IT'S 모든 것]