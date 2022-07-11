package com.project.editdb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("/editdb/")
public class TodoController {

	@RequestMapping("todolist.do")
	public String list(String tablename, String columnname, String datatype, String database, String constraint, Model model) {
		
		String javaDatatype = "";
		if(datatype.equals("INT")||datatype.equals("NUMBER")) {
			javaDatatype = "int";
		} else {
			javaDatatype = "String";
		} 
		
		if(database.equals("Oracle") && datatype.equals("VARCHAR")) {
			datatype = "VARCHAR2";
		}
		
		String firstLetter = columnname.substring(0,1).toUpperCase();
		columnname = firstLetter + columnname.substring(1).toLowerCase();
		
		model.addAttribute("javaDatatype", javaDatatype);
		model.addAttribute("tablename", tablename);
		model.addAttribute("columnname", columnname);
		model.addAttribute("datatype", datatype);
		model.addAttribute("database", database);
		model.addAttribute("constraint", constraint);
		
		return "list";
	}
	
}
