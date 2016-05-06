package com.domgen.marketingbudgets.bo;

import java.util.HashMap;
import java.util.List;

import com.domgen.marketingbudgets.dao.FinanceDivisionDAO;
import com.domgen.marketingbudgets.vo.FinanceDivisionVO;

/**
 * Finance Division
 * 
 * @version	1.0
 * @author 	SIMMR on 11-Jul-2005
 */
public class FinanceDivisionBO
{

	/**
	 * retrieve finance division details for a division
	 * 
	 * @param client
	 * @return FinanceDivisionVO
	 */
	public FinanceDivisionVO getFinanceDivision(String division)
	{
		// reteive finance division details
		FinanceDivisionDAO financeDivisionDao = new FinanceDivisionDAO();

		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBFIND", division);

		List results = financeDivisionDao.findByCriteria(searchCriteria, null);

		FinanceDivisionVO financeDivisionVo = null;

		for (int i = 0; i < results.size(); i++)
		{
			financeDivisionVo = (FinanceDivisionVO) results.get(i);

		}
		
		return financeDivisionVo;
	}
	
	/**
	 * retrieve finance division details for a division
	 * 
	 * @param client
	 * @return NatureVO
	 */
	public List getFinanceDivisionDropDownList()
	{
		// reteive finance division details
		FinanceDivisionDAO financeDivisionDao = new FinanceDivisionDAO();

		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBDISP", "Y");

		List results = financeDivisionDao.findByCriteria(searchCriteria, null);
		
		return results;
	}

	
	/**
	 * retrieve finance division details for a division
	 * 
	 * @param client
	 * @return FinanceDivisionVO
	 */
	public boolean doesFinanceDivisionAlreadyExist(String division)
	{
		boolean success = false;
		// retrieve finance division details
		FinanceDivisionDAO financeDivisionDao = new FinanceDivisionDAO();

		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBFIND", division);

		List results = financeDivisionDao.findByCriteria(searchCriteria, null);

		if (results.size() > 0)
		{
			success = true;
		}
		
		return success;
	}


}
