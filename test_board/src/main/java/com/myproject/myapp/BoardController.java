package com.myproject.myapp;

import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.domain.BoardVO;
import com.board.service.boardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Inject
	private boardService service;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String getList(Model model) throws Exception{
		List<BoardVO> list = service.list();
		model.addAttribute("list", list);
		return "board/list";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.GET)
	public String Create() throws Exception {
		return "board/create";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String postcreate(BoardVO vo) throws Exception {
		service.create(vo);
		return "redirect:list";
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String getDetail(Model model, int no) throws Exception{
		BoardVO data = service.detail(no);
		model.addAttribute("data", data);
		return "board/detail";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String getUpdate(int no, Model model) throws Exception{
		BoardVO data = service.detail(no);
		model.addAttribute("data", data);
		return "board/update";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String postupdate(BoardVO vo) throws Exception {
		service.update(vo);
		return "redirect:list";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String postdelete(String no) throws Exception {
		service.delete(no);
		return "redirect:list";
	}
	
	@RequestMapping(value = "/delete")
	public String ajaxTest(HttpServletRequest request) {
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++)
		{
			service.delete(ajaxMsg[i]);
		}
		return "redirect:list";
	}
}
