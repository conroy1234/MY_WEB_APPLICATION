package com.domgen.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.domgen.constants.IConstants;
import com.domgen.model.Customer;
import com.domgen.model.Login;

@Controller
public class formController implements IConstants {
	@RequestMapping(value = "form", params = "controle", method = RequestMethod.GET)
	public String home(Model model, @ModelAttribute("customer") Customer customer) {

		model.addAttribute("customer", new Customer());
		model.addAttribute("message", welcome_message);
		return formHome;
	}

	@RequestMapping(value = "customer", params = "customerLogin", method = RequestMethod.POST)
	public String login(Model model, @ModelAttribute("customer") Customer customer) {

		model.addAttribute("customer", new Customer());
		model.addAttribute("name", customer.getName());
		model.addAttribute("number", customer.getNumber());
		model.addAttribute("address", customer.getAddress());
		return customer_form;
	}
}