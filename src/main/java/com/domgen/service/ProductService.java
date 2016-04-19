package com.domgen.service;

import java.awt.image.ImageConsumer;
import java.awt.image.ImageProducer;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.taglibs.standard.tag.rt.core.ForEachTag;

import com.domgen.dao.IProductDAO;
import com.domgen.dto.Product;

@Named
public class ProductService implements IProcuctService {

	@Inject
	IProductDAO productDao;
	
	public IProductDAO getProductDao() {
		return productDao;
	}

	public void setProductDao(IProductDAO productDao) {
		this.productDao = productDao;
	}

	private List<Product> fetchProduct;

	@Override
	public List<Product> findProduct(String values) {
		
		if(fetchProduct==null){
			fetchProduct = productDao.fetchProduct();
		}
		
		List<Product>returnProduct=new ArrayList<Product>();
		
		for(Product product:fetchProduct){
			if(product.toString().contains(values)){
				returnProduct.add(product);
			}
		}
		return returnProduct;
	}

}
