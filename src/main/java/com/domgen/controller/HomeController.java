package com.domgen.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.domgen.constants.IConstants;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController implements IConstants{
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		model.addAttribute("welcome_messahe",welcome_messahe);
		model.addAttribute("forward_to_index_page",forward_to_index_page);
		model.addAttribute("welcome_display", welcome_display);
		
		return MAIN_PAGE;
	}
	
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(Model model){
			model.addAttribute("application",name);
	return indexPage;	
	}
	
	
	
}


