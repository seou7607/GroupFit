package kr.co.gf.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gf.calender.dto.CalenderDTO;
import kr.co.gf.emp.dto.EmpDTO;
import kr.co.gf.member.dto.PtMemberDTO;
import kr.co.gf.member.service.PtMemberService;

@Controller
public class PtMemberController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired PtMemberService service;
	
	
	
	@RequestMapping(value = "/dailypt")
	public String dailypt() {
		
		return "dailyptForm";
	}
	
	
	@RequestMapping(value = "/dailyptt")
	public String dailyptMain(Model model) {
		
		logger.info("list call");
		ArrayList<PtMemberDTO> dailyptlist = service.dailyptlist();	
		//logger.info("dailyptlist : "+dailyptlist);
		for (PtMemberDTO dto : dailyptlist) {
		    System.out.println(dto.getMem_no()); // mem_no 값 출력
		    System.out.println(dto.getDailypt_no());// name 값 출력
		    // 나머지 필드에 대해서도 필요한 작업 수행
		}

		logger.info("list cnt : "+dailyptlist.size());
		model.addAttribute("dailyptlist", dailyptlist);
		
		return "dailyptMain";
	}
	
	
	
	@RequestMapping(value = "/dailyptWrite.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String submitdailypt(@RequestParam HashMap<String, String> params
			,@RequestParam(value="pt_name[]") ArrayList<String> pt_name
			,@RequestParam(value="pt_kg[]") ArrayList<String> pt_kg
			,@RequestParam(value="pt_set[]") ArrayList<String> pt_set
			,HttpSession session) {
		
		// 로그인 한 트레이너 직번이 emp_no 에 들어가도록 세션
		EmpDTO empDTO = (EmpDTO) session.getAttribute("loginEmp");
		String emp_no = empDTO.getEmp_no();
		logger.info("map : "+params);
		logger.info("pt_kg[] : "+pt_kg);
		

		return service.submitdailypt(params,pt_name,pt_kg,pt_set,emp_no);
	}
	
	
	
	
	
	
	
	
	
	
}
