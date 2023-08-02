package com.siggy.rest;

import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.siggy.board.BoardService;
import com.siggy.board.PageDTO;
import com.siggy.login.LoginService;

//@ResponseBody
//@Controller
@RestController
public class ResttController {
	
	@Autowired
	private LoginService loginService;
	
	
	@PostMapping("/checkID")
	public String checkID(@RequestParam("id") String id) {

		int result = loginService.checkID(id);
		//json
		JSONObject json = new JSONObject();
		json.put("result", result);
		System.out.println(json.toString());
		
		
		
		
		return json.toString();
	}
	
	//boardList2
	@GetMapping("/boardList2")
	public String boardList2() {
		List<Map<String, Object>> list = loginService.boardList2();
		System.out.println(list);
		return "";
		
	}
	
}
