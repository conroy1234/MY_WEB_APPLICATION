package com.domgen.constants;

import javax.annotation.ManagedBean;
import javax.inject.Named;

import org.springframework.context.annotation.Scope;

@Named
@ManagedBean
@Scope("Session")
public interface IConstants{

	String welcome_message="Welcome to the spring Groovy platform";
	String display_message="the fields you have entered are displayed below";
	String formHome="form/formhome";
	String customer_form="form/customer";
	
	String welcome_display="Welcom to my website thank you for visiting!<br/>";
	String name="thes is the begining of my spring project";
	String welcome_messahe="Welcom to my website thank you for visiting!<br/>";
	String forward_to_index_page="index";
	String age="38";
	String googleSearch="https://www.google.co.uk";
	String MAIN_PAGE="home";
	String indexPage="index";
}
