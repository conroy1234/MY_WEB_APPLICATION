package com.domgen.service;

import java.util.List;

import com.domgen.dto.Product;
/**
 * 
 * @author whiteco
 *interface to be implemented
 */
public interface IProcuctService {

	public List<Product> findProduct(String find);
}
