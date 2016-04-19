package com.domgen.dao;

import java.util.List;

import com.domgen.dto.Product;

public interface IProductDAO {

	public List<Product> fetchProduct();

	public void insertProduct(Product product) throws Exception;

	public void updateProduct(Product product) throws Exception;

	public void deleteProduct(Product product) throws Exception;
}
