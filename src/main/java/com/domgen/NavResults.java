package com.domgen.marketingbudgets.results;

import java.util.List;

/**
 * @author gatlanm
 *
 * View Object for navigation to Invoice Edit selection screen
 */
public class NavResults
{
	private List clients;
	private List invoices;
	private List invoicesAll;
	private List invoicesAllByInvNo;
	private List invoicesAllByInvId;

	private List financeDivisions;
	private List purchaseLedgers;
	private List units;
	private List natures;
	private List transactions;
	private List unauthorisedInvoices;
	
	//Invoices Search
	private List accounts;
	private List invoicesSearch;
	private String invoicesSearchCount;
	private String clientNameSel;
	private String accountManagerSel;
	private String accountHandlerSel;
	private String accountNameSel;	
	private String invoicePeriodMMSel;
	private String invoicePeriodYYSel;
	private String invoicePeriodByOptionSel;
	private String invoicePeriodByMMFromSel;
	private String invoicePeriodByYYFromSel;
	private String invoicePeriodByMMToSel;
	private String invoicePeriodByYYToSel;
	private String statusSel;
	private String invoiceNoSel;
	private String invoiceIdSel;
	private String sortBy;
	private String invoiceAuditSel;
	
	//invoice Authorise Selection screen
	private List invoiceAuthoriseSelection;
	private String invoiceAuthoriseSelectionCount;
	private String invoiceIdLineNo;
	private String authorisingType;
	
	//invoice Authorised Selection screen
	private List invoiceAuthorisedSelection;
	private List invoiceValidateInProgress;
	private List invoiceValidateError;
	private String invoiceAuthorisedSelectionCount;
	private String invoiceValidateInProgressCount;
	private String invoiceValidateErrorCount;
//	private String invoiceIdLineNo;				//declared by another display

	//invoice Validated Selection screen
	private List invoiceValidatedSelection;
	private List invoiceTransferInProgress;
	private List invoiceTransferError;
	private String invoiceValidatedSelectionCount;
	private String invoiceTransferInProgressCount;
	private String invoiceTransferErrorCount;
//	private String invoiceIdLineNo;				//declared by another display

	//Account handler/Manager display
	private List actions;
	private List accountManagers;
	private List accountHandlers;
	private String actionsCount;
//	private String statusSel = null;			//declared by another display
//	private String accountManagerSel = null;	//declared by another display
//	private String accountHandlerSel = null;	//declared by another display
//	private String accountNameSel = null;		//declared by another display
//	private String sortBy = null;				//declared by another display

	//Budget Selection display
	private List budgetHeaders;
	
	/**
	 * @return
	 */
	public List getClients() {
		return clients;
	}

	/**
	 * @return
	 */
	public List getInvoices() {
		return invoices;
	}

	/**
	 * @param list
	 */
	public void setClients(List list) {
		clients = list;
	}

	/**
	 * @param list
	 */
	public void setInvoices(List list) {
		invoices = list;
	}

	/**
	 * @return
	 */
	public List getFinanceDivisions() {
		return financeDivisions;
	}

	/**
	 * @return
	 */
	public List getNatures() {
		return natures;
	}

	/**
	 * @return
	 */
	public List getPurchaseLedgers() {
		return purchaseLedgers;
	}

	/**
	 * @return
	 */
	public List getTransactions() {
		return transactions;
	}

	/**
	 * @return
	 */
	public List getUnauthorisedInvoices() {
		return unauthorisedInvoices;
	}

	/**
	 * @return
	 */
	public List getUnits() {
		return units;
	}

	/**
	 * @param list
	 */
	public void setFinanceDivisions(List list) {
		financeDivisions = list;
	}

	/**
	 * @param list
	 */
	public void setNatures(List list) {
		natures = list;
	}

	/**
	 * @param list
	 */
	public void setPurchaseLedgers(List list) {
		purchaseLedgers = list;
	}

	/**
	 * @param list
	 */
	public void setTransactions(List list) {
		transactions = list;
	}

	/**
	 * @param list
	 */
	public void setUnauthorisedInvoices(List list) {
		unauthorisedInvoices = list;
	}

	/**
	 * @param list
	 */
	public void setUnits(List list) {
		units = list;
	}

	/**
	 * @return
	 */
	public List getInvoicesAll() {
		return invoicesAll;
	}

	/**
	 * @param list
	 */
	public void setInvoicesAll(List list) {
		invoicesAll = list;
	}

	/**
	 * @return
	 */
	public List getInvoicesSearch() {
		return invoicesSearch;
	}

	/**
	 * @param list
	 */
	public void setInvoicesSearch(List list) {
		invoicesSearch = list;
	}

	/**
	 * @return
	 */
	public String getInvoicesSearchCount() {
		return invoicesSearchCount;
	}

	/**
	 * @param string
	 */
	public void setInvoicesSearchCount(String string) {
		invoicesSearchCount = string;
	}

	/**
	 * @return
	 */
	public List getActions() {
		return actions;
	}

