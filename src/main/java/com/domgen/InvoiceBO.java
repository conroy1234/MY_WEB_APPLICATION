package com.domgen.marketingbudgets.bo;

import java.io.IOException;
import java.math.BigDecimal;
import java.net.UnknownHostException;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionErrors;

import com.domgen.marketingbudgets.beans.ConfigPropertiesMgr;
import com.domgen.marketingbudgets.beans.IConstants;
import com.domgen.marketingbudgets.dao.InvoiceBudgetAllBudgetLinesDAO;
import com.domgen.marketingbudgets.dao.InvoiceBudgetBudgetLinesExcAdjDAO;
import com.domgen.marketingbudgets.dao.InvoiceBudgetDAO;
import com.domgen.marketingbudgets.dao.InvoiceBudgetSsDAO;
import com.domgen.marketingbudgets.dao.InvoiceBudgetUnsubmittedDAO;
import com.domgen.marketingbudgets.dao.InvoiceBudgetUwDAO;
import com.domgen.marketingbudgets.dao.InvoiceHeader1DAO;
import com.domgen.marketingbudgets.dao.InvoiceHeaderDAO;
import com.domgen.marketingbudgets.dao.InvoiceLine1DAO;
import com.domgen.marketingbudgets.dao.InvoiceLineDAO;
import com.domgen.marketingbudgets.dao.UnauthorisedInvoicesDAO;
import com.domgen.marketingbudgets.forms.InvoiceBaseForm;
import com.domgen.marketingbudgets.forms.InvoiceEditForm;
import com.domgen.marketingbudgets.forms.InvoiceEntryForm;
import com.domgen.marketingbudgets.helper.IStatusCodes;
import com.domgen.marketingbudgets.helper.StatusCodesText;
import com.domgen.marketingbudgets.procedure.IncrementNextInvoiceIdProcedureDAO;
import com.domgen.marketingbudgets.results.InvoiceResults;
import com.domgen.marketingbudgets.results.NavResults;
import com.domgen.marketingbudgets.vo.BudgetHeaderVO;
import com.domgen.marketingbudgets.vo.FinanceDivisionVO;
import com.domgen.marketingbudgets.vo.InvoiceBudgetVO;
import com.domgen.marketingbudgets.vo.InvoiceHeaderVO;
import com.domgen.marketingbudgets.vo.InvoiceIdVO;
import com.domgen.marketingbudgets.vo.InvoiceLineVO;
import com.domgen.marketingbudgets.vo.InvoiceNumberVO;
import com.domgen.marketingbudgets.vo.InvoicesSearchSearchSortVO;
//import com.domgen.utilities.data.DGDataManipulation;
//import com.domgen.utilities.data.DGDate;
import com.ibm.as400.access.AS400;
import com.ibm.as400.access.AS400SecurityException;
import com.ibm.as400.access.ConnectionDroppedException;
import com.ibm.as400.access.DecimalDataArea;
import com.ibm.as400.access.ErrorCompletingRequestException;
import com.ibm.as400.access.IllegalObjectTypeException;
import com.ibm.as400.access.ObjectDoesNotExistException;
import com.ibm.as400.access.QSYSObjectPathName;
import com.ibm.as400.access.ServerStartupException;

/**
 * set up invoice data
 * 
 * @version	1.0 
 * @author 	SIMMR on 07-Jul-05
 */
public class InvoiceBO implements IStatusCodes, IConstants
{
	// flag to indicate if data area is locked
	private static boolean busy;
	
	private Logger logger = Logger.getLogger(this.getClass().getName());	
	
	/**
	 * set up list of invoices
	 * 
	 * @return list of invoices
	 */
	public ArrayList setUpInvoices()
	{
		int size = 24;

		ArrayList invoices = new ArrayList(size);

		for (int i = 0; i < size; i++)
		{
			InvoiceResults invoice = new InvoiceResults();

			invoice.setLineNo(Integer.toString(i + 1));

			invoice.setNetAmount(null);
			invoice.setVatAmount(null);
			invoice.setGrossAmount(null);
			invoice.setPaymentType(null);
			invoice.setInvoiceMonth(null);
			invoice.setInvoiceYear(null);

			invoices.add(i, invoice);
		}

		return invoices;

	}

	/**
	 * get next system generated invoice id
	 * 
	 * @return invoiceId
	 */
	public String getNextSystemInvoiceId() {
	InvoiceBO invoiceBo = new InvoiceBO();

	// FIXME BC - 14/01/2013 : The code needs to be commented out and the stored proc used instead
	String systemInvoiceId = invoiceBo.incrementNextInvoiceId();
	return ("00" + systemInvoiceId);

	// FIXME BC - 14/01/2013 - Used stored procedure to get next invoice id
/***	Integer nextInvoiceNo = invoiceBo.incrementNextInvoiceIdProc();
	// add leading zeros to make invoice id 9 long
	String systemInvoiceId = StringUtils.leftPad(Integer.toString(nextInvoiceNo.intValue()), 9, "0");
	logger.debug(" In InvoiceBO.getNextSystemInvoiceId():   Next Invoice Number = "+ systemInvoiceId);
	return systemInvoiceId;
***/

    }

	/**
	 * create invoice header record
	 * 
	 * @param invoiceEntryform
	 * @param systemInvoiceId
	 */
	public void createInvoiceHeader(
		InvoiceEntryForm form,
		String systemInvoiceId,
		String fullName,
		ActionErrors errors)
	{
		// instantiate DAO and VO
		InvoiceHeaderDAO invoiceHeaderDao = new InvoiceHeaderDAO();
		InvoiceHeaderVO invoiceHeaderVo = new InvoiceHeaderVO();

		// retrieve client details
		BudgetHeaderBO budgetHeaderBo = new BudgetHeaderBO();

		BudgetHeaderVO budgetHeaderVo =	budgetHeaderBo.getBudgetHeader(form.getAccountName());

		String currentPeriod = budgetHeaderVo.getCurrentPeriod();

		// get current date
		String currentDate = "";
		String invoiceDate = "";
		try
		{
			//DGDate date = new DGDate();
			//currentDate =
				//Long.toString(
					//date.convertStringDateToAS400Date(date.getCurrentDate()));
				
			//DGDate date1 = new DGDate();
					//invoiceDate =
							//Long.toString(
							//	date1.convertStringDateToAS400Date(form.getEntryDateDay()+ "/" + form.getEntryDateMonth() + "/" + form.getEntryDateYear()));
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}

		// set up data
		invoiceHeaderVo.setAccountName(form.getAccountName());
		invoiceHeaderVo.setCurrentPeriod(currentPeriod);
		invoiceHeaderVo.setEntryDate(currentDate);
		invoiceHeaderVo.setSystemInvoiceId(systemInvoiceId);
		invoiceHeaderVo.setInvoiceNo(form.getInvoiceNo());
		invoiceHeaderVo.setInvoiceDate(invoiceDate);
		invoiceHeaderVo.setFinanceDivision(form.getFinanceDivision());
		invoiceHeaderVo.setPurchaseLedger(form.getPurchaseLedger());
		invoiceHeaderVo.setUnit(form.getUnit());
		invoiceHeaderVo.setNature(form.getNature());
		invoiceHeaderVo.setTransactionType(form.getTransactionType());
		invoiceHeaderVo.setTotalNetAmount(form.getTotalNetAmount());
		invoiceHeaderVo.setTotalVatAmount(form.getTotalVatAmount());
		invoiceHeaderVo.setTotalGrossAmount(form.getTotalGrossAmount());
		invoiceHeaderVo.setComments(form.getComments());
		invoiceHeaderVo.setStatus(INVOICE_STATUS_NEW_ENTRY);
		invoiceHeaderVo.setErrorDescription("");
		invoiceHeaderVo.setNumberOfLines(form.getNoOfInvoiceLinesEntered());
		invoiceHeaderVo.setApprovalFlag("N");
		invoiceHeaderVo.setRejectedByOriginal("N");

		// write record
		int noOfRecords = invoiceHeaderDao.insert(invoiceHeaderVo);
		
		if (noOfRecords > 0)
		{
		InvoiceLineVO tempInvoiceLineVo = new InvoiceLineVO();
		tempInvoiceLineVo.setAccountName(form.getAccountName());
		tempInvoiceLineVo.setCurrentPeriod(currentPeriod);
		tempInvoiceLineVo.setInvoiceDate(invoiceDate);
		tempInvoiceLineVo.setSystemInvoiceNo(systemInvoiceId);
		tempInvoiceLineVo.setInvoiceLineNo("00");
		
		// update audit file
		InvoiceAuditBO invoiceAuditBo = new InvoiceAuditBO();
		String comments = "";
		if (form.getComments()== null)
			{comments = "New invoice";}
		else if (form.getComments().equals(""))
			{comments = "New invoice";}
		else
			{comments = form.getComments();}
		invoiceAuditBo.updateAuditFile(tempInvoiceLineVo, INVOICE_STATUS_NEW_ENTRY, comments, fullName);
		}	
		else
		{
			errors.add(
					"processError",
					new org.apache.struts.action.ActionError(
						"error.process.text"));
	
		}
	}
	
