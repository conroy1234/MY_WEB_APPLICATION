/*
 * Created on 02-Sep-05
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.domgen.marketingbudgets.bo;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.domgen.marketingbudgets.dao.BudgetHeaderDAO;
import com.domgen.marketingbudgets.helper.IStatusCodes;
import com.domgen.marketingbudgets.results.NavResults;
import com.domgen.marketingbudgets.vo.ActionDisplaySeachSortVO;
import com.domgen.marketingbudgets.vo.AdaytumAccountManagerVO;
import com.domgen.marketingbudgets.vo.InvoicesSearchSearchSortVO;
/**
 * @author gatlanm
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class NavBO implements IStatusCodes {
	
	//private Log4JLogger logger = logger.getLogger(NavBO.class);	
	
	/**
	 * load drop down list for invoice Entry screen
	 * 
	 * @return display data
	 */
	public void logOut(HttpSession session)
	{		
		// initialise objects
		NavResults navResults = new NavResults();
		if(session.getId() != null)
		{
			session.invalidate();
		}
	}
		/**
		 * load drop down list for invoice Entry screen
		 * 
		 * @return display data
		 */
		public void getInvoiceEntryData(HttpSession session)
		{
			
			// initialise objects
			NavResults navResults = new NavResults();

			// retrieve list of clients
			BudgetHeaderDAO clientDao = new BudgetHeaderDAO();
			List clients = new ArrayList();
			HashMap sortCriteriaClient = new HashMap();	
			sortCriteriaClient.put("MBSMAR", "ASC");
			clients = clientDao.findByCriteria(null, sortCriteriaClient);
			//List clients = clientDao.findByCriteria(null, null);

			// retrieve list of finance divisions
			FinanceDivisionBO financeDivisionBo = new FinanceDivisionBO();
			List financeDivisions = financeDivisionBo.getFinanceDivisionDropDownList();

			// retrieve list of purchase ledgers
			PurchaseLedgerBO purchaseLedgerBo = new PurchaseLedgerBO();
			List purchaseLedgers = purchaseLedgerBo.getPurchaseLedgerDropDownList();	
		
			// retrieve list of units
			UnitBO unitBo = new UnitBO();
			List units = unitBo.getUnitDropDownList();
		 
			// retrieve list of nature
			NatureBO natureBo = new NatureBO();
			List natures = natureBo.getNaturesDropDownList();
		
			// retrieve list of transaction types
			TransactionTypeBO transactionTypeBo = new TransactionTypeBO();
			List transactionTypes = transactionTypeBo.getTransactionTypeDropDownList();
	
			// set up invoice details
			InvoiceBO invoiceBo = new InvoiceBO();
			List invoices = invoiceBo.setUpInvoices();
	
			// add results to value object
			navResults.setClients(clients);
			navResults.setFinanceDivisions(financeDivisions);
			navResults.setPurchaseLedgers(purchaseLedgers);
			navResults.setUnits(units);
			navResults.setNatures(natures);
			navResults.setTransactions(transactionTypes);
			navResults.setInvoices(invoices);

			// add view object to session
			session.setAttribute("navResults", navResults);

			// return results
//			return navResults;
		}
		
		/**
		 * load drop down list for invoice Edit Selection screen
		 * 
		 * @return display data
		 */
		public void getInvoiceEditSelectionData(HttpSession session)
		{
		
			// initialise objects
			NavResults navResults = new NavResults();

			// retrieve list of clients
			BudgetHeaderDAO clientDao = new BudgetHeaderDAO();
			List clients = new ArrayList();
			HashMap sortCriteriaClient = new HashMap();	
			sortCriteriaClient.put("MBSMAR", "ASC");
			clients = clientDao.findByCriteria(null, sortCriteriaClient);
			//List clients = clientDao.findByCriteria(null, null);
					
			InvoiceBO invoiceBo = new InvoiceBO();
		
			// set up invoice details
			List invoices = invoiceBo.getInvoiceEditableInvoicesAllAccounts();
		
			// add results to value object
			navResults.setClients(clients);
			navResults.setInvoices(invoices);
		
			// add view object to session
			session.setAttribute("navResults", navResults);

			// return results
//			return navResults;
		}	
		
		/**
		 * load data for Accounts Maintenance screen
		 * 
		 * @return display data
		 */
		public void getInvoicesSearchData(HttpSession session)
		{
				String role = (String) session.getAttribute("role");
				String userId = (String) session.getAttribute("userId");
				
				// initialise objects
				NavResults navResults = new NavResults();
				AdaytumAccountManagerVO accountHMVo = new AdaytumAccountManagerVO();
				AdaytumAccountManagerBO accountHMBo = new AdaytumAccountManagerBO();
				BudgetHeaderDAO clientDao = new BudgetHeaderDAO();
				List clients = new ArrayList();
				List accounts = new ArrayList();
				List invoicesAllByInvNo = new ArrayList();
				List invoicesAllByInvId = new ArrayList();
				InvoiceBO invoiceBo = new InvoiceBO();
				String userType = "";
				String userInitials = "";
					
				// get drop down list data for account names
				// get drop down list data for client names
				// get drop down list data for invoice numbers
				// get drop down list data for invoice ids
		
				if (role.equalsIgnoreCase("AHMUSR"))
				{
					accountHMVo = accountHMBo.getDetails(userId, "id");
		
					if (accountHMVo.getType() != null)
					{
						userType = accountHMVo.getType();
						userInitials = accountHMVo.getInitials();
					}

					clients = getAccountNameDropDownData(role, userInitials, userType);
					accounts = getAccountNameDropDownData(role, userInitials, userType);

					//invoicesAll = invoiceBo.getAllInvoicesAHMUSR(role, userInitials, userType);
					invoicesAllByInvNo = invoiceBo.getInvoiceNumbersAHMUSR(role, userInitials, userType, "MBIVNO");
					invoicesAllByInvId = invoiceBo.getInvoiceIdsAHMUSR(role, userInitials, userType, "MBIVID");
				}
				else
				{
					HashMap sortCriteriaClient = new HashMap();	
					sortCriteriaClient.put("MBSMAR", "ASC");
					clients = clientDao.findByCriteria(null, sortCriteriaClient);
					HashMap sortCriteriaAccount = new HashMap();	
					sortCriteriaAccount.put("MBACCN", "ASC");
					accounts = clientDao.findByCriteria(null, sortCriteriaAccount);
					invoicesAllByInvNo = invoiceBo.getInvoiceNumbers();
					invoicesAllByInvId = invoiceBo.getInvoiceIds();
				}

				List accountHandlers = getAccountHandlersDropDownData(role, userInitials, userType);
				List accountManagers = getAccountManagersDropDownData(role, userInitials, userType);

				// get default selection of invoices for users role
					
				String currentMonth = (String) session.getAttribute("currentMonth"); 
				String currentYear = (String) session.getAttribute("currentYear"); 
					
				InvoicesSearchSearchSortVO invoicesSearchSearchSortVO = new InvoicesSearchSearchSortVO();
				invoicesSearchSearchSortVO.setAccountName("reset");
				invoicesSearchSearchSortVO.setAccountHandler("reset");
				invoicesSearchSearchSortVO.setAccountManager("reset");
				if (role.equalsIgnoreCase("AHMUSR"))
				{
					if(userType.equalsIgnoreCase("AH"))
					{
						invoicesSearchSearchSortVO.setAccountHandler(userInitials);
					}
					else if(userType.equalsIgnoreCase("AM"))
					{
						invoicesSearchSearchSortVO.setAccountManager(userInitials);
					}
					else
					{
						invoicesSearchSearchSortVO.setAccountHandler("returnNoData");
						invoicesSearchSearchSortVO.setAccountManager("returnNoData");
					}
				}
				invoicesSearchSearchSortVO.setInvoicePeriod("reset");
				invoicesSearchSearchSortVO.setInvoicePeriodMM(currentMonth);
				invoicesSearchSearchSortVO.setInvoicePeriodYY(currentYear);
				invoicesSearchSearchSortVO.setInvoicePeriodByMMFrom("reset");
				invoicesSearchSearchSortVO.setInvoicePeriodByMMTo("reset");
				invoicesSearchSearchSortVO.setInvoicePeriodByYYFrom("reset");
				invoicesSearchSearchSortVO.setInvoicePeriodByYYTo("reset");
				invoicesSearchSearchSortVO.setStatus("reset");
				invoicesSearchSearchSortVO.setInvoiceId("reset");
				invoicesSearchSearchSortVO.setInvoiceNo("reset");
				invoicesSearchSearchSortVO.setSortBy("reset");
				
				List invoicesSearch = invoiceBo.getSearchInvoices(invoicesSearchSearchSortVO, "ALL", session);

				// add results to value object
				navResults.setClients(clients);
				navResults.setAccounts(accounts);
				navResults.setAccountHandlers(accountHandlers);
				navResults.setAccountManagers(accountManagers);
				navResults.setInvoicesAllByInvNo(invoicesAllByInvNo);
				navResults.setInvoicesAllByInvId(invoicesAllByInvId);
				navResults.setInvoicesSearch(invoicesSearch);
				navResults.setInvoicesSearchCount(Integer.toString(invoicesSearch.size()));
				navResults.setAccountNameSel(invoicesSearchSearchSortVO.getAccountName());
				navResults.setClientNameSel(invoicesSearchSearchSortVO.getAccountName());
				navResults.setAccountHandlerSel(invoicesSearchSearchSortVO.getAccountHandler());
				navResults.setAccountManagerSel(invoicesSearchSearchSortVO.getAccountManager());
				navResults.setInvoicePeriodByOptionSel(invoicesSearchSearchSortVO.getInvoicePeriod());
				navResults.setInvoicePeriodMMSel(invoicesSearchSearchSortVO.getInvoicePeriodMM());
				navResults.setInvoicePeriodYYSel(invoicesSearchSearchSortVO.getInvoicePeriodYY());
				navResults.setInvoicePeriodByMMFromSel(invoicesSearchSearchSortVO.getInvoicePeriodByMMFrom());
				navResults.setInvoicePeriodByMMToSel(invoicesSearchSearchSortVO.getInvoicePeriodByMMTo());
				navResults.setInvoicePeriodByYYFromSel(invoicesSearchSearchSortVO.getInvoicePeriodByYYFrom());
				navResults.setInvoicePeriodByYYToSel(invoicesSearchSearchSortVO.getInvoicePeriodByYYTo());
				navResults.setStatusSel(invoicesSearchSearchSortVO.getStatus());
				navResults.setInvoiceIdSel(invoicesSearchSearchSortVO.getInvoiceId());
				navResults.setInvoiceNoSel(invoicesSearchSearchSortVO.getInvoiceNo());
				navResults.setSortBy(invoicesSearchSearchSortVO.getSortBy());						 			
				
				// add view object to session
				session.setAttribute("navResults", navResults);

		}

		/**
		 * load data for Accounts Maintenance screen
		 * 
		 * @return display data
		 */
		public void getInvoicesAuthorisedData(HttpSession session)
		{
					// initialise objects
					NavResults navResults = new NavResults();
					AdaytumAccountManagerVO accountHMVo = new AdaytumAccountManagerVO();
					AdaytumAccountManagerBO accountHMBo = new AdaytumAccountManagerBO();
					BudgetHeaderDAO clientDao = new BudgetHeaderDAO();
					InvoiceBO invoiceBo = new InvoiceBO();
					List invoicesAllByInvNo = new ArrayList();
					List invoicesAllByInvId = new ArrayList();
					// get drop down list data for account names
					// get drop down list data for client names
					// get drop down list data for invoice numbers
					// get drop down list data for invoice ids

					List clients = new ArrayList();
					List accounts = new ArrayList();
					HashMap sortCriteriaClient = new HashMap();	
					sortCriteriaClient.put("MBSMAR", "ASC");
					clients = clientDao.findByCriteria(null, sortCriteriaClient);
					HashMap sortCriteriaAccount = new HashMap();	
					sortCriteriaAccount.put("MBACCN", "ASC");
					accounts = clientDao.findByCriteria(null, sortCriteriaAccount);
					invoicesAllByInvNo = invoiceBo.getInvoiceNumbers();
					invoicesAllByInvId = invoiceBo.getInvoiceIds();		
					InvoicesSearchSearchSortVO invoicesSearchSearchSortVO = new InvoicesSearchSearchSortVO();
					invoicesSearchSearchSortVO.setAccountName("reset");
					invoicesSearchSearchSortVO.setAccountHandler("reset");
					invoicesSearchSearchSortVO.setAccountManager("reset");
					invoicesSearchSearchSortVO.setInvoicePeriod("reset");
					invoicesSearchSearchSortVO.setInvoicePeriodMM("reset");
					invoicesSearchSearchSortVO.setInvoicePeriodYY("reset");
					invoicesSearchSearchSortVO.setInvoicePeriodByMMFrom("reset");
					invoicesSearchSearchSortVO.setInvoicePeriodByMMTo("reset");
					invoicesSearchSearchSortVO.setInvoicePeriodByYYFrom("reset");
					invoicesSearchSearchSortVO.setInvoicePeriodByYYTo("reset");
					invoicesSearchSearchSortVO.setStatus(INVOICE_STATUS_SS_AUTHORISED);
					invoicesSearchSearchSortVO.setInvoiceId("reset");
					invoicesSearchSearchSortVO.setInvoiceNo("reset");
					invoicesSearchSearchSortVO.setSortBy("reset");

					List invoicesSearch = new ArrayList();
					List invoicesValidateInProgress = new ArrayList();
					List invoicesValidateError = new ArrayList();
		
					invoicesSearch = invoiceBo.getSearchInvoices(invoicesSearchSearchSortVO, "ALL", session);
					invoicesValidateInProgress = invoiceBo.getInvoicesValidateInProgress();
					invoicesValidateError = invoiceBo.getInvoicesValidateError();

					// add results to value object
					navResults.setClients(clients);
					navResults.setAccounts(accounts);
					navResults.setInvoicesAllByInvNo(invoicesAllByInvNo);
					navResults.setInvoicesAllByInvId(invoicesAllByInvId);
					navResults.setInvoiceAuthorisedSelection(invoicesSearch);
					navResults.setInvoiceAuthorisedSelectionCount(Integer.toString(invoicesSearch.size()));
					navResults.setInvoiceValidateInProgress(invoicesValidateInProgress);
					navResults.setInvoiceValidateInProgressCount(Integer.toString(invoicesValidateInProgress.size()));
					navResults.setInvoiceValidateError(invoicesValidateError);
					navResults.setInvoiceValidateErrorCount(Integer.toString(invoicesValidateError.size()));
					navResults.setAccountNameSel(invoicesSearchSearchSortVO.getAccountName());
					navResults.setClientNameSel(invoicesSearchSearchSortVO.getAccountName());
					navResults.setInvoicePeriodByOptionSel(invoicesSearchSearchSortVO.getInvoicePeriod());
					navResults.setInvoicePeriodMMSel(invoicesSearchSearchSortVO.getInvoicePeriodMM());
					navResults.setInvoicePeriodYYSel(invoicesSearchSearchSortVO.getInvoicePeriodYY());
					navResults.setInvoicePeriodByMMFromSel(invoicesSearchSearchSortVO.getInvoicePeriodByMMFrom());
					navResults.setInvoicePeriodByMMToSel(invoicesSearchSearchSortVO.getInvoicePeriodByMMTo());
					navResults.setInvoicePeriodByYYFromSel(invoicesSearchSearchSortVO.getInvoicePeriodByYYFrom());
					navResults.setInvoicePeriodByYYToSel(invoicesSearchSearchSortVO.getInvoicePeriodByYYTo());
					navResults.setStatusSel(invoicesSearchSearchSortVO.getStatus());
					navResults.setInvoiceIdSel(invoicesSearchSearchSortVO.getInvoiceId());
					navResults.setInvoiceNoSel(invoicesSearchSearchSortVO.getInvoiceNo());
					navResults.setSortBy(invoicesSearchSearchSortVO.getSortBy());						 			
					//logger.debug("getInvoicesAuthorisedData end, navResults in session next clients/accounts/invoicesByInvNo:" +
					//		clients.size() + "/" + accounts.size() + "/" + invoicesAllByInvNo.size());
				// add view object to session
				session.setAttribute("navResults", navResults);
		}
		
	/**
	 * load data for Accounts Maintenance screen
	 * 
	 * @return display data
	 */
	public void getInvoicesValidatedData(HttpSession session)
	{
				// initialise objects
				NavResults navResults = new NavResults();
				AdaytumAccountManagerVO accountHMVo = new AdaytumAccountManagerVO();
				AdaytumAccountManagerBO accountHMBo = new AdaytumAccountManagerBO();
				BudgetHeaderDAO clientDao = new BudgetHeaderDAO();
				InvoiceBO invoiceBo = new InvoiceBO();
				List invoicesAllByInvNo = new ArrayList();
				List invoicesAllByInvId = new ArrayList();
				// get drop down list data for account names
				// get drop down list data for client names
				// get drop down list data for invoice numbers
				// get drop down list data for invoice ids

				List clients = new ArrayList();
				List accounts = new ArrayList();
				HashMap sortCriteriaClient = new HashMap();	
				sortCriteriaClient.put("MBSMAR", "ASC");
				clients = clientDao.findByCriteria(null, sortCriteriaClient);
				HashMap sortCriteriaAccount = new HashMap();	
				sortCriteriaAccount.put("MBACCN", "ASC");
				accounts = clientDao.findByCriteria(null, sortCriteriaAccount);
				invoicesAllByInvNo = invoiceBo.getInvoiceNumbers();
				invoicesAllByInvId = invoiceBo.getInvoiceIds();		
				InvoicesSearchSearchSortVO invoicesSearchSearchSortVO = new InvoicesSearchSearchSortVO();
				invoicesSearchSearchSortVO.setAccountName("reset");
				invoicesSearchSearchSortVO.setAccountHandler("reset");
				invoicesSearchSearchSortVO.setAccountManager("reset");
				invoicesSearchSearchSortVO.setInvoicePeriod("reset");
				invoicesSearchSearchSortVO.setInvoicePeriodMM("reset");
				invoicesSearchSearchSortVO.setInvoicePeriodYY("reset");
				invoicesSearchSearchSortVO.setInvoicePeriodByMMFrom("reset");
				invoicesSearchSearchSortVO.setInvoicePeriodByMMTo("reset");
				invoicesSearchSearchSortVO.setInvoicePeriodByYYFrom("reset");
				invoicesSearchSearchSortVO.setInvoicePeriodByYYTo("reset");
				invoicesSearchSearchSortVO.setStatus(INVOICE_STATUS_VALIDATION_COMPLETE);
				invoicesSearchSearchSortVO.setInvoiceId("reset");
				invoicesSearchSearchSortVO.setInvoiceNo("reset");
				invoicesSearchSearchSortVO.setSortBy("reset");

				List invoicesSearch = new ArrayList();
				List invoicesTransferInProgress = new ArrayList();
				List invoicesTransferError = new ArrayList();
		
				invoicesSearch = invoiceBo.getSearchInvoices(invoicesSearchSearchSortVO, "ALL", session);
				invoicesTransferInProgress = invoiceBo.getInvoicesTransferInProgress();
				invoicesTransferError = invoiceBo.getInvoicesTransferError();
				// add results to value object
				navResults.setClients(clients);
				navResults.setAccounts(accounts);
				navResults.setInvoicesAllByInvNo(invoicesAllByInvNo);
				navResults.setInvoicesAllByInvId(invoicesAllByInvId);
				navResults.setInvoiceValidatedSelection(invoicesSearch);
				navResults.setInvoiceValidatedSelectionCount(Integer.toString(invoicesSearch.size()));
				navResults.setInvoiceTransferInProgress(invoicesTransferInProgress);
				navResults.setInvoiceTransferInProgressCount(Integer.toString(invoicesTransferInProgress.size()));
				navResults.setInvoiceTransferError(invoicesTransferError);
				navResults.setInvoiceTransferErrorCount(Integer.toString(invoicesTransferError.size()));
				navResults.setAccountNameSel(invoicesSearchSearchSortVO.getAccountName());
				navResults.setClientNameSel(invoicesSearchSearchSortVO.getAccountName());
				navResults.setInvoicePeriodByOptionSel(invoicesSearchSearchSortVO.getInvoicePeriod());
				navResults.setInvoicePeriodMMSel(invoicesSearchSearchSortVO.getInvoicePeriodMM());
				navResults.setInvoicePeriodYYSel(invoicesSearchSearchSortVO.getInvoicePeriodYY());
				navResults.setInvoicePeriodByMMFromSel(invoicesSearchSearchSortVO.getInvoicePeriodByMMFrom());
				navResults.setInvoicePeriodByMMToSel(invoicesSearchSearchSortVO.getInvoicePeriodByMMTo());
				navResults.setInvoicePeriodByYYFromSel(invoicesSearchSearchSortVO.getInvoicePeriodByYYFrom());
				navResults.setInvoicePeriodByYYToSel(invoicesSearchSearchSortVO.getInvoicePeriodByYYTo());
				navResults.setStatusSel(invoicesSearchSearchSortVO.getStatus());
				navResults.setInvoiceIdSel(invoicesSearchSearchSortVO.getInvoiceId());
				navResults.setInvoiceNoSel(invoicesSearchSearchSortVO.getInvoiceNo());
				navResults.setSortBy(invoicesSearchSearchSortVO.getSortBy());						 			
					
			// add view object to session
			session.setAttribute("navResults", navResults);
	}
		
		
		/**
		 * load data for Accounts Maintenance screen
		 * 
		 * @return display data
		 */
		public void getMaintenanceAccountsData(HttpSession session)
		{
		
			// initialise objects
			NavResults navResults = new NavResults();

			// add view object to session
			session.setAttribute("navResults", navResults);

		}
		
	/**
		 * load data for Accounts Maintenance screen
		 * 
		 * @return display data
		 */
		public void getMaintenanceSSData(HttpSession session)
		{
		
			// initialise objects
			NavResults navResults = new NavResults();
				
			// add view object to session
			session.setAttribute("navResults", navResults);

		}


	/**
		 * load data for Accounts Maintenance screen
		 * 
		 * @return display data
		 */
		public void getActionDisplayData(HttpSession session)
		{

			// initialise objects
			NavResults navResults = new NavResults();
			BudgetHeaderDAO clientDao = new BudgetHeaderDAO();
			AdaytumAccountManagerVO accountHMVo = new AdaytumAccountManagerVO();
			AdaytumAccountManagerBO accountHMBo = new AdaytumAccountManagerBO();
			HashMap searchCriteriaClient = new HashMap();			
			String role = (String) session.getAttribute("role");
			String userId = (String) session.getAttribute("userId");
			
			// get AH/AM initials
			String userType = "";
			String userInitials = "";

			if (role.equalsIgnoreCase("AHMUSR"))
			{
				accountHMVo = accountHMBo.getDetails(userId, "id");

				if (accountHMVo.getType() != null)
				{
					userType = accountHMVo.getType();
					userInitials = accountHMVo.getInitials();
				}
			
			}

			List clients = getAccountNameDropDownData(role, userInitials, userType);
			List accountHandlers = getAccountHandlersDropDownData(role, userInitials, userType);
			List accountManagers = getAccountManagersDropDownData(role, userInitials, userType);

			//set-up default selection criteria		
			ActionDisplaySeachSortVO actionDisplaySeachSortVo = new ActionDisplaySeachSortVO();
			actionDisplaySeachSortVo.setAccountName("reset");
			if (userType.equalsIgnoreCase("AH"))
			{
				actionDisplaySeachSortVo.setAccountHandler(userInitials);
			}
			else
			{
				actionDisplaySeachSortVo.setAccountHandler("reset");
			}
			if (userType.equalsIgnoreCase("AM"))
			{
				actionDisplaySeachSortVo.setAccountManager(userInitials);
			}
			else
			{
				actionDisplaySeachSortVo.setAccountManager("reset");
			}
			String searchString = "<>" + ACTION_COMPLETED;
			actionDisplaySeachSortVo.setStatus(searchString);
			actionDisplaySeachSortVo.setSortBy("reset");

			ActionBO actionBo =  new ActionBO();
			List results = actionBo.getActions(actionDisplaySeachSortVo, session);
			
			navResults.setClients(clients);
			navResults.setAccountHandlers(accountHandlers);
			navResults.setAccountManagers(accountManagers);
			navResults.setActions(results);
			navResults.setActionsCount(Integer.toString(results.size()));
			navResults.setAccountNameSel(actionDisplaySeachSortVo.getAccountName());
			navResults.setClientNameSel(actionDisplaySeachSortVo.getAccountName());
			navResults.setAccountHandlerSel(actionDisplaySeachSortVo.getAccountHandler());
			navResults.setAccountManagerSel(actionDisplaySeachSortVo.getAccountManager());
			navResults.setStatusSel(actionDisplaySeachSortVo.getStatus());

			// add view object to session
			session.setAttribute("navResults", navResults);

		}
		
	/**
		 * load data for Accounts Maintenance screen
		 * 
		 * @return display data
		 */
		public List getAccountNameDropDownData(String role, String userInitials, String userType)
		{
			BudgetHeaderDAO clientDao = new BudgetHeaderDAO();
			HashMap searchCriteriaClient = new HashMap();			
			List clients = new ArrayList();
			if (role.equalsIgnoreCase("AHMUSR"))
				{			
					//determine if user is an AH or AM
					if (userType.equalsIgnoreCase("AH"))
					{
						searchCriteriaClient.put("MBACCH", userInitials);
					}
					else if (userType.equalsIgnoreCase("AM"))
					{
						searchCriteriaClient.put("MBACCM", userInitials);
					}
					else
					{
						searchCriteriaClient.put("MBACCM", "returnNothing");

					}
					clients = clientDao.findByCriteria(searchCriteriaClient, null);			
				}
				else
				{	
					clients = clientDao.findByCriteria(null, null);
				}
			return clients;
		}
		
		/**
		 * load data for Accounts Maintenance screen
		 * 
		 * @return display data
		 */
		public List getAccountHandlersDropDownData(String role, String userInitials, String userType)
		{	
			List accountHandlers = new ArrayList();
			AdaytumAccountManagerBO accountHMBo = new AdaytumAccountManagerBO();

			if (role.equalsIgnoreCase("AHMUSR"))
				{			
					//determine if user is an AH or AM
				
					if (userType.equalsIgnoreCase("AH"))
					{
						accountHandlers = accountHMBo.getAccountHandlerManager(userInitials, "AH");
					}
					else
					{
						accountHandlers = accountHMBo.getAccountHandlerManager("notSelectable", "AH");
					}
				}
				else
				{	
					accountHandlers = accountHMBo.getAccountHandlerManagers("AH");
				}
			return accountHandlers;

		}
		/**
		 * load data for Accounts Maintenance screen
		 * 
		 * @return display data
		 */
		public List getAccountManagersDropDownData(String role, String userInitials, String userType)
		{	
			List accountManagers = new ArrayList();
			AdaytumAccountManagerBO accountHMBo = new AdaytumAccountManagerBO();

			if (role.equalsIgnoreCase("AHMUSR"))
				{			
					//determine if user is an AH or AM
				
					if (userType.equalsIgnoreCase("AH"))
					{
						accountManagers = accountHMBo.getAccountHandlerManager("notSelectable", "AM");
					}
					else
					{
						accountManagers = accountHMBo.getAccountHandlerManager("notSelectable", "AM");
					}
				}
				else
				{	
					accountManagers = accountHMBo.getAccountHandlerManagers("AM");
				}
			return accountManagers;

		}

		/**
		 * load data for Accounts Maintenance screen
		 * 
		 * @return display data
		 */
		public void getInvoiceAuthoriseSelectionDataUW(HttpSession session)
		{
			// initialise objects
			NavResults navResults = new NavResults();
			//logger.debug("NavBO.getInvoiceAuthoriseSelectionDataUW +++ start with role UW");
			navResults = getInvoiceAuthoriseSelectionData(session, "UW");
			//logger.debug("NavBO.getInvoiceAuthoriseSelectionDataUW +++ end with role UW");
			// add view object to session
			session.setAttribute("navResults", navResults);
	
		}
	
		/**
		 * load data for Accounts Maintenance screen
		 * 
		 * @return display data
		 */
		public void getInvoiceAuthoriseSelectionDataSS(HttpSession session)
		{
			// initialise objects
			NavResults navResults = new NavResults();
			navResults = getInvoiceAuthoriseSelectionData(session, "SS");
			
			// add view object to session
			session.setAttribute("navResults", navResults);
		}

		/**
		 * load data for Accounts Maintenance screen
		 * 
		 * @return display data
		 */
		public NavResults getInvoiceAuthoriseSelectionData(HttpSession session, String authorisingType)
		{
				String role = (String) session.getAttribute("role");
				String userId = (String) session.getAttribute("userId");
				//logger.debug("NavBO.getInvoiceAuthoriseSelectionData start with role/user:" +
						//role + "/" + userId);
				// initialise objects
				NavResults navResults = new NavResults();
				AdaytumAccountManagerVO accountHMVo = new AdaytumAccountManagerVO();
				AdaytumAccountManagerBO accountHMBo = new AdaytumAccountManagerBO();
				BudgetHeaderDAO clientDao = new BudgetHeaderDAO();
				InvoiceBO invoiceBo = new InvoiceBO();
				List invoicesAllByInvNo = new ArrayList();
				List invoicesAllByInvId = new ArrayList();
				List accounts = new ArrayList();
				List clients = new ArrayList();
				// get drop down list data for account names
				// get drop down list data for client names
				// get drop down list data for invoice numbers
				// get drop down list data for invoice ids
				//logger.debug("NavBO.getInvoiceAuthoriseSelectionData BB");
				HashMap sortCriteriaClient = new HashMap();	
				sortCriteriaClient.put("MBSMAR", "ASC");
				clients = clientDao.findByCriteria(null, sortCriteriaClient);
				
				//logger.debug("NavBO.getInvoiceAuthoriseSelectionData clients size:" + clients.size());
				
				HashMap sortCriteriaAccount = new HashMap();	
				sortCriteriaAccount.put("MBACCN", "ASC");
				accounts = clientDao.findByCriteria(null, sortCriteriaAccount);
				
				//logger.debug("NavBO.getInvoiceAuthoriseSelectionData accounts size:" + accounts.size());
				
				//logger.debug("NavBO.getInvoiceAuthoriseSelectionData invoiceBO.getInvoiceNumbers:");
				
				invoicesAllByInvNo = invoiceBo.getInvoiceNumbers();
				
				if (invoicesAllByInvNo != null)
				{
					//logger.debug("NavBO.getInvoiceAuthoriseSelectionData invoicesAllByInvNo size:" +
						//	invoicesAllByInvNo.size());
				}
				else
				{
					//logger.debug("NavBO.getInvoiceAuthoriseSelectionData invoicesAllByInvNo NULL");
				}
				
				invoicesAllByInvId = invoiceBo.getInvoiceIds();
				if (invoicesAllByInvId != null)
				{
					//logger.debug("NavBO.getInvoiceAuthoriseSelectionData invoicesAllByInvId size:" +
						//	invoicesAllByInvNo.size());
				}
				else
				{
					//logger.debug("NavBO.getInvoiceAuthoriseSelectionData invoicesAllByInvId NULL");
				}
				
				//invoicesAllByInvNo = invoiceBo.getInvoiceNumbers();
				//invoicesAllByInvId = invoiceBo.getInvoiceIds();
				
				//logger.debug("NavBO.getInvoiceAuthoriseSelectionData AA");
				
				// get default selection of invoices for users role	
				String currentMonth = (String) session.getAttribute("currentMonth"); 
				String currentYear = (String) session.getAttribute("currentYear"); 
	
				//logger.debug("NavBO.getInvoiceAuthoriseSelectionData AA2");
				
				InvoicesSearchSearchSortVO invoicesSearchSearchSortVO = new InvoicesSearchSearchSortVO();
				invoicesSearchSearchSortVO.setAccountName("reset");
				invoicesSearchSearchSortVO.setAccountHandler("reset");
				invoicesSearchSearchSortVO.setAccountManager("reset");
				
				//logger.debug("NavBO.getInvoiceAuthoriseSelectionData AA3");
				
				//create default slection of all invocies up to & including current month
				invoicesSearchSearchSortVO.setInvoicePeriod("<=CM");
				invoicesSearchSearchSortVO.setInvoicePeriodMM("reset");
				invoicesSearchSearchSortVO.setInvoicePeriodYY("reset");
				invoicesSearchSearchSortVO.setInvoicePeriodByMMFrom("reset");
				invoicesSearchSearchSortVO.setInvoicePeriodByMMTo("reset");
				invoicesSearchSearchSortVO.setInvoicePeriodByYYFrom("reset");
				invoicesSearchSearchSortVO.setInvoicePeriodByYYTo("reset");
				
				//logger.debug("NavBO.getInvoiceAuthoriseSelectionData AA4");
				
				String searchString = "<>" + INVOICE_STATUS_SS_REJECTION;
				invoicesSearchSearchSortVO.setStatus(searchString);
				invoicesSearchSearchSortVO.setInvoiceId("reset");
				invoicesSearchSearchSortVO.setInvoiceNo("reset");
				invoicesSearchSearchSortVO.setSortBy("MBIPYM");
				//----
				//logger.debug("NavBO.getInvoiceAuthoriseSelectionData BEFORE getSearchInvoices" );
		
				List invoicesSearch = invoiceBo.getSearchInvoices(invoicesSearchSearchSortVO, authorisingType, session);
				
				//logger.debug("NavBO.getInvoiceAuthoriseSelectionData AFTER getSearchInvoices, amount:" +
						//invoicesSearch.size());
				//----
				// add results to value object
				navResults.setAuthorisingType(authorisingType);
				navResults.setClients(clients);
				navResults.setAccounts(accounts);
				navResults.setInvoicesAllByInvNo(invoicesAllByInvNo);
				navResults.setInvoicesAllByInvId(invoicesAllByInvId);
				navResults.setInvoiceAuthoriseSelection(invoicesSearch);
				
				//logger.debug("NavBO.getInvoiceAuthoriseSelectionData AA5");
				
				navResults.setInvoiceAuthoriseSelectionCount(Integer.toString(invoicesSearch.size()));
				navResults.setAccountNameSel(invoicesSearchSearchSortVO.getAccountName());
				navResults.setClientNameSel(invoicesSearchSearchSortVO.getAccountName());
				navResults.setInvoicePeriodByOptionSel(invoicesSearchSearchSortVO.getInvoicePeriod());
				navResults.setInvoicePeriodMMSel(invoicesSearchSearchSortVO.getInvoicePeriodMM());
				navResults.setInvoicePeriodYYSel(invoicesSearchSearchSortVO.getInvoicePeriodYY());
				navResults.setInvoicePeriodByMMFromSel(invoicesSearchSearchSortVO.getInvoicePeriodByMMFrom());
				navResults.setInvoicePeriodByMMToSel(invoicesSearchSearchSortVO.getInvoicePeriodByMMTo());
				navResults.setInvoicePeriodByYYFromSel(invoicesSearchSearchSortVO.getInvoicePeriodByYYFrom());
				navResults.setInvoicePeriodByYYToSel(invoicesSearchSearchSortVO.getInvoicePeriodByYYTo());
				navResults.setStatusSel("reset");
				navResults.setInvoiceIdSel(invoicesSearchSearchSortVO.getInvoiceId());
				navResults.setInvoiceNoSel(invoicesSearchSearchSortVO.getInvoiceNo());
				navResults.setSortBy(invoicesSearchSearchSortVO.getSortBy());	
				
				
				//logger.debug("NavBO.getInvoiceAuthoriseSelectionData end");
				
				// return results
				return navResults;
		}
		
		/**
		 * load data for Accounts Maintenance screen
		 * 
		 * @return display data
		 */
		public void getBudgets(HttpSession session)
		{
				// initialise objects
				NavResults navResults = new NavResults();
				BudgetHeaderBO budgetHeaderBo = new BudgetHeaderBO();
				List budgetHeaders = new ArrayList();		
				
				budgetHeaders = budgetHeaderBo.getBudgetHeaders();
				
				// add results to value object
				navResults.setBudgetHeaders(budgetHeaders);
							
				// add view object to session
				session.setAttribute("navResults", navResults);
		}


}

