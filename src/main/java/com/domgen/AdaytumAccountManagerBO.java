/*
 * Created on 26-Sep-05
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.domgen.marketingbudgets.bo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.domgen.marketingbudgets.dao.AdaytumAccountManagerDAO;
import com.domgen.marketingbudgets.vo.AdaytumAccountManagerVO;

/**
 * @author gatlanm
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */

public class AdaytumAccountManagerBO {
	
	/**
	 * retrieve account Handler/Managers initials
	 * 
	 * @param account Handler/Managers full name OR initial (dependent upon method, paramater 2)
	 * @param method 
	 * @return AdaytumAccountManagerVO
	 */
	
	public AdaytumAccountManagerVO getDetails(String searchString, String method)
	{

		AdaytumAccountManagerDAO adaytumAccountManagerDao = new AdaytumAccountManagerDAO();
		AdaytumAccountManagerVO adaytumAccountManagerVo = new AdaytumAccountManagerVO();
		
		HashMap searchCriteria = new HashMap();
		if(method.equalsIgnoreCase("id"))
		{
			searchCriteria.put("MBURID", searchString);
		}
		else
		{
			searchCriteria.put("MBINIT", searchString);
		}
		
		
		List results = adaytumAccountManagerDao.findByCriteria(searchCriteria, null);
		
		if (results.size()>0)
		{
			adaytumAccountManagerVo = (AdaytumAccountManagerVO) results.get(0);
		}
		
		return adaytumAccountManagerVo;
	
	}
	
	public List getAccountHandlerManagers(String type)
		{

			AdaytumAccountManagerDAO adaytumAccountManagerDao = new AdaytumAccountManagerDAO();
			AdaytumAccountManagerVO adaytumAccountManagerVo = new AdaytumAccountManagerVO();
		
			HashMap searchCriteria = new HashMap();
			if(!type.equalsIgnoreCase("BOTH"))
			{
				searchCriteria.put("MBTYPE", type);
			}	
			
			HashMap sortCriteria = new HashMap();
			sortCriteria.put("MBINIT", "ASC");
		
			List results = adaytumAccountManagerDao.findByCriteria(searchCriteria, sortCriteria);
				
			return results;
	
		}
		
	public List getAccountHandlerManager(String initials, String type)
		{
			AdaytumAccountManagerVO adaytumAccountManagerVo = new AdaytumAccountManagerVO();
			List results = new ArrayList();
			if (initials.equalsIgnoreCase("notSelectable"))
			{
				adaytumAccountManagerVo.setInitials("Not Selectable");
				results.add(adaytumAccountManagerVo);
			}
			else
			{

				AdaytumAccountManagerDAO adaytumAccountManagerDao = new AdaytumAccountManagerDAO();
				HashMap searchCriteria = new HashMap();
				if(!type.equalsIgnoreCase("BOTH"))
				{
					searchCriteria.put("MBTYPE", type);
					searchCriteria.put("MBINIT", initials);
				}	
		
				results = adaytumAccountManagerDao.findByCriteria(searchCriteria, null);
			}
			
			return results;
	
		}


		public int updateAccountHMs(AdaytumAccountManagerVO accountHMVo)
		{

			AdaytumAccountManagerDAO adaytumAccountManagerDao = new AdaytumAccountManagerDAO();
			
		
			// update record
			int noOfRecords = adaytumAccountManagerDao.update(accountHMVo);
			
			if (noOfRecords > 0)
			{
			}
			
			return noOfRecords;
	
		}

		public int createAccountHMs(AdaytumAccountManagerVO accountHMVo)
		{

		AdaytumAccountManagerDAO adaytumAccountManagerDao = new AdaytumAccountManagerDAO();
			
		
		// update record
		int noOfRecords = adaytumAccountManagerDao.insert(accountHMVo);
			
		if (noOfRecords > 0)
		{
		}
			
		return noOfRecords;
	
		}

}
