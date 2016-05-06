package com.domgen.marketingbudgets.bo;

import java.util.HashMap;
import java.util.List;

import com.domgen.marketingbudgets.dao.TransactionTypeDAO;
import com.domgen.marketingbudgets.vo.TransactionTypeVO;

/**
 * Finance Division
 * 
 * @version	1.0
 * @author 	SIMMR on 11-Jul-2005
 */
public class TransactionTypeBO
{

	/**
	 * retrieve finance division details for a division
	 * 
	 * @param client
	 * @return TransactionTypeVO
	 */
	public TransactionTypeVO getTransactionType(String transactionType)
	{
		// reteive finance division details
		TransactionTypeDAO transactionTypeDao = new TransactionTypeDAO();

		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBCODE", transactionType);

		List results = transactionTypeDao.findByCriteria(searchCriteria, null);

		TransactionTypeVO transactionTypeVo = null;

		for (int i = 0; i < results.size(); i++)
		{
			transactionTypeVo = (TransactionTypeVO) results.get(i);

		}
		
		return transactionTypeVo;
	}
	/**
	 * retrieve finance division details for a division
	 * 
	 * @param client
	 * @return NatureVO
	 */
	public List getTransactionTypeDropDownList()
	{
		// reteive finance division details
		TransactionTypeDAO transactionTypeDao = new TransactionTypeDAO();

		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBDISP", "Y");

		List results = transactionTypeDao.findByCriteria(searchCriteria, null);
		
		return results;
	}

	
	/**
	 * retrieve finance division details for a division
	 * 
	 * @param client
	 * @return TransactionTypeVO
	 */
	public boolean doesTransactionTypeAlreadyExist(String transactionType)
	{
		boolean success = false;
		// retrieve finance division details
		TransactionTypeDAO transactionTypeDao = new TransactionTypeDAO();

		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBCODE", transactionType);

		List results = transactionTypeDao.findByCriteria(searchCriteria, null);

		if (results.size() > 0)
		{
			success = true;
		}
		
		return success;
	}


}


