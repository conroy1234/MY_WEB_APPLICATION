/*
 * Created on 26-Sep-05
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.domgen.marketingbudgets.as;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.domgen.marketingbudgets.bo.ActionBO;
import com.domgen.marketingbudgets.bo.NavBO;
import com.domgen.marketingbudgets.forms.ActionEditForm;
import com.domgen.marketingbudgets.helper.IStatusCodes;
import com.domgen.marketingbudgets.helper.StatusCodesText;
import com.domgen.marketingbudgets.results.ActionEditResults;
import com.domgen.marketingbudgets.results.NavResults;
import com.domgen.marketingbudgets.vo.ActionVO;
/**
 * @author gatlanm
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class ActionEditAS implements IStatusCodes{
	
	/**
	 * process user action
	 * 
	 * @param action
	 */
	public NavResults process(String action, ActionEditForm actionEditForm, HttpSession session)
	{
		NavResults navResults = new NavResults();
		
			if (action.equals("confirm"))
			{
				navResults = confirm(actionEditForm, session);
			}
			if (action.equals("back"))
			{
				navResults = back(actionEditForm, session);
			}
		
			return navResults;
				
	}
	
	
	/**
		 * get relevant data for navigation selected
		 * 
		 * @param action
		 * @param invoiceEntryForm
		 * @param session
		 */
	public void processNav(String action, ActionEditForm actionEditForm, HttpSession session)
		{
	
			NavBO navBo = new NavBO();
			
			if (action.equals("goToActionDisplay"))
			{
				navBo.getActionDisplayData(session);
			}
			if (action.equals("goToInvoiceEntry"))
			{
				navBo.getInvoiceEntryData(session);
			}
			if (action.equals("goToInvoiceEditSelection"))
			{
				navBo.getInvoiceEditSelectionData(session);
			}
			if (action.equals("goToInvoicesSearch"))
			{
				navBo.getInvoicesSearchData(session);
			}
			if (action.equals("goToInvoicesAuthoriseSelection"))
			{
				String role = (String) session.getAttribute("role");
				if (role.equals("UWMGR") || role.equals("UWUSR"))
				{
					navBo.getInvoiceAuthoriseSelectionDataUW(session);
				}
				if (role.equals("SSMGR") || role.equals("SSUSR"))
				{
					navBo.getInvoiceAuthoriseSelectionDataSS(session);
				}
			}			
			if (action.equals("goToInvoicesAuthorised"))
			{
				navBo.getInvoicesAuthorisedData(session);
			}
			if (action.equals("goToMaintenanceAccounts"))
			{
				navBo.getMaintenanceAccountsData(session);
			}
			if (action.equals("goToActionDisplay"))
			{
				navBo.getActionDisplayData(session);
			}
			if (action.equals("goToLogOut"))
			{
				navBo.logOut(session);
			}


		}
	

	
	/**
	 * confirm invoice entry
	 *
	 *@param form
	 */
	public NavResults  confirm(ActionEditForm form, HttpSession session)
	{
		NavResults navResults = (NavResults) session.getAttribute("navResults");

		ActionBO actionBo = new ActionBO();
		ActionEditResults actionEditResults = (ActionEditResults) session.getAttribute("actionEditResults");
		List actionVos =  actionEditResults.getActions();
		ActionVO actionVo =  (ActionVO) actionVos.get(0);
		boolean success = actionBo.updateAction(actionVo, session, form.getComments(), form.getStatus());
		if (success == true)
		{
			//update navResults	with new status for when actions are displayed on Action Display screen
			List actionVo1s = navResults.getActions();
			for (int i = 0; i < actionVo1s.size(); i++)
				{
					ActionVO actionVo1 =  (ActionVO) actionVo1s.get(0);
					if ((actionVo.getActionOriginator().equalsIgnoreCase(actionVo1.getActionOriginator()))
						&&(actionVo.getDate().equalsIgnoreCase(actionVo1.getDate()))
						&&(actionVo.getTime().equalsIgnoreCase(actionVo1.getTime())))
						{
							actionVo1.setStatus(form.getStatus());
							StatusCodesText statusCodesText = new StatusCodesText();
							actionVo1.setStatusText(statusCodesText.getActionStatusCodeText(form.getStatus()));
							navResults.setActions(actionVo1s);	
							break;
						}
						
				}
				
		}
		return navResults;
	}	

	/**
	 * confirm invoice entry
	 *
	 *@param form
	 */
	public NavResults back(ActionEditForm form, HttpSession session)
	{
		NavResults navResults = (NavResults) session.getAttribute("navResults");	
		
		return navResults;
	}	



}
