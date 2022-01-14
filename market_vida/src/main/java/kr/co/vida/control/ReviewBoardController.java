package kr.co.vida.control;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.vida.dto.CouponDTO;
import kr.co.vida.dto.PageUtil;
import kr.co.vida.dto.ReviewBoardDTO;
import kr.co.vida.service.ReviewBoardImple;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ReviewBoardController {
	
	@Autowired
	ReviewBoardImple service;
	
	@RequestMapping("/mypage/myReviewAfter")
	public ModelAndView list(Model model, @RequestParam(name = "currentPage", defaultValue = "1") int currentPage) {

		int totalNumber = service.getTotal();
	
		int countPerPage = 10;

		Map<String, Object> map = PageUtil.getPageData(totalNumber, countPerPage, currentPage);
	
		model.addAttribute("map", map);
		
		int no = 1;
		int startNo = (int) map.get("startNo");
		int endNo = (int) map.get("endNo");	
		
		return new ModelAndView("/mypage/myReviewAfter", "list", service.selectAllList(no, startNo, endNo));
	}
	
	@GetMapping("/mypage/reviewWrite")
	public String writeForm() {
		return "/mypage/reviewWriteForm";
	}

	@PostMapping("/mypage/reviewWrite")
	public String writeFormOk(@ModelAttribute("dto") ReviewBoardDTO dto, HttpServletRequest req) {
		service.insertOne(dto);
		return "redirect:/mypage/myReviewAfter";
	}
	
	@RequestMapping("/reviewDetail")
	public String detail(@RequestParam("crew_no") int crew_no, Model model) {
		ReviewBoardDTO dto = service.selectOne(crew_no);
		model.addAttribute("dto", dto);
		return "/mypage/reviewDetail";
	}
	
	@GetMapping("/reviewModify")
	public String modifyFrom(@RequestParam("review_no") int review_no, Model model) {
		ReviewBoardDTO dto = service.selectOne(review_no);
		model.addAttribute("dto", dto);
		return "/mypage/reviewModifyForm";
	}

	@PostMapping("/mypage/reviewModify")
	public String modifyOk(@ModelAttribute("dto") ReviewBoardDTO dto) {
		service.updateOne(dto);
		return "redirect:/mypage/myReviewAfter";
	}
	
	@GetMapping("/mypage/reviewDelete")
	public String deleteOne(@RequestParam("review_no") int review_no) {
		service.dropOne(review_no);
		return "redirect:/mypage/myReviewAfter";
	}
	
	
}