	/**
	* update invoice header record
	* 
	* @param invoiceEntryform
	* @param systemInvoiceId
	*/
		public int updateInvoiceHeader(
			InvoiceEditForm form,
			Object invoiceHeaderObjectAs400,
			Object invoiceHeaderObjectBeforeEdit,
			String newNoOfInvoiceLines,
			String fullName,
			ActionErrors errors)
		{	
				
			// after invoice lines have been processed (including deletes & inserts),
			// if number of lines has changed, need to know new number, otherwise use number of lines generated from form 
			if (newNoOfInvoiceLines.equals(""))
			{
				newNoOfInvoiceLines = form.getNoOfInvoiceLinesEntered();
			}
			// retrieve invoice Header information of AS400 file
			InvoiceHeaderVO invoiceHeaderAS400 = (InvoiceHeaderVO) invoiceHeaderObjectAs400;
		
			// retrieve invoice Header information before edit
			InvoiceHeaderVO invoiceHeaderBeforeEdit = (InvoiceHeaderVO) invoiceHeaderObjectBeforeEdit;
					
			// retrieve invoice Header information after edit
			ArrayList invoiceHeaders = form.getInvoiceHeader();
			InvoiceHeaderVO invoiceHeader = (InvoiceHeaderVO) invoiceHeaders.get(0);

			// instantiate DAO and VO
			InvoiceHeader1DAO invoiceHeader1Dao = new InvoiceHeader1DAO();
			InvoiceHeaderVO invoiceHeaderVo = new InvoiceHeaderVO();

			// set up data
			invoiceHeaderVo.setAccountName(invoiceHeader.getAccountName());
			invoiceHeaderVo.setCurrentPeriod(form.getCurrentPeriod());
			invoiceHeaderVo.setSystemInvoiceId(invoiceHeaderAS400.getSystemInvoiceId());
  			invoiceHeaderVo.setEntryDate(invoiceHeaderAS400.getEntryDate());
			invoiceHeaderVo.setInvoiceNo(invoiceHeader.getInvoiceNo());
			invoiceHeaderVo.setInvoiceDate(form.getInvoiceDate());
			invoiceHeaderVo.setFinanceDivision(invoiceHeader.getFinanceDivision());
			invoiceHeaderVo.setPurchaseLedger(invoiceHeader.getPurchaseLedger());
			invoiceHeaderVo.setUnit(invoiceHeader.getUnit());
			invoiceHeaderVo.setNature(invoiceHeader.getNature());
			invoiceHeaderVo.setTransactionType(invoiceHeader.getTransactionType());
			invoiceHeaderVo.setTotalNetAmount(invoiceHeader.getTotalNetAmount());
			invoiceHeaderVo.setTotalVatAmount(invoiceHeader.getTotalVatAmount());
			invoiceHeaderVo.setTotalGrossAmount(invoiceHeader.getTotalGrossAmount());
			invoiceHeaderVo.setComments(invoiceHeaderAS400.getComments());
			invoiceHeaderVo.setStatus(invoiceHeaderBeforeEdit.getStatus());
			invoiceHeaderVo.setErrorDescription(invoiceHeaderAS400.getErrorDescription());
			invoiceHeaderVo.setNumberOfLines(newNoOfInvoiceLines);
			invoiceHeaderVo.setApprovalFlag(invoiceHeaderAS400.getApprovalFlag());
			invoiceHeaderVo.setRejectedByOriginal(invoiceHeaderAS400.getRejectedByOriginal());

			// update record
			int noOfRecords = invoiceHeader1Dao.update(invoiceHeaderVo);

			if (noOfRecords > 0)
			{
			if (!form.getActionChosen().equalsIgnoreCase("delete"))
			{
				InvoiceLineVO tempInvoiceLineVo = new InvoiceLineVO();
				tempInvoiceLineVo.setAccountName(invoiceHeader.getAccountName());
				tempInvoiceLineVo.setCurrentPeriod(invoiceHeader.getCurrentPeriod());
				tempInvoiceLineVo.setInvoiceDate(invoiceHeader.getInvoiceDate());
				tempInvoiceLineVo.setSystemInvoiceNo(invoiceHeaderAS400.getSystemInvoiceId());
				tempInvoiceLineVo.setInvoiceLineNo("00");

				// update audit file
				InvoiceAuditBO invoiceAuditBo = new InvoiceAuditBO();
				String comments = "";
				if (form.getComments()== null)
					{comments = "Edit invoice";}
				else if (form.getComments().equals(""))
					{comments = "Edit invoice";}
				else
					{comments = form.getComments();}
				invoiceAuditBo.updateAuditFile(tempInvoiceLineVo, INVOICE_STATUS_EDITED_BY_ACCOUNTS, comments, fullName);
			}
			}
			else
			{
				errors.add(
						"processError",
						new org.apache.struts.action.ActionError(
							"error.process.text"));
	
			}
			return noOfRecords;
		}

	/**
	 * create invoice lines 
	 * 
	 * @param invoiceEntryform
	 * @param systemInvoiceId
	 */
	public void createInvoiceLines(
		InvoiceEntryForm form,
		String systemInvoiceId,
		String fullName,
		ActionErrors errors,
		HttpSession session)
	{
		ArrayList invoices = form.getInvoices();

		for (int i = 0; i < invoices.size(); i++)
		{
			// retrieve invoice line
			InvoiceResults invoice = (InvoiceResults) invoices.get(i);

			// only write lines with data
			if (!invoice.getNetAmount().equals(""))
			{
				String invoiceNo = Integer.toString(i + 1);

				if (i+1 < 10)
				{
					invoiceNo = "0" + (i + 1);
				}

				invoice.setLineNo(invoiceNo);

				// create invoice line on as400

				if (createInvoiceLine(form, invoice, systemInvoiceId, fullName, session) != 1)
				{
					errors.add(
						"processError",
							new org.apache.struts.action.ActionError(
							"error.process.text"));

				}
			}
		}
	}


