package com.domgen.marketingbudgets.bo;

import java.util.HashMap;
import java.util.List;

import com.domgen.marketingbudgets.dao.NatureDAO;
import com.domgen.marketingbudgets.vo.NatureVO;

/**
 * Finance Division
 * 
 * @version	1.0
 * @author 	SIMMR on 11-Jul-2005
 */
public class NatureBO
{

	/**
	 * retrieve finance division details for a division
	 * 
	 * @param client
	 * @return NatureVO
	 */
	public NatureVO getNature(String nature)
	{
		// reteive finance division details
		NatureDAO natureDao = new NatureDAO();

		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBCODE", nature);

		List results = natureDao.findByCriteria(searchCriteria, null);

		NatureVO natureVo = null;

		for (int i = 0; i < results.size(); i++)
		{
			natureVo = (NatureVO) results.get(i);

		}
		
		return natureVo;
	}
	
	/**
	 * retrieve finance division details for a division
	 * 
	 * @param client
	 * @return NatureVO
	 */
	public List getNaturesDropDownList()
	{
		// reteive finance division details
		NatureDAO natureDao = new NatureDAO();

		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBDISP", "Y");

		List results = natureDao.findByCriteria(searchCriteria, null);
		
		return results;
	}

	
	/**
	 * retrieve finance division details for a division
	 * 
	 * @param client
	 * @return NatureVO
	 */
	public boolean doesNatureAlreadyExist(String nature)
	{
		boolean success = false;
		// retrieve finance division details
		NatureDAO natureDao = new NatureDAO();

		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBCODE", nature);

		List results = natureDao.findByCriteria(searchCriteria, null);

		if (results.size() > 0)
		{
			success = true;
		}
		
		return success;
	}


}


