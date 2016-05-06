package com.domgen.marketingbudgets.bo;

import java.util.HashMap;
import java.util.List;

import com.domgen.marketingbudgets.dao.PurchaseLedgerDAO;
import com.domgen.marketingbudgets.vo.PurchaseLedgerVO;

/**
 * Finance Division
 * 
 * @version	1.0
 * @author 	SIMMR on 11-Jul-2005
 */
public class PurchaseLedgerBO
{

	/**
	 * retrieve finance division details for a division
	 * 
	 * @param client
	 * @return PurchaseLedgerVO
	 */
	public PurchaseLedgerVO getPurchaseLedger(String ledger)
	{
		// reteive finance division details
		PurchaseLedgerDAO purchaseLedgerDao = new PurchaseLedgerDAO();

		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBPURL", ledger);

		List results = purchaseLedgerDao.findByCriteria(searchCriteria, null);

		PurchaseLedgerVO purchaseLedgerVo = null;

		for (int i = 0; i < results.size(); i++)
		{
			purchaseLedgerVo = (PurchaseLedgerVO) results.get(i);

		}
		
		return purchaseLedgerVo;
	}
	
	/**
	 * retrieve finance division details for a division
	 * 
	 * @param client
	 * @return NatureVO
	 */
	public List getPurchaseLedgerDropDownList()
	{
		// reteive finance division details
		PurchaseLedgerDAO purchaseLedgerDao = new PurchaseLedgerDAO();

		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBDISP", "Y");

		List results = purchaseLedgerDao.findByCriteria(searchCriteria, null);
		
		return results;
	}

	
	/**
	 * retrieve finance division details for a division
	 * 
	 * @param client
	 * @return PurchaseLedgerVO
	 */
	public boolean doesPurchaseLedgerAlreadyExist(String ledger)
	{
		boolean success = false;
		// retrieve finance division details
		PurchaseLedgerDAO purchaseLedgerDao = new PurchaseLedgerDAO();

		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBPURL", ledger);

		List results = purchaseLedgerDao.findByCriteria(searchCriteria, null);

		if (results.size() > 0)
		{
			success = true;
		}
		
		return success;
	}


}