	/**
	 * create invoice line record
	 * 
	 * @param invoiceEntryform
	 * @param invoice
	/* @param systemInvoiceId
	/ */
	public int createInvoiceLine(
		InvoiceBaseForm form,
		InvoiceResults invoice,
		String systemInvoiceId,
		String fullName,
		HttpSession session)
	{
		// instantiate DAO and VO
		InvoiceLineDAO invoiceLineDao = new InvoiceLineDAO();
		InvoiceLineVO invoiceLineVo = new InvoiceLineVO();

		// retrieve client details
		BudgetHeaderBO budgetHeaderBo = new BudgetHeaderBO();

		BudgetHeaderVO budgetHeaderVo =	budgetHeaderBo.getBudgetHeader(form.getAccountName());

		String currentPeriod = budgetHeaderVo.getCurrentPeriod();

		// get current date
		String invoiceDate = "";
		String currentDate = "";
		try {
		//DGDate date1 = new DGDate();
			//currentDate =
				//Long.toString(
					//date1.convertStringDateToAS400Date(date1.getCurrentDate()));
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		//If invoice period is later than current month set status to EARLY
		String currentMonth = (String) session.getAttribute("currentMonth");
		String currentYear = (String) session.getAttribute("currentYear");
		String currentInvPeriod = currentYear + currentMonth;
		int currentInvPeriodInt = Integer.valueOf(currentInvPeriod).intValue();
		String invoiceInvPeriod = invoice.getInvoiceYear() + invoice.getInvoiceMonth();
		int invoiceInvPeriodInt = Integer.valueOf(invoiceInvPeriod).intValue();
			
		// set up data
		invoiceLineVo.setAccountName(form.getAccountName());
		invoiceLineVo.setCurrentPeriod(currentPeriod);
		invoiceLineVo.setEntryDate(currentDate);
		invoiceLineVo.setSystemInvoiceNo(systemInvoiceId);
		invoiceLineVo.setInvoiceNo(form.getInvoiceNo());
		invoiceLineVo.setInvoiceLineNo(invoice.getLineNo());
		invoiceLineVo.setInvoiceDate(form.getInvoiceDate());
		invoiceLineVo.setInvoiceNetAmount(invoice.getNetAmount().trim());
		invoiceLineVo.setInvoiceVatAmount(invoice.getVatAmount());
		invoiceLineVo.setInvoiceGrossAmount(invoice.getGrossAmount());
		invoiceLineVo.setPaymentType(invoice.getPaymentType());
		invoiceLineVo.setInvoicePeriodMonth(invoice.getInvoiceMonth());
		invoiceLineVo.setInvoicePeriodYear(invoice.getInvoiceYear());
		if (invoiceInvPeriodInt > currentInvPeriodInt )
		{
			invoiceLineVo.setStatus(INVOICE_STATUS_EARLY);
		}
		else
		{
			invoiceLineVo.setStatus(INVOICE_STATUS_NEW_ENTRY);
		}		
		invoiceLineVo.setErrorDescription("");
		invoiceLineVo.setNumberOfLines(form.getNoOfInvoiceLinesEntered());
		invoiceLineVo.setUnderwritingApprover("");
		invoiceLineVo.setSalesSupportApprover("");
		invoiceLineVo.setApprovalFlag("N");
		invoiceLineVo.setRejectedByOriginal("N");
		invoiceLineVo.setPreviousStatusToRBYO("00");
		invoiceLineVo.setUnderwritingAction("N");
		invoiceLineVo.setSalesSupportAction("N");
		invoiceLineVo.setAccountsAction("N");
		invoiceLineVo.setFinanceDivision(form.getFinanceDivision());

		// write record
		int noOfRecords = invoiceLineDao.insert(invoiceLineVo);
		
		// update status of budgetline from unsubmitted to submitted, 
		//only if payment type Regular (there will be no budgetline line for ADJ)		
		if (noOfRecords > 0 && invoiceLineVo.getPaymentType().equalsIgnoreCase("REG"))
		{ 
			BudgetLineBO budgetLineBo = new BudgetLineBO();
			int noOfRecordsBL = budgetLineBo.updateBudgetLineStatus(invoiceLineVo.getAccountName(), invoiceLineVo.getInvoicePeriodYear(), invoiceLineVo.getInvoicePeriodMonth(), BUDGET_LINE_SUBMITTED);
		}

		// update audit file
		if (noOfRecords > 0)
		{
		InvoiceLineVO tempInvoiceLineVo = new InvoiceLineVO();
		tempInvoiceLineVo.setAccountName(form.getAccountName());
		tempInvoiceLineVo.setCurrentPeriod(currentPeriod);
		tempInvoiceLineVo.setInvoiceDate(invoiceDate);
		tempInvoiceLineVo.setSystemInvoiceNo(systemInvoiceId);
		tempInvoiceLineVo.setInvoiceLineNo(invoice.getLineNo());
		
		InvoiceAuditBO invoiceAuditBo = new InvoiceAuditBO();
		String comments = "";
		if (form.getComments()== null)
			{comments = "New invoice";}
		else if (form.getComments().equals(""))
			{comments = "New invoice";}
		else
			{comments = form.getComments();}
		
		invoiceAuditBo.updateAuditFile(tempInvoiceLineVo, INVOICE_STATUS_NEW_ENTRY, comments, fullName);
		}		


		return noOfRecords;
	}
	
	/**
	 * create invoice line record
	 * 
	 * @param invoiceEntryform
	 * @param invoice
	/* @param systemInvoiceId
	/ */
	public int createInvoiceLineEdit(
		InvoiceEditForm form,
		InvoiceResults invoice,
		String systemInvoiceId,
		String fullName,
		ActionErrors errors,
		HttpSession session)
	{
		// instantiate DAO and VO
		InvoiceLineDAO invoiceLineDao = new InvoiceLineDAO();
		InvoiceLineVO invoiceLineVo = new InvoiceLineVO();

		// retrieve client details
		BudgetHeaderBO budgetHeaderBo = new BudgetHeaderBO();

		// get data necessary for updating invoice lines
		List invoiceHeaders = form.getInvoiceHeader();
		InvoiceHeaderVO invoiceHeader = (InvoiceHeaderVO) invoiceHeaders.get(0);
				  
		BudgetHeaderVO budgetHeaderVo =	budgetHeaderBo.getBudgetHeader(invoiceHeader.getAccountName());

		String currentPeriod = budgetHeaderVo.getCurrentPeriod();

		// get current date
		String currentDate = "";
		String invoiceDate = "";
		/*try {		
		//DGDate date = new DGDate();
			invoiceDate =
				Long.toString(
					//date.convertStringDateToAS400Date(invoiceHeader.getEntryDateDay()+ "/" + invoiceHeader.getEntryDateMonth() + "/20" + invoiceHeader.getEntryDateYear()));
		//DGDate date1 = new DGDate();
					currentDate =
						//Long.toString(
							//date1.convertStringDateToAS400Date(date.getCurrentDate()));
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}*/
		//If invoice period is later than current month set status to EARLY
		String currentMonth = (String) session.getAttribute("currentMonth");
		String currentYear = (String) session.getAttribute("currentYear");
		String currentInvPeriod = currentYear + currentMonth;
		int currentInvPeriodInt = Integer.valueOf(currentInvPeriod).intValue();
		String invoiceInvPeriod = invoice.getInvoiceYear() + invoice.getInvoiceMonth();
		int invoiceInvPeriodInt = Integer.valueOf(invoiceInvPeriod).intValue();

		// set up data
		invoiceLineVo.setAccountName(invoiceHeader.getAccountName());
		invoiceLineVo.setCurrentPeriod(currentPeriod);
		invoiceLineVo.setEntryDate(currentDate);
		invoiceLineVo.setSystemInvoiceNo(systemInvoiceId);
		invoiceLineVo.setInvoiceNo(invoiceHeader.getInvoiceNo());
		invoiceLineVo.setInvoiceLineNo(invoice.getLineNo());
		invoiceLineVo.setInvoicePeriodYear(invoice.getInvoiceYear());
		invoiceLineVo.setInvoicePeriodMonth(invoice.getInvoiceMonth());
		invoiceLineVo.setInvoiceNetAmount(invoice.getNetAmount().trim());
		invoiceLineVo.setInvoiceVatAmount(invoice.getVatAmount());
		invoiceLineVo.setInvoiceGrossAmount(invoice.getGrossAmount());
		invoiceLineVo.setPaymentType(invoice.getPaymentType());
		invoiceLineVo.setInvoiceDate(invoiceDate);
		if (invoiceInvPeriodInt > currentInvPeriodInt )
		{
			invoiceLineVo.setStatus(INVOICE_STATUS_EARLY);
		}
		else
		{
			invoiceLineVo.setStatus(INVOICE_STATUS_NEW_ENTRY);
		}
		invoiceLineVo.setErrorDescription("");
		invoiceLineVo.setNumberOfLines(form.getNoOfInvoiceLinesEntered());
		invoiceLineVo.setUnderwritingApprover("");
		invoiceLineVo.setSalesSupportApprover("");
		invoiceLineVo.setAccountsAction("N");
		invoiceLineVo.setUnderwritingAction("N");
		invoiceLineVo.setSalesSupportAction("N");
		invoiceLineVo.setApprovalFlag("N");
		invoiceLineVo.setRejectedByOriginal("N");
		invoiceLineVo.setPreviousStatusToRBYO("00");
		invoiceLineVo.setFinanceDivision(invoiceHeader.getFinanceDivision());

		// write record
		int noOfRecords = invoiceLineDao.insert(invoiceLineVo);
		
		// update status of budgetline from unsubmitted to submitted, 
		//only if payment type Regular (there will be no budgetline line for ADJ)		
		if (noOfRecords > 0 && invoiceLineVo.getPaymentType().equalsIgnoreCase("REG"))
		{ 
			BudgetLineBO budgetLineBo = new BudgetLineBO();
			int noOfRecordsBL = budgetLineBo.updateBudgetLineStatus(invoiceLineVo.getAccountName(), invoiceLineVo.getInvoicePeriodYear(), invoiceLineVo.getInvoicePeriodMonth(), BUDGET_LINE_SUBMITTED);
		}


		if (noOfRecords > 0)
		{
		}		
		else
		{
			errors.add(
					"processError",
					new org.apache.struts.action.ActionError(
						"error.process.text"));	
		}
		return noOfRecords;
	}


	/**
	 * update invoice lines 
	 * 
	 * @param invoiceEditform
	 * @param systemInvoiceId
	 */
	public String updateInvoiceLines(
			InvoiceEditForm form,
			String systemInvoiceId,
			String accountName,
			String fullName,
			ActionErrors errors,
			HttpSession session)
	{
		StatusCodesText statusCodesText = new StatusCodesText();
		// get invoice lines from edit form
		ArrayList invoices = form.getInvoices();
			
		int noOfInvoiceLinesChange = 0;

		for (int i = 0; i < invoices.size(); i++)
		{
			// get edited invoice data
			InvoiceLineVO invoice = (InvoiceLineVO) invoices.get(i);
		
			if (!invoice.getInvoiceNetAmount().trim().equals(""))
				{
					if (invoice.getInvoiceLineAction().equals("Insert"))
					{
						//retrieve number of invoice lines on invoice line file 
						InvoiceLine1DAO invoiceLineDao = new InvoiceLine1DAO();
	
						HashMap searchCriteria = new HashMap();
						searchCriteria.put("MBIVID", systemInvoiceId);
					
						List invoiceLineOriginals =  invoiceLineDao.findByCriteria(searchCriteria, null);
	
						if (invoiceLineOriginals.size() < 1)
						{
							logger.warn("ERROR: invoice NOT found");
						}
						else
						{
							// create InvoiceResults object to pass to createInvoiceLine()
							
							InvoiceResults invoiceR = new InvoiceResults();
									invoiceR.setLineNo(invoice.getInvoiceLineNo());
									invoiceR.setNetAmount(invoice.getInvoiceNetAmount());
									invoiceR.setVatAmount(invoice.getInvoiceVatAmount());
									invoiceR.setGrossAmount(invoice.getInvoiceGrossAmount());
									invoiceR.setPaymentType(invoice.getPaymentType());
									invoiceR.setInvoiceMonth(invoice.getInvoicePeriodMonth());
									invoiceR.setInvoiceYear(invoice.getInvoicePeriodYear());
																
							// create invoice line on as400
							if (createInvoiceLineEdit(form, invoiceR, systemInvoiceId, fullName, errors, session) != 1)
							{
								logger.warn("ERROR: invoice line NOT created");
							}
							
							noOfInvoiceLinesChange = noOfInvoiceLinesChange + 1;
							
							// update invoiceLineVO object to pass to updateAuditFile()
	
							invoice.setAccountName(accountName);
							invoice.setSystemInvoiceNo(systemInvoiceId);
								 							
							// update audit file
  							InvoiceAuditBO invoiceAuditBo = new InvoiceAuditBO();
							String comments = "";
							if (form.getComments()== null)
								{comments = "New invoice";}
							else if (form.getComments().equals(""))
								{comments = "New invoice";}
							else
								{comments = form.getComments();}
							invoiceAuditBo.updateAuditFile(invoice, INVOICE_STATUS_NEW_ENTRY, comments, fullName);
						}
					}
					else if (invoice.getInvoiceLineAction().equals("Update"))
					{
						
						// retrieve number of invoice lines on invoice line file 
						InvoiceLine1DAO invoiceLineDao = new InvoiceLine1DAO();
	
						HashMap searchCriteria = new HashMap();
						searchCriteria.put("MBIVID", systemInvoiceId);
						searchCriteria.put("MBIVLN", invoice.getInvoiceLineNo());
				
						List invoiceLineOriginals =  invoiceLineDao.findByCriteria(searchCriteria, null);
	
						if (invoiceLineOriginals.size() < 1)
						{
							logger.warn("ERROR: invoice NOT found");
						}
						else if (invoiceLineOriginals.size() > 1)
						{
							logger.warn("ERROR: more than ONE invoice line found: " + invoiceLineOriginals.size());
						}
						else
						{
							InvoiceLineVO invoiceLineOriginal = (InvoiceLineVO) invoiceLineOriginals.get(0);
						
							// update invoice line on as400
							if (updateInvoiceLine(form, invoice, systemInvoiceId, invoiceLineOriginal, accountName, form.getNoOfInvoiceLinesEntered(), fullName, errors) != 1)
							{
								logger.warn("ERROR: invoice line not updated");
							}
						
							// update audit file
							InvoiceAuditBO invoiceAuditBo = new InvoiceAuditBO();
							String comments = "";	
							if (form.getComments()== null)
								{comments = "Edit invoice";}
							else if (form.getComments().equals(""))
								{comments = "Edit invoice";}
							else
								{comments = form.getComments();}
								
							if(invoiceLineOriginal.getStatus().equalsIgnoreCase(INVOICE_STATUS_REJECT_TO_ACCOUNTS))
							{
								comments = comments + ". Restored invoice to previous status: " + statusCodesText.getInvoiceLineStatusCodeText(invoiceLineOriginal.getPreviousStatusToRBYO());
								invoiceAuditBo.updateAuditFile(invoiceLineOriginal, invoiceLineOriginal.getPreviousStatusToRBYO(), comments, fullName);
							}
							else
							{
								invoiceAuditBo.updateAuditFile(invoiceLineOriginal, invoiceLineOriginal.getStatus(), comments, fullName);
					
							}
								
						}
					}
					else if (invoice.getInvoiceLineAction().equals("Delete"))
					{
							//	ensure invoice line exists 
							InvoiceLine1DAO invoiceLineDao = new InvoiceLine1DAO();
	
							HashMap searchCriteria = new HashMap();
							searchCriteria.put("MBIVID", systemInvoiceId);
							searchCriteria.put("MBIVLN", form.getInvoiceLineToDelete());
					
							List invoicelineOriginals =  invoiceLineDao.findByCriteria(searchCriteria, null);
	
							if (invoicelineOriginals.size() < 1)
							{
								logger.warn("ERROR: invoice NOT found");
							}
							else if (invoicelineOriginals.size() > 1)
							{
								logger.warn("ERROR: more than ONE invoice line found");
							}
							else
							{
								// delete invoice line on as400
								deleteInvoiceLine(form, invoice, systemInvoiceId, invoicelineOriginals.get(0), accountName, form.getNoOfInvoiceLinesEntered(), errors);
								InvoiceLineVO invoiceLineOriginal = (InvoiceLineVO) invoicelineOriginals.get(0);
								// update audit file
								InvoiceAuditBO invoiceAuditBo = new InvoiceAuditBO();
								String comments = "";	
								if (form.getComments()== null)
									{comments = "Invoice DELETED";}
								else if (form.getComments().equals(""))
									{comments = "Invoice DELETED";}
								else
									{comments = form.getComments();}	
									//create audit for header 
									UtilityBO utilityBo = new UtilityBO();			
									comments = "Invoice Id: " + invoiceLineOriginal.getSystemInvoiceNo() + invoiceLineOriginal.getInvoiceLineNo() + ". Net Amount: " 
									+ invoiceLineOriginal.getInvoiceNetAmount() + " VAT Amount: " + invoiceLineOriginal.getInvoiceVatAmount()+ "Gross Amount: " + invoiceLineOriginal.getInvoiceGrossAmount()
									+ " Payment Type: " + invoiceLineOriginal.getPaymentType() + " Invoice Period: " + invoiceLineOriginal.getInvoicePeriodMonth() + "/20" + invoiceLineOriginal.getInvoicePeriodYear() 
									+ " Last Status: " + invoiceLineOriginal.getStatusFormatted() + ". " + comments;
									//invoiceAuditBo.updateAuditFile(invoiceLineOriginal, INVOICE_STATUS_DELETED_BY_ACCOUNTS, comments, fullName);					
									invoiceLineOriginal.setInvoiceLineNo("00");
									invoiceAuditBo.updateAuditFile(invoiceLineOriginal, INVOICE_STATUS_DELETED_BY_ACCOUNTS, comments, fullName);
			
							}
	
						noOfInvoiceLinesChange = noOfInvoiceLinesChange - 1;
					}
			
				} // end of if net amount !=""
			} //end of for loop

			String newNoOfInvoiceLines = "";
			if (noOfInvoiceLinesChange != 0) //update all invoice lines with new NoOfInvoiceLines
			{
				// retrieve all invoice lines  
				InvoiceLine1DAO invoiceLineDao = new InvoiceLine1DAO();
	
				HashMap searchCriteria = new HashMap();
				searchCriteria.put("MBIVID", systemInvoiceId);
					
				List invoicelineAS400 =  invoiceLineDao.findByCriteria(searchCriteria, null);
						
				if (invoicelineAS400.size() < 1)
				{
					logger.warn("ERROR: invoice NOT found");
				}
				else
				{
				newNoOfInvoiceLines = Integer.toString(invoicelineAS400.size());
					
					for (int j = 0; j < invoicelineAS400.size(); j++)
					{
						// update invoice line on as400
						if (updateInvoiceLine(form, invoicelineAS400.get(j), systemInvoiceId, invoicelineAS400.get(j), accountName, newNoOfInvoiceLines, fullName, errors) != 1)
						{
							logger.warn("ERROR: invoice line not updated");
						}
					}
				}

			// reset invoices arraylist on form to reflect as400 file after deletes/insert
			// needed for re-calculation of totals						
			ArrayList invoicelineAS400ArrayList = new ArrayList(invoicelineAS400.size());
				for (int k = 0; k < invoicelineAS400.size(); k++) 
				{
				invoicelineAS400ArrayList.add(invoicelineAS400.get(k));
				}
		form.setInvoices(invoicelineAS400ArrayList);
		}
						
	return newNoOfInvoiceLines;
	}

	/**
	 * update invoice line record
	 * 
	 * @param invoiceEntryform
	 * @param invoice
	/* @param systemInvoiceId
	/ */
	public int updateInvoiceLine(
			InvoiceEditForm form,
			Object invoice,
			String systemInvoiceId,
			Object invoiceLineObject,
			String accountName,
			String numberOfLines,
			String fullName,
			ActionErrors errors)
	{
			
		InvoiceLineVO invoiceLineOriginalVo = (InvoiceLineVO) invoiceLineObject;
		InvoiceLineVO invoiceVo = (InvoiceLineVO) invoice;
		
		// retrieve invoice Header information after edit
		ArrayList invoiceHeaders = form.getInvoiceHeader();
		InvoiceHeaderVO invoiceHeader = (InvoiceHeaderVO) invoiceHeaders.get(0);
			
		// instantiate DAO and VO
		InvoiceLine1DAO invoiceLineDao = new InvoiceLine1DAO();
		InvoiceLineVO invoiceLineVo = new InvoiceLineVO();
		
		//DATA
		logger.info(accountName + ".");
		logger.info(invoiceLineOriginalVo.getCurrentPeriod() + ".");
		logger.info(invoiceLineOriginalVo.getEntryDate() + ".");
		logger.info(systemInvoiceId + ".");
		logger.info(invoiceHeader.getInvoiceNo() + ".");
		logger.info(form.getInvoiceDate() + ".");
		logger.info(invoiceVo.getInvoiceLineNo() + ".");
		logger.info(invoiceVo.getInvoicePeriodYear() + ".");
		logger.info(invoiceVo.getInvoicePeriodMonth() + ".");
		logger.info(invoiceVo.getInvoiceNetAmount() + ".");
		logger.info(invoiceVo.getInvoiceVatAmount() + ".");
		logger.info(invoiceVo.getInvoiceGrossAmount() + ".");
		logger.info(invoiceVo.getPaymentType() + ".");
		logger.info(invoiceLineOriginalVo.getStatus() + ".");
		logger.info(invoiceLineOriginalVo.getErrorDescription() + ".");
		logger.info(numberOfLines + ".");
		logger.info(invoiceLineOriginalVo.getUnderwritingApprover() + ".");
		logger.info(invoiceLineOriginalVo.getSalesSupportApprover() + ".");
		logger.info(invoiceLineOriginalVo.getApprovalFlag() + ".");
		logger.info(invoiceHeader.getFinanceDivision() + ".");
		logger.info(invoiceLineOriginalVo.getAccountsAction() + ".");
		logger.info(invoiceLineOriginalVo.getUnderwritingAction() + ".");
		logger.info(invoiceLineOriginalVo.getSalesSupportAction() + ".");
		logger.info(invoiceLineOriginalVo.getRejectedByOriginal() + ".");
		logger.info(invoiceLineOriginalVo.getPreviousStatusToRBYO() + ".");
		
		// set up data		
		invoiceLineVo.setAccountName(accountName);
		invoiceLineVo.setCurrentPeriod(invoiceLineOriginalVo.getCurrentPeriod());
		invoiceLineVo.setEntryDate(invoiceLineOriginalVo.getEntryDate());
		invoiceLineVo.setSystemInvoiceNo(systemInvoiceId);
		invoiceLineVo.setInvoiceNo(invoiceHeader.getInvoiceNo());
		invoiceLineVo.setInvoiceDate(form.getInvoiceDate());
		invoiceLineVo.setInvoiceLineNo(invoiceVo.getInvoiceLineNo());
		invoiceLineVo.setInvoicePeriodYear(invoiceVo.getInvoicePeriodYear());
		invoiceLineVo.setInvoicePeriodMonth(invoiceVo.getInvoicePeriodMonth());
		invoiceLineVo.setInvoiceNetAmount(invoiceVo.getInvoiceNetAmount().trim());
		invoiceLineVo.setInvoiceVatAmount(invoiceVo.getInvoiceVatAmount());
		invoiceLineVo.setInvoiceGrossAmount(invoiceVo.getInvoiceGrossAmount());
		invoiceLineVo.setPaymentType(invoiceVo.getPaymentType());
		invoiceLineVo.setStatus(invoiceLineOriginalVo.getStatus());
		invoiceLineVo.setErrorDescription(invoiceLineOriginalVo.getErrorDescription());
		invoiceLineVo.setNumberOfLines(numberOfLines);
		invoiceLineVo.setUnderwritingApprover(invoiceLineOriginalVo.getUnderwritingApprover());
		invoiceLineVo.setSalesSupportApprover(invoiceLineOriginalVo.getSalesSupportApprover());
		invoiceLineVo.setApprovalFlag(invoiceLineOriginalVo.getApprovalFlag());
		invoiceLineVo.setFinanceDivision(invoiceHeader.getFinanceDivision());
		invoiceLineVo.setAccountsAction(invoiceLineOriginalVo.getAccountsAction());
		invoiceLineVo.setUnderwritingAction(invoiceLineOriginalVo.getUnderwritingAction());
		invoiceLineVo.setSalesSupportAction(invoiceLineOriginalVo.getSalesSupportAction());
		invoiceLineVo.setRejectedByOriginal(invoiceLineOriginalVo.getRejectedByOriginal());
		invoiceLineVo.setPreviousStatusToRBYO(invoiceLineOriginalVo.getPreviousStatusToRBYO());
		if (invoiceLineVo.getStatus().equalsIgnoreCase(INVOICE_STATUS_REJECT_TO_ACCOUNTS))
		{
			invoiceLineVo.setStatus(invoiceLineOriginalVo.getPreviousStatusToRBYO());
			invoiceLineVo.setPreviousStatusToRBYO("00");
		}

		// update record
		int noOfRecords = invoiceLineDao.update(invoiceLineVo);
		
		if (noOfRecords > 0)
		{
		}	
		else
		{
			errors.add(
					"processError",
					new org.apache.struts.action.ActionError(
						"error.process.text"));	
		}

		return noOfRecords;
		}
		
	/**
	 * update invoice line record
	 * 
	 * @param invoiceEntryform
	 * @param invoice
	/* @param systemInvoiceId
	/ */
		public void deleteInvoiceLine(
			InvoiceEditForm form,
			InvoiceLineVO invoice,
			String systemInvoiceId,
			Object invoiceLineObject,
			String accountName,
			String numberOfLines,
			ActionErrors errors)
		{
			
		InvoiceLineVO invoiceLineOriginalVo = (InvoiceLineVO) invoiceLineObject;
			
		// instantiate DAO and VO
		InvoiceLine1DAO invoiceLineDao = new InvoiceLine1DAO();
		InvoiceLineVO invoiceLineVo = new InvoiceLineVO();
		
		// set up data			
		invoiceLineVo.setAccountName(accountName);
		invoiceLineVo.setCurrentPeriod(invoiceLineOriginalVo.getCurrentPeriod());
		invoiceLineVo.setEntryDate(invoiceLineOriginalVo.getEntryDate());
		invoiceLineVo.setSystemInvoiceNo(systemInvoiceId);
		invoiceLineVo.setInvoiceLineNo(invoice.getInvoiceLineNo());
		invoiceLineVo.setInvoicePeriodYear(invoice.getInvoicePeriodYear());
		invoiceLineVo.setInvoicePeriodMonth(invoice.getInvoicePeriodMonth());
		invoiceLineVo.setInvoiceNetAmount(invoice.getInvoiceNetAmount());
		invoiceLineVo.setInvoiceVatAmount(invoice.getInvoiceVatAmount());
		invoiceLineVo.setInvoiceGrossAmount(invoice.getInvoiceGrossAmount());
		invoiceLineVo.setPaymentType(invoice.getPaymentType());
		invoiceLineVo.setInvoiceDate(invoice.getInvoiceDate());
		invoiceLineVo.setStatus(invoiceLineOriginalVo.getStatus());
		invoiceLineVo.setErrorDescription(invoiceLineOriginalVo.getErrorDescription());
		invoiceLineVo.setNumberOfLines(numberOfLines);
		invoiceLineVo.setUnderwritingApprover(invoiceLineOriginalVo.getUnderwritingApprover());
		invoiceLineVo.setSalesSupportApprover(invoiceLineOriginalVo.getSalesSupportApprover());
		invoiceLineVo.setApprovalFlag(invoiceLineOriginalVo.getApprovalFlag());

		// delete record
		int noOfRecords = invoiceLineDao.delete(invoiceLineVo);
		if (noOfRecords > 0)
		{
		}
		else
		{
			errors.add(
					"processError",
					new org.apache.struts.action.ActionError(
						"error.process.text"));	
		}
	}
	
	/**
	 * cancel invoice entry
	 *
	 * @param invoiceEntryForm
	 */
	public void cancel(InvoiceEntryForm form)
	{
		// clear all fields
		form.setAccountName("");
		form.setComments("");
		form.setFinanceDivision("");
		form.setInvoiceNo("");
		form.setInvoices(new ArrayList());
		form.setPurchaseLedger("");
		form.setEntryDateDay("");
		form.setEntryDateMonth("");
		form.setEntryDateYear("");
		form.setTotalGrossAmount("");
		form.setTotalNetAmount("");
		form.setTotalVatAmount("");
		form.setInvoices(setUpInvoices());
	}

	/**
	 * clear invoice entry
	 *
	 *@param invoiceEntryForm
	 */
	public void clear(InvoiceEntryForm form, HttpSession session)
	{
		// clear all fields
		cancel(form);

		NavResults navResults =	(NavResults) session.getAttribute("navResults");

		navResults.setInvoices(setUpInvoices());
	}

	/**
	 * calculate invoice vat, gross and totals
	 * 
	 * @param invoiceEntryForm
	 */
	public void calculateInvoiceAmounts(InvoiceEntryForm form)
	{
		
		// retrieve invoices
		ArrayList invoices = form.getInvoices();

		// retrieve vat rate from fiannce division
		FinanceDivisionBO financeDivisionBo = new FinanceDivisionBO();
		FinanceDivisionVO financeDivsionVo = financeDivisionBo.getFinanceDivision(form.getFinanceDivision());
		String vatRate = financeDivsionVo.getVatRate();

		// calculate amounts
		int oneHundred = 100;
		double vatRate1 = Double.parseDouble(vatRate) / oneHundred;
		//double vatRate2 = 1 - vatRate1;

		// initialise totals
		double totalNetAmount = 0;
		double totalVatAmount = 0;
		double totalGrossAmount = 0;

		// calulate vat and gross
		for (int i = 0; i < invoices.size(); i++)
		{
			InvoiceResults invoice = (InvoiceResults) invoices.get(i);

			if (!invoice.getNetAmount().equals(""))
			{
				double net = Double.parseDouble(invoice.getNetAmount());

				//double vat = (net / vatRate2) * vatRate1;
				double vat = net * vatRate1;
				double gross = net + vat;

				invoice.setVatAmount(formatAmount(vat));
				invoice.setGrossAmount(formatAmount(gross));

				totalNetAmount = totalNetAmount + net;
				totalVatAmount = totalVatAmount + vat;
				totalGrossAmount = totalGrossAmount + gross;
			}
		}
		form.setTotalNetAmount(formatAmount(totalNetAmount));
		form.setTotalVatAmount(formatAmount(totalVatAmount));
		form.setTotalGrossAmount(formatAmount(totalGrossAmount));
		form.setComments(form.getComments());
	}

	/**
		 * calculate invoice vat, gross and totals
		 * 
		 * @param invoiceEntryForm
		 */
		public void calculateInvoiceAmountsEdit(InvoiceEditForm form)
		{
		
			// retrieve invoices
			ArrayList invoices = form.getInvoices();
			
			// retrieve invoice Header
			ArrayList invoiceHeaders = form.getInvoiceHeader();
			InvoiceHeaderVO invoiceHeader = (InvoiceHeaderVO) invoiceHeaders.get(0);

			// retrieve vat rate from fiannce division
			FinanceDivisionBO financeDivisionBo = new FinanceDivisionBO();
			FinanceDivisionVO financeDivsionVo = financeDivisionBo.getFinanceDivision(invoiceHeader.getFinanceDivision());
			String vatRate = financeDivsionVo.getVatRate();
			
			// calculate amounts
			int oneHundred = 100;
			double vatRate1 = Double.parseDouble(vatRate) / oneHundred;

			// initialise totals
			double totalNetAmount = 0;
			double totalVatAmount = 0;
			double totalGrossAmount = 0;

			// calulate vat and gross
			for (int i = 0; i < invoices.size(); i++)
			{
				InvoiceLineVO invoice = (InvoiceLineVO) invoices.get(i);
				
				if (!invoice.getInvoiceNetAmount().equals(""))
				{
					double net = Double.parseDouble(invoice.getInvoiceNetAmount());

					double vat = net  * vatRate1;
					double gross = net + vat;

					invoice.setInvoiceVatAmount(formatAmount(vat));
					invoice.setInvoiceGrossAmount(formatAmount(gross));

					totalNetAmount = totalNetAmount + net;
					totalVatAmount = totalVatAmount + vat;
					totalGrossAmount = totalGrossAmount + gross;
				}
			}
		
			invoiceHeader.setTotalNetAmount(formatAmount(totalNetAmount));
			invoiceHeader.setTotalVatAmount(formatAmount(totalVatAmount));
			invoiceHeader.setTotalGrossAmount(formatAmount(totalGrossAmount));
			invoiceHeader.setComments(form.getComments());
		}


	public String formatAmount(double amount)
	{
		DecimalFormat form = new DecimalFormat("#0.00");
		String amount1 = form.format(amount);
		
		if (amount1.equalsIgnoreCase("-0.00"))
		{
			amount1 = "0.00";
		}

		return amount1;
	}

	/**
	 * check if the invoice no already exists for the client (Regular payment only)
	 * 
	 * @param client
	 * @param invoiceNo
	 * @return true or false
	 */
	public boolean doesInvoiceNoAlreadyExist(String client, String invoiceNo)
	{
		InvoiceHeaderDAO invoiceHeaderDao = new InvoiceHeaderDAO();

		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBACCN", client);
		searchCriteria.put("MBIVNO", invoiceNo);

		List results = invoiceHeaderDao.findByCriteria(searchCriteria, null);

		if (results.size() > 0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	/**
	 * check if the invoice no already exists for the client (Regular payment only)
	 * 
	 * @param client
	 * @param invoiceNo
	 * @return true or false
	 */
	public boolean doesInvoiceNoAlreadyExistID(String client, String sysGenInvoiceID)
	{
		InvoiceHeaderDAO invoiceHeaderDao = new InvoiceHeaderDAO();

		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBACCN", client);
		searchCriteria.put("MBIVID", sysGenInvoiceID);

		List results = invoiceHeaderDao.findByCriteria(searchCriteria, null);

		if (results.size() > 0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	
		/**
		 * get invoice header
		 * 
		 * @param client
		 * @param System Generated ID
		 * @return invoice header
		 */
		public List getInvoiceHeader(String xx,String adaytumAccountName, String sysGenInvID)
		{
			InvoiceHeaderDAO invoiceHeaderDao = new InvoiceHeaderDAO();

			HashMap searchCriteria = new HashMap();
			searchCriteria.put("MBACCN", adaytumAccountName);
			searchCriteria.put("MBIVID", sysGenInvID);

			List results = invoiceHeaderDao.findByCriteria(searchCriteria, null);
		
			if (results.size() < 1)
			{
				logger.warn("ERROR: invoice NOT found");
			}
			else if (results.size() > 1)
			{
				logger.warn("ERROR: number of invoices found > 1: " + results.size());
			}
			else
			{
				logger.debug("OK: invoice found");		
			}

			return results;
		}
	/**
	 * get invoice header
	 * 
	 * @param client
	 * @param System Generated ID
	 * @return invoice header
	 */
	public List getInvoiceHeader(String sysGenInvID)
	{
		InvoiceHeaderDAO invoiceHeaderDao = new InvoiceHeaderDAO();

		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBIVID", sysGenInvID);

		List results = invoiceHeaderDao.findByCriteria(searchCriteria, null);
		
		if (results.size() < 1)
		{
			logger.warn("ERROR: invoice NOT found");
		}
		else if (results.size() > 1)
		{
			logger.warn("ERROR: number of invoices found > 1: " + results.size());
		}
		else
		{
			logger.info("OK: invoice found");		
		}

		return results;
	}

	/**
			 * get 24 invoice lines
			 * 
			 * @param client
			 * @param invoiceNo
			 * @return invoice lines
			 */
	public List getInvoiceLines(String adaytumAccountName, String sysGenInvID)
	{
		
		InvoiceLine1DAO invoiceLine1Dao = new InvoiceLine1DAO();

		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBIVID", sysGenInvID);
		HashMap sortCriteria = new HashMap();
		sortCriteria.put("MBIVLN", "ASC");

		List results = invoiceLine1Dao.findByCriteria(searchCriteria, sortCriteria);
		
		if (results.size() < 1)
		{
			logger.info("ERROR: invoice NOT found");
		}
			
		// Fill in blank lines (ie if an invoice has been deleted in a line multiple invoice
		InvoiceLineVO invoiceLineX = (InvoiceLineVO) results.get(0);
		for (int i = 0; i < 24 ; i++)
				{
					if (i < results.size())
					{
					invoiceLineX = (InvoiceLineVO) results.get(i);
					}
					
					if (i +1 < Integer.parseInt(invoiceLineX .getInvoiceLineNo()))
					{
				
					String invoiceNo = Integer.toString(i + 1);

									if (i+1 < 10)
									{
										invoiceNo = "0" + (i + 1);
									}
											
					InvoiceLineVO invoice = new InvoiceLineVO();
					invoice.setInvoiceLineNo(invoiceNo);
					invoice.setInvoiceNetAmount("");
					invoice.setInvoiceVatAmount(null);
					invoice.setInvoiceGrossAmount(null);
					invoice.setPaymentType("");
					invoice.setInvoicePeriodMonth("");
					invoice.setInvoicePeriodYear("");
					invoice.setStatus("");
							
					results.add(i, invoice);
					}
				}
		// Add remaining blank invoice lines to total 24 set-up invoice lines		
		for (int i = results.size(); i < 24 ; i++)
				{
					String invoiceNo = Integer.toString(i + 1);
					if (i+1 < 10)
					{
					invoiceNo = "0" + (i + 1);
					}
											
					InvoiceLineVO invoice = new InvoiceLineVO();
					invoice.setInvoiceLineNo(invoiceNo);
					invoice.setInvoiceNetAmount("");
					invoice.setInvoiceVatAmount(null);
					invoice.setInvoiceGrossAmount(null);
					invoice.setPaymentType("");
					invoice.setInvoicePeriodMonth("");
					invoice.setInvoicePeriodYear("");
					invoice.setStatus("");
						
					results.add(i, invoice);
			
				}
	return results;
	}
	
	/**
				 * get invoice lines
				 * 
				 * @param client
				 * @param invoiceNo
				 * @return invoice lines
				 */
		public List getInvoiceLine(String accountName, String invoiceYear, String invoiceMonth,  String paymentType )
		{
			logger.debug("InvoiceBO.getInvoiceLine start with accountName/InvoiceYear/invoiceMonth:" +
					accountName + "/" + 
					invoiceYear + "/" +
					invoiceMonth); 
			InvoiceLine1DAO invoiceLine1Dao = new InvoiceLine1DAO();

			HashMap searchCriteria = new HashMap();
			searchCriteria.put("MBACCN", accountName);
			searchCriteria.put("MBIPYY", invoiceYear);
			searchCriteria.put("MBIPMM", invoiceMonth);
			if (!paymentType.equalsIgnoreCase("ALL"))
			{
				searchCriteria.put("MBPAYT", paymentType);
			}

			List results = new ArrayList();
			try
			{
			results = invoiceLine1Dao.findByCriteria(searchCriteria, null);
			}
			catch (Exception e)
			{
				logger.error("InvoiceBO.getInvoiceLine Error with:" +
						accountName + "/" + 
						invoiceYear + "/" +
						invoiceMonth); 
				e.printStackTrace();
			}
			if (results.size() < 1)
			{
				logger.debug("ERROR: invoice NOT found");
			}
				
		return results;
		}
		
	/**
					 * get invoice lines
					 * 
					 * @param client
					 * @param invoiceNo
					 * @return invoice lines
					 */
			public List getInvoiceLine(String accountName, String paymentType )
			{
		
				InvoiceLine1DAO invoiceLine1Dao = new InvoiceLine1DAO();

				HashMap searchCriteria = new HashMap();
				searchCriteria.put("MBACCN", accountName);
				searchCriteria.put("MBPAYT", paymentType);
				
				HashMap sortCriteria = new HashMap();
				sortCriteria.put("MBIPYY", "ASC");
				sortCriteria.put("MBIPMM", "ASC");

				List results = invoiceLine1Dao.findByCriteria(searchCriteria, null);
		
				if (results.size() < 1)
				{
					logger.debug("ERROR: invoice NOT found");
				}
				
			return results;
			}

			/**
			 * get invoice lines
			 * 
			 * @param client
			 * @param invoiceNo
			 * @return invoice lines
			 */
			public List getInvoiceLine(String sysGenInvID)
			{
		
				InvoiceLine1DAO invoiceLine1Dao = new InvoiceLine1DAO();

				HashMap searchCriteria = new HashMap();
				searchCriteria.put("MBIVID", sysGenInvID);
				
				HashMap sortCriteria = new HashMap();
				sortCriteria.put("MBIVLN", "ASC");
				
				List results = invoiceLine1Dao.findByCriteria(searchCriteria, sortCriteria);
		
				if (results.size() < 1)
				{
					logger.debug("ERROR: invoice NOT found");
				}
				
			return results;
			}
			
	/**
	 * get invoice lines
	 * 
	 * @param client
	 * @param invoiceNo
	 * @return invoice lines
	 */
	public List getInvLine(String invoiceId, String LineNo)
	{
		
		InvoiceLine1DAO invoiceLine1Dao = new InvoiceLine1DAO();

		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBIVID", invoiceId);
		searchCriteria.put("MBIVLN", LineNo);
				
		HashMap sortCriteria = new HashMap();
		sortCriteria.put("MBIVLN", "ASC");
				
		List results = invoiceLine1Dao.findByCriteria(searchCriteria, sortCriteria);
		
		if (results.size() < 1)
		{
			logger.debug("ERROR: invoice NOT found");
		}
				
	return results;
	}
	/**
	 * get invoice lines
	 * 
	 * @param client
	 * @param invoiceNo
	 * @return invoice lines
	 */
	public List getInvLines(String invoiceId)
	{
		
		InvoiceLine1DAO invoiceLine1Dao = new InvoiceLine1DAO();

		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBIVID", invoiceId);
				
		List results = invoiceLine1Dao.findByCriteria(searchCriteria, null);
		
		if (results.size() < 1)
		{
			logger.debug("ERROR: invoice NOT found");
		}
				
	return results;
	}

	
	/**
	 * This method will increment the next system generated invoice id
	 * 
	 * @deprecated Use stored procedure method instead
	 */	
	public synchronized String incrementNextInvoiceId()
	{
		String system = ConfigPropertiesMgr.getInstance().getSystem();
		//String system = "WIMB400"; // system name
		//String user = "WSUSER"; // user id
		//String password = "WSUSER"; // password

		logger.debug("starting...");
		
		int nextInvoiceId = 0;

		try
		{

			// wait for data area to be updated
			while (busy == true)
			{

			}

			// lock data area
			busy = true;

			// Establish a connection to the AS400.
			AS400 as400 = new AS400(system, USER, PASSWORD);

			// Create a DecimalDataArea object.
			QSYSObjectPathName path =
				new QSYSObjectPathName(DTAARA_LIBRARY, DTAARA_NAME, DTAARA_TYPE);
			DecimalDataArea dataArea =
				new DecimalDataArea(as400, path.getPath());

			// Read from the data area.
			BigDecimal data = dataArea.read();

			// increment next Invoice id
			nextInvoiceId = data.intValue();
		
			logger.info ("Next Invoice Id: " + nextInvoiceId);

			// Clear the data area.
			dataArea.clear();

			// update the data area.
			dataArea.write(new BigDecimal(nextInvoiceId + 1));

			// unlock data area
			busy = false;

			logger.debug("Lock released");

		} //try

		catch (ConnectionDroppedException e)
		{


		} //catch

		catch (ServerStartupException e)
		{


		} //catch

		catch (UnknownHostException e)
		{


		} //catch

		catch (AS400SecurityException e)
		{


		} //catch

		catch (ErrorCompletingRequestException e)
		{


		} //catch

		catch (IllegalObjectTypeException e)
		{

		} //catch

		catch (InterruptedException e)
		{


		} //catch

		catch (IOException e)
		{



		} //catch

		catch (ObjectDoesNotExistException e)
		{


		} //catch
		
		//add leading zeros
		//DGDataManipulation data = new DGDataManipulation();
		
		String nextInvoiceNo ="";

		return nextInvoiceNo;

	}

	/**
	 * This method fetches and increments the next system generated invoice id
	 * via a stored procedure<br>
	 */
	public synchronized Integer incrementNextInvoiceIdProc()
	{
		logger.debug("Getting Next Invoice Id via stored proc ...");		
		
		Integer nextInvoiceNo = null;
		
		IncrementNextInvoiceIdProcedureDAO incrementNextInvoiceIdProcedureDAO = new IncrementNextInvoiceIdProcedureDAO();
		
		try {
		    List invNumberList  = incrementNextInvoiceIdProcedureDAO.callProcedure(null);
		    if (null != invNumberList && !invNumberList.isEmpty())
		    {
			nextInvoiceNo = (Integer)invNumberList.get(0);
		    }
		} catch (SQLException e) {		    
		    logger.error("Failed to get next invoice id : ",e);		    
		}	
		
		return nextInvoiceNo;

	}
	

	/**
	 * retrieve a list of all unauthorised invoices
	 * 
	 * @return
	 */
	public List getUnauthorisedInvoices()
	{
		UnauthorisedInvoicesDAO unauthorisedInvoicesDao = new UnauthorisedInvoicesDAO();
		
		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBSTAT", INVOICE_STATUS_NEW_ENTRY);
		
		HashMap sortCriteria = new HashMap();
		sortCriteria.put("MBIVID", "ASC");
		
		List unauthorisedInvoices = unauthorisedInvoicesDao.findByCriteria(searchCriteria, sortCriteria);
		
		return unauthorisedInvoices;
	}
	
	/**
		 * retrieve a list of all unauthorised invoices
		 * 
		 * @return
		 */
		public List getInvoiceEditableInvoicesAllAccounts()
		{
			InvoiceHeader1DAO invoiceHeader1Dao = new InvoiceHeader1DAO();

			HashMap searchCriteria = new HashMap();
//			searchCriteria.put("MBSTAT", INVOICE_STATUS_NEW_ENTRY);
			String searchString2 = "<" + INVOICE_STATUS_AWAITING_TRANSFER;
			searchCriteria.put("MBSTAT", searchString2);
			HashMap sortCriteria = new HashMap();
//			sortCriteria.put("MBIVID", "ASC");
			sortCriteria.put("MBIVNO", "ASC");

			List invoiceEditInvoices = invoiceHeader1Dao.findByCriteria(searchCriteria, sortCriteria);
					
			return invoiceEditInvoices;
		}
		
		/**
		 * retrieve a list of all unauthorised invoices
		 * 
		 * @return
		 */
		public List getInvoiceEditableInvoicesSingleAccount(String AccountName)
		{
			InvoiceHeaderDAO invoiceHeaderDao = new InvoiceHeaderDAO();

			HashMap searchCriteria = new HashMap();
			searchCriteria.put("MBACCN", AccountName);
			String searchString2 = "<" + INVOICE_STATUS_AWAITING_TRANSFER;
			searchCriteria.put("MBSTAT", searchString2);					
			HashMap sortCriteria = new HashMap();
			sortCriteria.put("MBIVNO", "ASC");

			List invoiceEditInvoices = invoiceHeaderDao.findByCriteria(searchCriteria, sortCriteria);
					
			return invoiceEditInvoices;
		}

		/**
		 * retrieve a list of invoices for the Invoices Search Screen
		 * 
		 * @return
		 */
			public List getSearchInvoices(InvoicesSearchSearchSortVO invoicesSearchSearchSortVO, String SearchToInclude, HttpSession session)
			{
				logger.debug("InvoiceBO//////.getSearchInvoices start");
				
				String currentMonth = (String) session.getAttribute("currentMonth"); 
				String currentYear = (String) session.getAttribute("currentYear"); 
				String searchString = "";
				HashMap searchCriteria = new HashMap();
				HashMap sortCriteria = new HashMap();
				if (!invoicesSearchSearchSortVO.getAccountName().equalsIgnoreCase("reset"))
						{searchCriteria.put("MBACCN", invoicesSearchSearchSortVO.getAccountName());}
				if (!invoicesSearchSearchSortVO.getAccountHandler().equalsIgnoreCase("reset"))
				
						{searchCriteria.put("MBACCH", invoicesSearchSearchSortVO.getAccountHandler());}
				if (!invoicesSearchSearchSortVO.getAccountManager().equalsIgnoreCase("reset"))
						{searchCriteria.put("MBACCM", invoicesSearchSearchSortVO.getAccountManager());}
				if (!invoicesSearchSearchSortVO.getInvoicePeriodByMMFrom().equalsIgnoreCase("reset"))
						{
							searchString = "BETWEEN" + invoicesSearchSearchSortVO.getInvoicePeriodByYYFrom() +
							invoicesSearchSearchSortVO.getInvoicePeriodByMMFrom() + 
							"&" + 
							invoicesSearchSearchSortVO.getInvoicePeriodByYYTo() + 
							invoicesSearchSearchSortVO.getInvoicePeriodByMMTo();
							searchCriteria.put("MBIPYM", searchString);	
						}
				if (!invoicesSearchSearchSortVO.getInvoicePeriodMM().equalsIgnoreCase("reset"))
						{searchCriteria.put("MBIPMM", invoicesSearchSearchSortVO.getInvoicePeriodMM());}
				if (!invoicesSearchSearchSortVO.getInvoicePeriodYY().equalsIgnoreCase("reset"))
						{searchCriteria.put("MBIPYY", invoicesSearchSearchSortVO.getInvoicePeriodYY());}
				if (!invoicesSearchSearchSortVO.getInvoicePeriod().equalsIgnoreCase("reset"))
						{
							int currentYearI = Integer.parseInt(currentYear);
							int previousYearI = currentYearI - 1;
							String previousYear = Integer.toString(previousYearI);
							if (previousYear.length() == 1)
							{
								previousYear = "0" + previousYear;
							}
							if(invoicesSearchSearchSortVO.getInvoicePeriod().equalsIgnoreCase("CM")) 
							{
								searchCriteria.put("MBIPYY", currentYear);
								searchCriteria.put("MBIPMM", currentMonth);
							}
							if(invoicesSearchSearchSortVO.getInvoicePeriod().equalsIgnoreCase("12")) 
							{
								searchString = "BETWEEN" + previousYear + currentMonth + "&" + currentYear + currentMonth;
								searchCriteria.put("MBIPYM", searchString);	
							}
							if(invoicesSearchSearchSortVO.getInvoicePeriod().equalsIgnoreCase("<=CM")) 
							{
								searchString = "<="  + currentYear + currentMonth;
								searchCriteria.put("MBIPYM", searchString);	
							}

						}
				if (!invoicesSearchSearchSortVO.getStatus().equalsIgnoreCase("reset"))
						{
							if (invoicesSearchSearchSortVO.getStatus().equalsIgnoreCase("UN"))
							{
								searchCriteria.put("MBSTAT", BUDGET_LINE_UNSUBMITTED);
							}
							else
							{
								searchCriteria.put("MBSTA1", invoicesSearchSearchSortVO.getStatus());
							}
						}
				if (!invoicesSearchSearchSortVO.getInvoiceId().equalsIgnoreCase("reset"))
						{
							String invoiceIdLineNo = invoicesSearchSearchSortVO.getInvoiceId();
							int length = invoiceIdLineNo.length();
							searchCriteria.put("MBIVID", invoiceIdLineNo.substring(0, length - 2));
							searchCriteria.put("MBIVLN", invoiceIdLineNo.substring(length - 2));
						}
				if (!invoicesSearchSearchSortVO.getInvoiceNo().equalsIgnoreCase("reset"))
						{searchCriteria.put("MBIVNO", invoicesSearchSearchSortVO.getInvoiceNo());}	

				//SORT				
				if (invoicesSearchSearchSortVO.getSortBy().equalsIgnoreCase("reset")
					|| invoicesSearchSearchSortVO.getSortBy().equalsIgnoreCase("MBIVID"))
				{
					sortCriteria.put("MBIVID", "ASC");
				}
				else
				{
						sortCriteria.put(invoicesSearchSearchSortVO.getSortBy(), "ASC");
				}

				List searchInvoices = new ArrayList();	
				if (invoicesSearchSearchSortVO.getStatus().equalsIgnoreCase("UN"))	
				{
					InvoiceBudgetUnsubmittedDAO invoiceBudgetUnsubmittedDao = new InvoiceBudgetUnsubmittedDAO();
					searchInvoices = invoiceBudgetUnsubmittedDao.findByCriteria(searchCriteria, sortCriteria);		
				}
				else if (SearchToInclude.equalsIgnoreCase("UW") || invoicesSearchSearchSortVO.getStatus().equalsIgnoreCase("UW"))	
				{
					InvoiceBudgetUwDAO invoiceBudgetUwDao = new InvoiceBudgetUwDAO();
					searchInvoices = invoiceBudgetUwDao.findByCriteria(searchCriteria, sortCriteria);		
				}
				else if (SearchToInclude.equalsIgnoreCase("SS")  || invoicesSearchSearchSortVO.getStatus().equalsIgnoreCase("SS"))	
				{
					InvoiceBudgetSsDAO invoiceBudgetSsDao = new InvoiceBudgetSsDAO();
					searchInvoices = invoiceBudgetSsDao.findByCriteria(searchCriteria, sortCriteria);	
				}
				else	
				{
					InvoiceBudgetDAO invoiceBudgetDao = new InvoiceBudgetDAO();
					searchInvoices = invoiceBudgetDao.findByCriteria(searchCriteria, sortCriteria);		
				}
				
				logger.debug("InvoiceBO.getSearchInvoices end with searchInvoices size:" +
						searchInvoices.size());
				return searchInvoices;
			}
			
			/**
			 * authorise Invoice
			 * 
			 * @return
			 */
			public int authoriseInvoice(InvoiceBudgetVO invoiceBudgetVo)
			{
				int noOfFilesUpdated = 0;
				
				//update invoice line
				InvoiceLineDAO invoiceLineDao = new InvoiceLineDAO();
//				invoiceLineDao.;
				
				//if rejected 	- update all invoice lines
				//				- update invoice header	
				
				return noOfFilesUpdated;
			}
	/**
		 * retrieve a list of all unauthorised invoices
		 * 
		 * @return
		 */
		public List getInvoicesTransferInProgress()
		{
			InvoiceBudgetDAO invoiceBudgetDao = new InvoiceBudgetDAO();
			HashMap searchCriteria = new HashMap();
			searchCriteria.put("MBSTA1", INVOICE_STATUS_AWAITING_TRANSFER);
					
			HashMap sortCriteria = new HashMap();
			sortCriteria.put("MBIVID", "ASC");
			//sortCriteria.put("MBIVLN", "ASC");
			List invoicesTransferInProgress = new ArrayList();
			invoicesTransferInProgress = invoiceBudgetDao.findByCriteria(searchCriteria, sortCriteria);
					
			return invoicesTransferInProgress;
		}
	/**
		 * retrieve a list of all unauthorised invoices
		 * 
		 * @return
		 */
		public List getInvoicesTransferError()
		{
			InvoiceBudgetDAO invoiceBudgetDao = new InvoiceBudgetDAO();
			HashMap searchCriteria = new HashMap();
			searchCriteria.put("MBSTA1", INVOICE_STATUS_TRANSFER_ERROR);
					
			HashMap sortCriteria = new HashMap();
			sortCriteria.put("MBIVID", "ASC");
			//sortCriteria.put("MBIVLN", "ASC");
			List invoicesTransferError = new ArrayList();
			invoicesTransferError = invoiceBudgetDao.findByCriteria(searchCriteria, sortCriteria);
					
			return invoicesTransferError;
		}
		
	/**
		 * retrieve a list of all unauthorised invoices
		 * 
		 * @return
		 */
		public List getInvoicesValidateInProgress()
		{
			InvoiceBudgetDAO invoiceBudgetDao = new InvoiceBudgetDAO();
			HashMap searchCriteria = new HashMap();
			searchCriteria.put("MBSTA1", INVOICE_STATUS_AWAITING_VALIDATION);
					
			HashMap sortCriteria = new HashMap();
			sortCriteria.put("MBIVID", "ASC");
			//sortCriteria.put("MBIVLN", "ASC");
			List invoicesValidateInProgress = new ArrayList();
			invoicesValidateInProgress = invoiceBudgetDao.findByCriteria(searchCriteria, sortCriteria);
					
			return invoicesValidateInProgress;
		}
	/**
		 * retrieve a list of all unauthorised invoices
		 * 
		 * @return
		 */
		public List getInvoicesValidateError()
		{
			InvoiceBudgetDAO invoiceBudgetDao = new InvoiceBudgetDAO();
			HashMap searchCriteria = new HashMap();
			searchCriteria.put("MBSTA1", INVOICE_STATUS_VALIDATION_ERROR);
					
			HashMap sortCriteria = new HashMap();
			sortCriteria.put("MBIVID", "ASC");
			//sortCriteria.put("MBIVLN", "ASC");
			List invoicesValidateError = new ArrayList();
			invoicesValidateError = invoiceBudgetDao.findByCriteria(searchCriteria, sortCriteria);
					
			return invoicesValidateError;
		}

	/**
	 * retrieve budget header details for a client
	 * 
	 * @param client
	 * @return BudgetHeaderVO
	 */
	public List getBudgetLinesEditable(String client)
	{
		InvoiceBudgetBudgetLinesExcAdjDAO invoiceBudgetBudgetLinesExcAdjDao = new InvoiceBudgetBudgetLinesExcAdjDAO();

		List results = new ArrayList();
		
		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBACCN", client);
		String searchString2 = "<>" + BUDGET_LINE_TRANSFERRED;
		searchCriteria.put("MBSTAT", searchString2);
		HashMap sortCriteria = new HashMap();
		sortCriteria.put("MBIPYM", "ASC");
		try
		{
		results = invoiceBudgetBudgetLinesExcAdjDao.findByCriteria(searchCriteria, null);
		}
		catch (Exception e)
		{
			logger.error(" ERROR InvoiceBO.getBudgetLinesEditable:" + client);
			e.printStackTrace();
		}
		logger.debug("InvoiceBO.getBudgetLinesEditable end");
		return results;
	}
	
	/**
	 * retrieve budget header details for a client
	 * 
	 * @param client
	 * @return BudgetHeaderVO
	 */
	public List getBudgetLinesAudit(String client)
	{
		InvoiceBudgetAllBudgetLinesDAO invoiceBudgetAllBudgetLinesDao = new InvoiceBudgetAllBudgetLinesDAO();
		List results = new ArrayList();
		
		HashMap searchCriteria = new HashMap();
		searchCriteria.put("MBACCN", client);
		HashMap sortCriteria = new HashMap();
		sortCriteria.put("MBIPYM", "ASC");
		try
		{
		results = invoiceBudgetAllBudgetLinesDao.findByCriteria(searchCriteria, null);
		}
		catch (Exception e)
		{
			logger.error("InvoiceBO.getBudgetLinesAudit Exception : " + client);
			e.printStackTrace();
		}
		return results;
	}
	
	/**
	 * retrieve budget header details for a client
	 * 
	 * @param client
	 * @return BudgetHeaderVO
	 */
	public boolean deleteInvoice(String accountName, String InvoiceId, String formComments, ActionErrors errors, HttpSession session)
	{
		String fullName = (String) session.getAttribute("fullName");
		InvoiceLine1DAO invoiceLineDao = new InvoiceLine1DAO();
		InvoiceHeaderDAO invoiceHeaderDao = new InvoiceHeaderDAO();
		InvoiceAuditBO  invoiceAuditBo = new InvoiceAuditBO();
		BudgetLineBO  budgetLineBo = new BudgetLineBO();
		String comments = "";
		String year = "";
		String month = "";
		boolean success = true;
		
		// get invoices & delete
		List invoiceLines = getInvLines(InvoiceId);
		for (int i = 0; i < invoiceLines.size(); i++)
		{
			InvoiceLineVO invoiceLineVo = (InvoiceLineVO) invoiceLines.get(i);	
	
			//store accountName, year & month for budget line update
			accountName = invoiceLineVo.getAccountName();
			month = invoiceLineVo.getInvoicePeriodMonth();
			year = invoiceLineVo.getInvoicePeriodYear();
			
			// delete record
			int noOfRecords = invoiceLineDao.delete(invoiceLineVo);
			if (noOfRecords > 0)
			{
				comments = "";	
				if (formComments == null)
					{comments = "Invoice DELETED";}
				else if (formComments.equals(""))
					{comments = "Invoice DELETED";}
				else
					{comments = formComments;}	
					//create audit for header & invoice line
					UtilityBO utilityBo = new UtilityBO();			
					comments = "Invoice Id: " + invoiceLineVo.getSystemInvoiceNo() + invoiceLineVo.getInvoiceLineNo() + ". Net Amount: " 
					+ invoiceLineVo.getInvoiceNetAmount() + " VAT Amount: " + invoiceLineVo.getInvoiceVatAmount()+ "Gross Amount: " + invoiceLineVo.getInvoiceGrossAmount()
					+ " Payment Type: " + invoiceLineVo.getPaymentType() + " Invoice Period: " + invoiceLineVo.getInvoicePeriodMonth() + "/20" + invoiceLineVo.getInvoicePeriodYear() 
					+ " Last Status: " + invoiceLineVo.getStatusFormatted() + ". " + comments;
					invoiceAuditBo.updateAuditFile(invoiceLineVo, INVOICE_STATUS_DELETED_BY_ACCOUNTS, comments, fullName);					
			
				// reset budgetLine to unsubmitted
				int noOfRecordsBL = budgetLineBo.updateBudgetLineStatus(accountName, year, month ,BUDGET_LINE_UNSUBMITTED);
			}
			else
			{
				errors.add(
						"processError",
						new org.apache.struts.action.ActionError(
							"error.process.text"));	
			}
		}
		
		// get invoice header & delete
		List invoiceHeaders = getInvoiceHeader(InvoiceId);
		InvoiceHeaderVO invoiceHeaderVo = (InvoiceHeaderVO)  invoiceHeaders.get(0);

		int noOfRecords = invoiceHeaderDao.delete(invoiceHeaderVo);
		if (noOfRecords > 0)
		{
			comments = "";	
			if (formComments == null)
				{comments = "Invoice DELETED";}
			else if (formComments.equals(""))
				{comments = "Invoice DELETED";}
			else
				{comments = formComments;}	
				//create audit to for header & invoice line
				UtilityBO utilityBo = new UtilityBO();			
				comments = "Invoice Id: " + invoiceHeaderVo.getSystemInvoiceId() + ". " + comments;
				InvoiceLineVO invoiceLineVo = new InvoiceLineVO();
				invoiceLineVo.setAccountName(invoiceHeaderVo.getAccountName());
				invoiceLineVo.setSystemInvoiceNo(invoiceHeaderVo.getSystemInvoiceId());
				invoiceLineVo.setInvoiceLineNo("00");
				invoiceAuditBo.updateAuditFile(invoiceLineVo, INVOICE_STATUS_DELETED_BY_ACCOUNTS, comments, fullName);
		}
		else
		{
			errors.add(
					"processError",
					new org.apache.struts.action.ActionError(
						"error.process.text"));	
		}
				
		return success ;
	}

	/**
	 * get list of invoice Numbers
	 * 
	 * @param selection	-	
	 * @return BudgetHeaderVO
	 * 
	 */
	public List getInvoiceNumbers()
	{
		logger.debug("InvoiceBO.getInvoiceNumbers start");
		// retrieve client details
		List invoiceNumbers = new ArrayList();
		String invoiceNumber = "";
		
		List invoiceLines = getAllInvoices("MBIVNO");
		logger.debug("InvoiceBO.getInvoiceNumbers after getAllInvoices: invoiceLines");
		logger.debug("InvoiceBO.getInvoiceNumbers invoiceLines size:" + invoiceLines.size());
		for (int i = 0; i < invoiceLines.size(); i++)
		{
			InvoiceBudgetVO invoiceBudgetVo = (InvoiceBudgetVO) invoiceLines.get(i);
			if (!invoiceBudgetVo.getInvoiceNo().equalsIgnoreCase(invoiceNumber))
			{
				InvoiceNumberVO invoiceNumberVo = new InvoiceNumberVO();
				invoiceNumberVo.setInvoiceNo(invoiceBudgetVo.getInvoiceNo());
				invoiceNumbers.add(invoiceNumberVo);
			}
			invoiceNumber = invoiceBudgetVo.getInvoiceNo();
		}
		logger.debug("InvoiceBO.getInvoiceNumbers end, size:" + invoiceNumbers.size());
		return invoiceNumbers;
	}
	
	/**
	 * get list of invoice Numbers
	 * 
	 * @param selection	-	
	 * @return BudgetHeaderVO
	 * 
	 */
	public List getInvoiceIds()
	{
		// retrieve client details
		List invoiceIds = new ArrayList();
		String invoiceIdLineNo = "";
		
		List invoiceLines = getAllInvoices("MBIVID");
		
		for (int i = 0; i < invoiceLines.size(); i++)
		{
			InvoiceBudgetVO invoiceBudgetVo = (InvoiceBudgetVO) invoiceLines.get(i);
			if (!invoiceBudgetVo.getInvoiceIdLineNo().equalsIgnoreCase(invoiceIdLineNo))
			{
				InvoiceIdVO invoiceIdVo = new InvoiceIdVO();
				invoiceIdVo.setInvoiceIdLineNo(invoiceBudgetVo.getInvoiceIdLineNo());
				invoiceIds.add(invoiceIdVo);
			}
			invoiceIdLineNo = invoiceBudgetVo.getInvoiceIdLineNo();
		}
		return invoiceIds;
	}
	
	/**
	 * get list of invoice Numbers
	 * 
	 * @param selection	-	
	 * @return BudgetHeaderVO
	 * 
	 */
	public List getInvoiceNumbersAHMUSR(String role, String userInitials, String userType, String sortBy)
	{
		
		// retrieve client details
		List invoiceNumbers = new ArrayList();
		String invoiceNumber = "";
		
		List invoiceLines = getAllInvoicesAHMUSR(role, userInitials, userType, sortBy);

		for (int i = 0; i < invoiceLines.size(); i++)
		{
			InvoiceBudgetVO invoiceBudgetVo = (InvoiceBudgetVO) invoiceLines.get(i);
			if (!invoiceBudgetVo.getInvoiceNo().equalsIgnoreCase(invoiceNumber))
			{
				InvoiceNumberVO invoiceNumberVo = new InvoiceNumberVO();
				invoiceNumberVo.setInvoiceNo(invoiceBudgetVo.getInvoiceNo());
				invoiceNumbers.add(invoiceNumberVo);
			}
			invoiceNumber = invoiceBudgetVo.getInvoiceNo();
		}
		List InvoiceNo = invoiceNumbers;
		return invoiceNumbers;
	}
	
	/**
	 * get list of invoice Numbers
	 * 
	 * @param selection	-	
	 * @return BudgetHeaderVO
	 * 
	 */
	public List getInvoiceIdsAHMUSR(String role, String userInitials, String userType, String sortBy)
	{
		
		// retrieve client details
		List invoiceIds = new ArrayList();
		String invoiceIdLineNo = "";
		
		List invoiceLines = getAllInvoicesAHMUSR(role, userInitials, userType, sortBy);

		for (int i = 0; i < invoiceLines.size(); i++)
		{
			InvoiceBudgetVO invoiceBudgetVo = (InvoiceBudgetVO) invoiceLines.get(i);
			if (!invoiceBudgetVo.getInvoiceIdLineNo().equalsIgnoreCase(invoiceIdLineNo))
			{
				InvoiceIdVO invoiceIdVo = new InvoiceIdVO();
				invoiceIdVo.setInvoiceIdLineNo(invoiceBudgetVo.getInvoiceIdLineNo());
				invoiceIds.add(invoiceIdVo);

			}
			invoiceIdLineNo = invoiceBudgetVo.getInvoiceIdLineNo();
		}
		return invoiceIds;
	}

	/**
	 * retrieve a list of all invoices
	 * 
	 * @return
	 */
	public List getInvoicesAll(String sortBy)
	{
		InvoiceHeaderDAO invoiceHeaderDao = new InvoiceHeaderDAO();
		HashMap sortCriteria = new HashMap();
		sortCriteria.put(sortBy, "ASC");
		List invoicesAll = invoiceHeaderDao.findByCriteria(null, sortCriteria);
		return invoicesAll;
	}

	/**
	 * retrieve a list of all invoices
	 * 
	 * @return
	 */
	public List getAllInvoicesAHMUSR(String role, String userInitials, String userType, String sortBy)
	{
		InvoiceBudgetDAO invoiceBudgetDao = new InvoiceBudgetDAO();
		HashMap searchCriteria = new HashMap();
		HashMap sortCriteria = new HashMap();
				
		if (userType.equalsIgnoreCase("AH"))
			{
				searchCriteria.put("MBACCH", userInitials);
				sortCriteria.put(sortBy, "ASC");
			}
			else if (userType.equalsIgnoreCase("AM"))
			{
				searchCriteria.put("MBACCM", userInitials);
				sortCriteria.put(sortBy, "ASC");
			}
			else
			{
				searchCriteria.put("MBACCM", "returnNothing");
				sortCriteria.put(sortBy, "ASC");
			}
		
		List invoicesAllAHMUSR = invoiceBudgetDao.findByCriteria(searchCriteria, sortCriteria);
							
		return invoicesAllAHMUSR;
	}
			
	/**
	 * retrieve a list of all invoices
	 * 
	 * @return
	 */
	public List getAllInvoices(String sortBy)
	{
		InvoiceBudgetDAO invoiceBudgetDao = new InvoiceBudgetDAO();
		List invoicesAll = new ArrayList();	
		HashMap sortCriteria = new HashMap();	
		sortCriteria.put(sortBy, "ASC");
		logger.debug("InvoiceBO.getAllInvoices HERE before invoiceBudgetDao.findByCriteria:" +
				sortCriteria.toString());	
		invoicesAll = invoiceBudgetDao.findByCriteria(null, sortCriteria);
		logger.debug("InvoiceBO.getAllInvoices after invoiceBudgetDao.findByCriteria");	
		return invoicesAll;
	}
}
