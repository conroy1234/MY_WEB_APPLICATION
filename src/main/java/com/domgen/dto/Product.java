package com.domgen.dto;

import javax.faces.bean.ManagedBean;
import javax.inject.Named;
import javax.inject.Scope;

import org.springframework.orm.hibernate3.HibernateTemplate;

public class Product {

@Named	
private String name;
private String price;
private String discription;
private HibernateTemplate template;  


	public HibernateTemplate getTemplate() {
	return template;
}

public void setTemplate(HibernateTemplate template) {
	this.template = template;
}

	public String getPrice() {
	return price;
}

public void setPrice(String price) {
	this.price = price;
}

public String getDiscription() {
	return discription;
}

public void setDiscription(String discription) {
	this.discription = discription;
}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
