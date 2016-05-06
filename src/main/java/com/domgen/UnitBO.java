package com.domgen.marketingbudgets.bo;

import java.util.HashMap;
import java.util.List;

import com.domgen.marketingbudgets.dao.UnitDAO;
import com.domgen.marketingbudgets.vo.UnitVO;

/**
 * Finance Division
 * 
 * @version	1.0
 * @author 	SIMMR on 11-Jul-2005
 */
public class UnitBO
{

	/**
	 * retrieve finance division details for a division
	 * 
	 * @param client
	 * @return UnitVO
	 */
	public UnitVO getUnit(String unit)
	{
		// reteive finance division details
		UnitDAO unitDao = new UnitDAO();

		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBCODE", unit);

		List results = unitDao.findByCriteria(searchCriteria, null);

		UnitVO unitVo = null;

		for (int i = 0; i < results.size(); i++)
		{
			unitVo = (UnitVO) results.get(i);

		}
		
		return unitVo;
	}

	/**
	 * retrieve finance division details for a division
	 * 
	 * @param client
	 * @return NatureVO
	 */
	public List getUnitDropDownList()
	{
		// reteive finance division details
		UnitDAO unitDao = new UnitDAO();

		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBDISP", "Y");

		HashMap sortCriteria = new HashMap();
		sortCriteria.put("MBCODE", "ASC");

		List results = unitDao.findByCriteria(searchCriteria, sortCriteria);
		return results;
	}

	
	
	/**
	 * retrieve finance division details for a division
	 * 
	 * @param client
	 * @return UnitVO
	 */
	public boolean doesUnitAlreadyExist(String unit)
	{
		boolean success = false;
		// retrieve finance division details
		UnitDAO unitDao = new UnitDAO();

		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBCODE", unit);

		List results = unitDao.findByCriteria(searchCriteria, null);

		if (results.size() > 0)
		{
			success = true;
		}
		
		return success;
	}


}

