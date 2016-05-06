package com.domgen.marketingbudgets.bo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.domgen.marketingbudgets.dao.ActionDAO;
import com.domgen.marketingbudgets.dao.ActionEditAuditDAO;
import com.domgen.marketingbudgets.helper.IStatusCodes;
import com.domgen.marketingbudgets.vo.ActionDisplaySeachSortVO;
import com.domgen.marketingbudgets.vo.ActionEditAuditVO;
import com.domgen.marketingbudgets.vo.ActionVO;
import com.domgen.marketingbudgets.vo.AdaytumAccountManagerVO;
/**
 * Finance Division
 * 
 * @version	1.0
 * @author 	SIMMR on 11-Jul-2005
 */
public class ActionBO implements IStatusCodes
{
	//private Logger logger = Logger.getLogger(this.getClass().getName());	
	

	/**
	 * retrieve finance division details for a division
	 * 
	 * @param client
	 * @return NatureVO
	 */
	public ActionVO getMostRecentAction(String accountName)
	{

		//logger.debug("ActionBO.getMostRecentAction start account:" + 
				//accountName);
		ActionDAO actionDAO = new ActionDAO();
		ActionVO actionVo = null;

		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBACCN", accountName);
		
		HashMap sortCriteria = new HashMap();
		sortCriteria.put("MBDATE", "DESC");
		sortCriteria.put("MBTIME", "DESC");

		List results = new ArrayList();
		try
		{
		 actionDAO.findByCriteria(searchCriteria, sortCriteria);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		if (results != null && results.size()>0)
		{
			actionVo = (ActionVO) results.get(0);
		}
		else
		{
			//logger.info("ActionBO.getMostRecentAction results null or empty");
		}
		//logger.debug("ActionBO.getMostRecentAction end");
		return actionVo;
	}
	
	/**
		 * retrieve finance division details for a division
		 * 
		 * @param client
		 * @return NatureVO
		 */
		public List getAction(String key)
		{
			//logger.debug("getAction: key: " + key );
			String[] keys = splitKey(key);
			
			ActionDAO actionDAO = new ActionDAO();
			ActionVO actionVo = new ActionVO();
		
			HashMap searchCriteria = new HashMap();
			searchCriteria.put("MBORIG", keys[0]);
			searchCriteria.put("MBDATE", keys[1]);
			searchCriteria.put("MBTIME", keys[2]);
		

			List results = actionDAO.findByCriteria(searchCriteria, null);
		
			return results;
		}
		
	/**
		 * retrieve finance division details for a division
		 * 
		 * @param client
		 * @return NatureVO
		 */
		public String[] splitKey(String key)
		{
			String[] keys = new String[3];
		
			//key will be in format: Originator.date.time
			int firstDot = key.indexOf(".");
			//logger.debug("firstDot: " + firstDot );
			int SecondDot = key.indexOf(".", firstDot + 1);
			//logger.debug("secondDot: " + SecondDot );
			keys[0] = key.substring(0, firstDot);
			keys[1] = key.substring(firstDot +1 , SecondDot);
			keys[2] = key.substring(SecondDot + 1);
			
			//logger.debug("keys[0]: " + keys[0]);
			//logger.debug("keys[1]: " + keys[1]);
			//logger.debug("keys[2]: " + keys[2]);
			
			return keys;
		}
		
	/**
		 * retrieve finance division details for a division
		 * 
		 * @param client
		 * @return NatureVO
		 */
		public List getActionEditAudits(String key)
		{
			String[] keys = splitKey(key);
			
			ActionEditAuditDAO actionEditAuditDAO = new ActionEditAuditDAO();
			ActionEditAuditVO actionEditAuditVo = new ActionEditAuditVO();
		
			HashMap searchCriteria = new HashMap();
			searchCriteria.put("MBORIG", keys[0]);
			searchCriteria.put("MBORDT", keys[1]);
			searchCriteria.put("MBORTM", keys[2]);
		
			HashMap sortCriteria = new HashMap();
			sortCriteria.put("MBDATE", "DESC");
			sortCriteria.put("MBTIME", "DESC");

			List results = actionEditAuditDAO.findByCriteria(searchCriteria, sortCriteria);
		
			return results;
		}

	
	/**
		 * retrieve finance division details for a division
		 * 
		 * @param client
		 * @return NatureVO
		 */
		public List getActions(String accountName)
		{

			ActionDAO actionDAO = new ActionDAO();
			ActionVO actionVo = new ActionVO();
		
			HashMap searchCriteria = new HashMap();
			searchCriteria.put("MBACCN", accountName);
		
			HashMap sortCriteria = new HashMap();
			sortCriteria.put("MBDATE", "DESC");
			sortCriteria.put("MBTIME", "DESC");

			List results = actionDAO.findByCriteria(searchCriteria, sortCriteria);
		
			return results;
		}
		
	/**
		 * retrieve finance division details for a division
		 * 
		 * @param client
		 * @return NatureVO
		 */
		public boolean updateAction(ActionVO actionVo, HttpSession session, String comments, String status)
		{
			boolean successfulUpdate = false;
			String fullName = (String) session.getAttribute("fullName");
			ActionDAO actionDAO = new ActionDAO();
				
			// update record
			actionVo.setStatus(status);
			
			int noOfRecords = actionDAO.update(actionVo);

			if (noOfRecords > 0)
			{
				successfulUpdate = true;
					
				ActionEditAuditVO actionEditAuditVo = new ActionEditAuditVO();
				actionEditAuditVo.setOriginator(actionVo.getActionOriginator());
				actionEditAuditVo.setOriginalDate(actionVo.getDate());
				actionEditAuditVo.setOriginalTime(actionVo.getTime());
				actionEditAuditVo.setAuthor(fullName);
				actionEditAuditVo.setComments(comments);
				actionEditAuditVo.setStatusUpdate(status);
				DateTimeBO dateTimeBo = new DateTimeBO();
				String[] dateTime = dateTimeBo.getCurrentDateTime();
				actionEditAuditVo.setDate(dateTime[0]);
				actionEditAuditVo.setTime(dateTime[1]);

				createActionEditAudit(actionEditAuditVo);
			}
	
			return successfulUpdate;
		}
		
	/**
			 * retrieve finance division details for a division
			 * 
			 * @param client
			 * @return NatureVO
			 */
			public boolean createActionEditAudit(ActionEditAuditVO actionEditAuditVo)
			{
				boolean successfulUpdate = false;
				
				ActionEditAuditDAO actionEditAuditDao = new ActionEditAuditDAO();
		
				int noOfRecords = actionEditAuditDao.insert(actionEditAuditVo);
			
					if (noOfRecords > 0)
					{
						successfulUpdate = true;
					}
					
				return successfulUpdate;
			}


		
	/**
		 * retrieve actions
		 * 
		 * @param client
		 * @return NatureVO
		 */
		public List getActions(ActionDisplaySeachSortVO actionDisplaySeachSortVo, HttpSession session)
		{
			String userRole = (String) session.getAttribute("role");
			String fullName = (String) session.getAttribute("fullName");
			
			ActionDAO actionDAO = new ActionDAO();
		
			//if Account handler/Manager USER role only make actions assigned to user available
			//if Account handler/Manager MANAGER role make ALL actions available
			
			HashMap searchCriteria = new HashMap();
	
			
			if (userRole.equalsIgnoreCase("AHMUSR"))
			{
				//get x-ref (ie adaytum initals) for user from logon information
				//if user has not been set-up return no data
				AdaytumAccountManagerBO adaytumAccountManagerBo = new AdaytumAccountManagerBO();
				AdaytumAccountManagerVO adaytumAccountManagerVo = new AdaytumAccountManagerVO();
				adaytumAccountManagerVo = adaytumAccountManagerBo.getDetails(fullName, "fullName");
				String accountHandlerManagerInitials = adaytumAccountManagerVo.getInitials();
				
				if (accountHandlerManagerInitials !=null)
				{
					searchCriteria.put("MBOWNR", accountHandlerManagerInitials);
				}
				else
				{
					searchCriteria.put("MBOWNR", "returnNoData"); 
				}
			}
			
			if (!actionDisplaySeachSortVo.getAccountName().equalsIgnoreCase("reset"))
						{searchCriteria.put("MBACCN", actionDisplaySeachSortVo.getAccountName());}
			if (!actionDisplaySeachSortVo.getAccountHandler().equalsIgnoreCase("reset"))
						{searchCriteria.put("MBOWNR", actionDisplaySeachSortVo.getAccountHandler());}
			if (!actionDisplaySeachSortVo.getAccountManager().equalsIgnoreCase("reset"))
						{searchCriteria.put("MBOWNR", actionDisplaySeachSortVo.getAccountManager());}
			if (!actionDisplaySeachSortVo.getStatus().equalsIgnoreCase("reset"))
						{searchCriteria.put("MBSTAT", actionDisplaySeachSortVo.getStatus());}
					
			HashMap sortCriteria = new HashMap();			
			if (!actionDisplaySeachSortVo.getSortBy().equalsIgnoreCase("reset"))
			{
				//logger.debug("SORT: 1");
				sortCriteria.put(actionDisplaySeachSortVo.getSortBy(), "ASC");
			}
			else
			//logger.debug("SORT: 2");
			{
			sortCriteria.put("MBDATE", "DESC");
			sortCriteria.put("MBTIME", "DESC");
			}
			//logger.debug("SORT: " + sortCriteria);
			List results = actionDAO.findByCriteria(searchCriteria, sortCriteria);
			
		
			return results;
		}
	
}

