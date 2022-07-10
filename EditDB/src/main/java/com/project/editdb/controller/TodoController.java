package com.project.editdb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("/editdb/")
public class TodoController {

	@RequestMapping("todolist.do")
	public String list(String tablename, String columnname, String datatype, Model model) {
		
		String javaDatatype = "";
		if(datatype.equals("INT")||datatype.equals("NUMBER")) {
			javaDatatype = "int";
		} else {
			javaDatatype = "String";
		} 
		
		model.addAttribute("javaDatatype", javaDatatype);
		model.addAttribute("tablename", tablename);
		model.addAttribute("columnname", columnname);
		model.addAttribute("datatype", datatype);
		
		return "list";
	}
	
}