	/**
	 * @param list
	 */
	public void setActions(List list) {
		actions = list;
	}

	/**
	 * @return
	 */
	public String getActionsCount() {
		return actionsCount;
	}

	/**
	 * @param string
	 */
	public void setActionsCount(String string) {
		actionsCount = string;
	}


	/**
	 * @return
	 */
	public String getInvoicePeriodMMSel() {
		return invoicePeriodMMSel;
	}

	/**
	 * @return
	 */
	public String getInvoicePeriodYYSel() {
		return invoicePeriodYYSel;
	}

	/**
	 * @param string
	 */
	public void setInvoicePeriodMMSel(String string) {
		invoicePeriodMMSel = string;
	}

	/**
	 * @param string
	 */
	public void setInvoicePeriodYYSel(String string) {
		invoicePeriodYYSel = string;
	}

	/**
	 * @return
	 */
	public String getAccountHandlerSel() {
		return accountHandlerSel;
	}

	/**
	 * @return
	 */
	public String getAccountManagerSel() {
		return accountManagerSel;
	}

	/**
	 * @return
	 */
	public String getAccountNameSel() {
		return accountNameSel;
	}

	/**
	 * @return
	 */
	public String getClientNameSel() {
		return clientNameSel;
	}

	/**
	 * @return
	 */
	public String getInvoiceNoSel() {
		return invoiceNoSel;
	}

	/**
	 * @return
	 */
	public String getInvoicePeriodByMMFromSel() {
		return invoicePeriodByMMFromSel;
	}

	/**
	 * @return
	 */
	public String getInvoicePeriodByMMToSel() {
		return invoicePeriodByMMToSel;
	}

	/**
	 * @return
	 */
	public String getInvoicePeriodByOptionSel() {
		return invoicePeriodByOptionSel;
	}

	/**
	 * @return
	 */
	public String getInvoicePeriodByYYFromSel() {
		return invoicePeriodByYYFromSel;
	}

	/**
	 * @return
	 */
	public String getInvoicePeriodByYYToSel() {
		return invoicePeriodByYYToSel;
	}

	/**
	 * @return
	 */
	public String getSortBy() {
		return sortBy;
	}

	/**
	 * @return
	 */
	public String getStatusSel() {
		return statusSel;
	}

	/**
	 * @param string
	 */
	public void setAccountHandlerSel(String string) {
		accountHandlerSel = string;
	}

	/**
	 * @param string
	 */
	public void setAccountManagerSel(String string) {
		accountManagerSel = string;
	}

	/**
	 * @param string
	 */
	public void setAccountNameSel(String string) {
		accountNameSel = string;
	}

	/**
	 * @param string
	 */
	public void setClientNameSel(String string) {
		clientNameSel = string;
	}

	/**
	 * @param string
	 */
	public void setInvoiceNoSel(String string) {
		invoiceNoSel = string;
	}

	/**
	 * @param string
	 */
	public void setInvoicePeriodByMMFromSel(String string) {
		invoicePeriodByMMFromSel = string;
	}

	/**
	 * @param string
	 */
	public void setInvoicePeriodByMMToSel(String string) {
		invoicePeriodByMMToSel = string;
	}

	/**
	 * @param string
	 */
	public void setInvoicePeriodByOptionSel(String string) {
		invoicePeriodByOptionSel = string;
	}

	/**
	 * @param string
	 */
	public void setInvoicePeriodByYYFromSel(String string) {
		invoicePeriodByYYFromSel = string;
	}

	/**
	 * @param string
	 */
	public void setInvoicePeriodByYYToSel(String string) {
		invoicePeriodByYYToSel = string;
	}

	/**
	 * @param string
	 */
	public void setSortBy(String string) {
		sortBy = string;
	}

	/**
	 * @param string
	 */
	public void setStatusSel(String string) {
		statusSel = string;
	}

	/**
	 * @return
	 */
	public String getInvoiceIdSel() {
		return invoiceIdSel;
	}

	/**
	 * @param string
	 */
	public void setInvoiceIdSel(String string) {
		invoiceIdSel = string;
	}

	/**
	 * @return
	 */
	public List getAccountHandlers() {
		return accountHandlers;
	}

	/**
	 * @return
	 */
	public List getAccountManagers() {
		return accountManagers;
	}

	/**
	 * @param list
	 */
	public void setAccountHandlers(List list) {
		accountHandlers = list;
	}

	/**
	 * @param list
	 */
	public void setAccountManagers(List list) {
		accountManagers = list;
	}
	/**
	 * @return
	 */
	public String getInvoiceAuthoriseSelectionCount() {
		return invoiceAuthoriseSelectionCount;
	}

	/**
	 * @param string
	 */
	public void setInvoiceAuthoriseSelectionCount(String string) {
		invoiceAuthoriseSelectionCount = string;
	}

	/**
	 * @return
	 */
	public List getInvoiceAuthoriseSelection() {
		return invoiceAuthoriseSelection;
	}

	/**
	 * @param list
	 */
	public void setInvoiceAuthoriseSelection(List list) {
		invoiceAuthoriseSelection = list;
	}

