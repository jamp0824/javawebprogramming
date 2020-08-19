package com.spring.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.web.model.UserVO;

@Controller("resCon")
@RequestMapping("/response")
public class ResponseController {

	@GetMapping("/res-ex01")
	public void resEx01() {
		
	}
	//Model객체를 사용하여 화면에 데이터 전송하기.
	/*@GetMapping("/test")
	public void test(@RequestParam("age") int age,
			Model model) {
		model.addAttribute("nick","뽀삐");
		model.addAttribute("age",age);
	}*/
	//@ModelAttribute를 사용한 화면에 데이터 전송처리
	@GetMapping("/test")
	public void test(@ModelAttribute("age") int age,
			Model model) {
		model.addAttribute("nick","뽀삐");
		//model.addAttribute("age",age);
	}
	//3.ModelAndView객체를 활용한 처리
	@GetMapping("/test2")
	public ModelAndView test2() {
		/*		
		ModelAndView mv = new ModelAndView();
		mv.addObject("userName","박영희");
		mv.setViewName("/response/test2");
		return mv;*/
		
		return new ModelAndView("/response/test2","userName","김철수");
	}
	
	//res-ex02.jsp파일을 열람하는 요청메서드 작성
	
	@GetMapping("/res-ex02")
	public void resEx02() {
		
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute("user") UserVO user) {
		
		/*model.addAttribute("user",user);*/
		
		
		return "response/test3";
	}
	/*@GetMapping("/res-quiz")
	public void res_quiz() {}
	
	//커멘드 객체 Model 사용한 방식
	
	 * @PostMapping("res-login") public String resLogin(UserVO vo, Model model) {
	 * String id = vo.getUserId(); String pw = vo.getUserPw();
	 * 
	 * if(id.equals("kim123")&& pw.equals("kkk1234")) { return
	 * "response/res-quiz-success"; }else { return "response/res-quiz-fail"; } }
	 */
	
	//@ModelAttribute를 사용한 방식
	@PostMapping("/res-login")
	public String resLogin(@ModelAttribute("userId")String id
			, @RequestParam("userPw") String pw) {
		if(id.equals("kim123") && pw.equals("kkk1234")) {
			return "response/res-quiz-success";
		} else {
			return "response/res-quiz-fail";
		}
	}
	//////////////////////////////////////////////////////////////////////////
	
	//Redirect처리
	//로그인 화면 요청처리
	@GetMapping("/login")
	public String login() {
		System.out.println("/login : GET요청 발생");
		return "response/res-redirect-form";
	}
	//로그인 검증처리
	@PostMapping("login")
	public String login(@ModelAttribute("userId")String id 
						, @RequestParam("userPw")String pw
						, @RequestParam("userPwChk")String pwChk
						){
		System.out.println("/login: POST요청 발생!");
		System.out.println("ID: " + id);
		System.out.println("PW: " + pw);
		System.out.println("CHK: " + pwChk);
		
		if(id.equals("")) { 
			
			return "redirect:/response/login";
		}else if(!pw.equals(pwChk)) {
			return "redirect:/response/login";
		}else if(id.contentEquals("abc123")&& pw.equals("1234")) {
			return "response/res-quiz-success";
		}
			return null;
		
		
	}
	
}
	
	
	
	
	

