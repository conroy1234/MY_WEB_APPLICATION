package com.domgen.controller;

import org.apache.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.domgen.constants.IConstants;

@Controller
public class SeachController implements IConstants{
	@RequestMapping(value = "lookup", params="items",method = RequestMethod.POST)
	
	public String search( Model model){
		
		final org.slf4j.Logger logger = LoggerFactory.getLogger(SeachController.class);
		
		
		model.addAttribute("search", googleSearch);
		logger.info("loading google search");
		return "form/search";
	}
}