	/**
	 * @return
	 */
	public String getInvoiceIdLineNo() {
		return invoiceIdLineNo;
	}

	/**
	 * @param string
	 */
	public void setInvoiceIdLineNo(String string) {
		invoiceIdLineNo = string;
	}

	/**
	 * @return
	 */
	public String getAuthorisingType() {
		return authorisingType;
	}

	/**
	 * @param string
	 */
	public void setAuthorisingType(String string) {
		authorisingType = string;
	}

	/**
	 * @return
	 */
	public List getInvoiceAuthorisedSelection() {
		return invoiceAuthorisedSelection;
	}

	/**
	 * @param list
	 */
	public void setInvoiceAuthorisedSelection(List list) {
		invoiceAuthorisedSelection = list;
	}

	/**
	 * @return
	 */
	public List getInvoiceTransferError() {
		return invoiceTransferError;
	}

	/**
	 * @return
	 */
	public List getInvoiceTransferInProgress() {
		return invoiceTransferInProgress;
	}

	/**
	 * @param list
	 */
	public void setInvoiceTransferError(List list) {
		invoiceTransferError = list;
	}

	/**
	 * @param list
	 */
	public void setInvoiceTransferInProgress(List list) {
		invoiceTransferInProgress = list;
	}

	/**
	 * @return
	 */
	public String getInvoiceAuthorisedSelectionCount() {
		return invoiceAuthorisedSelectionCount;
	}

	/**
	 * @return
	 */
	public String getInvoiceTransferErrorCount() {
		return invoiceTransferErrorCount;
	}

	/**
	 * @return
	 */
	public String getInvoiceTransferInProgressCount() {
		return invoiceTransferInProgressCount;
	}

	/**
	 * @param string
	 */
	public void setInvoiceAuthorisedSelectionCount(String string) {
		invoiceAuthorisedSelectionCount = string;
	}

	/**
	 * @param string
	 */
	public void setInvoiceTransferErrorCount(String string) {
		invoiceTransferErrorCount = string;
	}

	/**
	 * @param string
	 */
	public void setInvoiceTransferInProgressCount(String string) {
		invoiceTransferInProgressCount = string;
	}

/**
 * @return
 */
public List getBudgetHeaders() {
	return budgetHeaders;
}

/**
 * @param list
 */
public void setBudgetHeaders(List list) {
	budgetHeaders = list;
}

	/**
	 * @return
	 */
	public String getInvoiceAuditSel() {
		return invoiceAuditSel;
	}

	/**
	 * @param string
	 */
	public void setInvoiceAuditSel(String string) {
		invoiceAuditSel = string;
	}

	/**
	 * @return
	 */
	public List getInvoicesAllByInvId() {
		return invoicesAllByInvId;
	}

	/**
	 * @return
	 */
	public List getInvoicesAllByInvNo() {
		return invoicesAllByInvNo;
	}

	/**
	 * @param list
	 */
	public void setInvoicesAllByInvId(List list) {
		invoicesAllByInvId = list;
	}

	/**
	 * @param list
	 */
	public void setInvoicesAllByInvNo(List list) {
		invoicesAllByInvNo = list;
	}

	/**
	 * @return
	 */
	public List getAccounts() {
		return accounts;
	}

	/**
	 * @param list
	 */
	public void setAccounts(List list) {
		accounts = list;
	}

/**
 * @return
 */
public List getInvoiceValidatedSelection() {
	return invoiceValidatedSelection;
}

	/**
	 * @return
	 */
	public String getInvoiceValidatedSelectionCount() {
		return invoiceValidatedSelectionCount;
	}

	/**
	 * @return
	 */
	public List getInvoiceValidateError() {
		return invoiceValidateError;
	}

	/**
	 * @return
	 */
	public String getInvoiceValidateErrorCount() {
		return invoiceValidateErrorCount;
	}

	/**
	 * @return
	 */
	public List getInvoiceValidateInProgress() {
		return invoiceValidateInProgress;
	}

	/**
	 * @return
	 */
	public String getInvoiceValidateInProgressCount() {
		return invoiceValidateInProgressCount;
	}

/**
 * @param list
 */
public void setInvoiceValidatedSelection(List list) {
	invoiceValidatedSelection = list;
}

	/**
	 * @param string
	 */
	public void setInvoiceValidatedSelectionCount(String string) {
		invoiceValidatedSelectionCount = string;
	}

	/**
	 * @param list
	 */
	public void setInvoiceValidateError(List list) {
		invoiceValidateError = list;
	}

	/**
	 * @param string
	 */
	public void setInvoiceValidateErrorCount(String string) {
		invoiceValidateErrorCount = string;
	}

	/**
	 * @param list
	 */
	public void setInvoiceValidateInProgress(List list) {
		invoiceValidateInProgress = list;
	}

	/**
	 * @param string
	 */
	public void setInvoiceValidateInProgressCount(String string) {
		invoiceValidateInProgressCount = string;
	}

}
