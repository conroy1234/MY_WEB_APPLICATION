package com.domgen.marketingbudgets.vo;


import com.domgen.data.common.vo.IBaseVO;

/**
 * Value Object for VIEW Unauthorised Invoices
 *  
 * @version	1.0
 * @author 	SIMMR on 13-Jul-05
 */
public class InvoiceBudgetVO implements IBaseVO{

	private String accountName;
	private String smaReference;
	private String accountHandler;
	private String accountManager;
	private String monthlyAgreed;
	private String monthlyAgreedNew;
	private String budgetLineStatus;
	private String amendmentFlag;
	private String invoiceId;
	private String invoiceLineNo;
	private String paymentType;
	private String invoiceMonth;
	private String invoiceYear;
	private String amountNet;
	private String amountVat;
	private String amountGross;
	private String invoiceLineStatus;
	private String numberOfLines;
	private String invoiceNo;
	private String invoiceDate;
	private String entryDate;
	private String approvalFlag;
	private String approverUnderwriting;
	private String approverSalesSupport;
	private String transferError;
	private String financeDivision;
	private String rejectedByOriginal;
	private String invoicePeriodYearMonth;
	
	private String budgetLineStatusText;
	private String invoiceLineStatusText;
	private String invoiceIdLineNo;
	private String entryDateFormatted;
	private String invoiceNetMinusAgreed;
	private String invoiceGrossMinusAgreed;
	private String budgetLineEditable;
	/**
	 * @return
	 */
	public String getAccountHandler() {
		return accountHandler;
	}

	/**
	 * @return
	 */
	public String getAccountManager() {
		return accountManager;
	}

	/**
	 * @return
	 */
	public String getAccountName() {
		return accountName;
	}

	/**
	 * @return
	 */
	public String getAmendmentFlag() {
		return amendmentFlag;
	}

	/**
	 * @return
	 */
	public String getAmountGross() {
		return amountGross;
	}

	/**
	 * @return
	 */
	public String getAmountNet() {
		return amountNet;
	}

	/**
	 * @return
	 */
	public String getAmountVat() {
		return amountVat;
	}

	/**
	 * @return
	 */
	public String getApprovalFlag() {
		return approvalFlag;
	}

	/**
	 * @return
	 */
	public String getApproverSalesSupport() {
		return approverSalesSupport;
	}

	/**
	 * @return
	 */
	public String getApproverUnderwriting() {
		return approverUnderwriting;
	}

	/**
	 * @return
	 */
	public String getBudgetLineStatus() {
		return budgetLineStatus;
	}

	/**
	 * @return
	 */
	public String getEntryDate() {
		return entryDate;
	}

	/**
	 * @return
	 */
	public String getInvoiceDate() {
		return invoiceDate;
	}

	/**
	 * @return
	 */
	public String getInvoiceId() {
		return invoiceId;
	}

	/**
	 * @return
	 */
	public String getInvoiceLineNo() {
		return invoiceLineNo;
	}

	/**
	 * @return
	 */
	public String getInvoiceLineStatus() {
		return invoiceLineStatus;
	}

	/**
	 * @return
	 */
	public String getInvoiceMonth() {
		return invoiceMonth;
	}

	/**
	 * @return
	 */
	public String getInvoiceNo() {
		return invoiceNo;
	}

	/**
	 * @return
	 */
	public String getInvoiceYear() {
		return invoiceYear;
	}

	/**
	 * @return
	 */
	public String getMonthlyAgreed() {
		return monthlyAgreed;
	}

	/**
	 * @return
	 */
	public String getNumberOfLines() {
		return numberOfLines;
	}

	/**
	 * @return
	 */
	public String getPaymentType() {
		return paymentType;
	}

	/**
	 * @return
	 */
	public String getSmaReference() {
		return smaReference;
	}

	/**
	 * @return
	 */
	public String getTransferError() {
		return transferError;
	}

	/**
	 * @param string
	 */
	public void setAccountHandler(String string) {
		accountHandler = string;
	}

	/**
	 * @param string
	 */
	public void setAccountManager(String string) {
		accountManager = string;
	}

	/**
	 * @param string
	 */
	public void setAccountName(String string) {
		accountName = string;
	}

	/**
	 * @param string
	 */
	public void setAmendmentFlag(String string) {
		amendmentFlag = string;
	}

	/**
	 * @param string
	 */
	public void setAmountGross(String string) {
		amountGross = string;
	}

	/**
	 * @param string
	 */
	public void setAmountNet(String string) {
		amountNet = string;
	}

	/**
	 * @param string
	 */
	public void setAmountVat(String string) {
		amountVat = string;
	}

	/**
	 * @param string
	 */
	public void setApprovalFlag(String string) {
		approvalFlag = string;
	}

	/**
	 * @param string
	 */
	public void setApproverSalesSupport(String string) {
		approverSalesSupport = string;
	}

	/**
	 * @param string
	 */
	public void setApproverUnderwriting(String string) {
		approverUnderwriting = string;
	}

	/**
	 * @param string
	 */
	public void setBudgetLineStatus(String string) {
		budgetLineStatus = string;
	}

	/**
	 * @param string
	 */
	public void setEntryDate(String string) {
		entryDate = string;
	}

	/**
	 * @param string
	 */
	public void setInvoiceDate(String string) {
		invoiceDate = string;
	}

	/**
	 * @param string
	 */
	public void setInvoiceId(String string) {
		invoiceId = string;
	}

	/**
	 * @param string
	 */
	public void setInvoiceLineNo(String string) {
		invoiceLineNo = string;
	}

	/**
	 * @param string
	 */
	public void setInvoiceLineStatus(String string) {
		invoiceLineStatus = string;
	}

	/**
	 * @param string
	 */
	public void setInvoiceMonth(String string) {
		invoiceMonth = string;
	}

	/**
	 * @param string
	 */
	public void setInvoiceNo(String string) {
		invoiceNo = string;
	}

	/**
	 * @param string
	 */
	public void setInvoiceYear(String string) {
		invoiceYear = string;
	}

	/**
	 * @param string
	 */
	public void setMonthlyAgreed(String string) {
		monthlyAgreed = string;
	}

	/**
	 * @param string
	 */
	public void setNumberOfLines(String string) {
		numberOfLines = string;
	}

	/**
	 * @param string
	 */
	public void setPaymentType(String string) {
		paymentType = string;
	}

	/**
	 * @param string
	 */
	public void setSmaReference(String string) {
		smaReference = string;
	}

	/**
	 * @param string
	 */
	public void setTransferError(String string) {
		transferError = string;
	}

	/**
	 * @return
	 */
	public String getBudgetLineStatusText() {
		return budgetLineStatusText;
	}

	/**
	 * @return
	 */
	public String getInvoiceLineStatusText() {
		return invoiceLineStatusText;
	}

	/**
	 * @param string
	 */
	public void setBudgetLineStatusText(String string) {
		budgetLineStatusText = string;
	}

	/**
	 * @param string
	 */
	public void setInvoiceLineStatusText(String string) {
		invoiceLineStatusText = string;
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
	public String getEntryDateFormatted() {
		return entryDateFormatted;
	}

	/**
	 * @param string
	 */
	public void setEntryDateFormatted(String string) {
		entryDateFormatted = string;
	}

	/**
	 * @return
	 */
	public String getFinanceDivision() {
		return financeDivision;
	}

	/**
	 * @param string
	 */
	public void setFinanceDivision(String string) {
		financeDivision = string;
	}

	/**
	 * @return
	 */
	public String getInvoiceNetMinusAgreed() {
		return invoiceNetMinusAgreed;
	}

	/**
	 * @param string
	 */
	public void setInvoiceNetMinusAgreed(String string) {
		invoiceNetMinusAgreed = string;
	}

	/**
	 * @return
	 */
	public String getInvoiceGrossMinusAgreed() {
		return invoiceGrossMinusAgreed;
	}

	/**
	 * @param string
	 */
	public void setInvoiceGrossMinusAgreed(String string) {
		invoiceGrossMinusAgreed = string;
	}

	/**
	 * @return
	 */
	public String getRejectedByOriginal() {
		return rejectedByOriginal;
	}

	/**
	 * @param string
	 */
	public void setRejectedByOriginal(String string) {
		rejectedByOriginal = string;
	}

	/**
	 * @return
	 */
	public String getInvoicePeriodYearMonth() {
		return invoicePeriodYearMonth;
	}

	/**
	 * @param string
	 */
	public void setInvoicePeriodYearMonth(String string) {
		invoicePeriodYearMonth = string;
	}

	/**
	 * @return
	 */
	public String getMonthlyAgreedNew() {
		return monthlyAgreedNew;
	}

	/**
	 * @param string
	 */
	public void setMonthlyAgreedNew(String string) {
		monthlyAgreedNew = string;
	}

	/**
	 * @return
	 */
	public String getBudgetLineEditable() {
		return budgetLineEditable;
	}

	/**
	 * @param string
	 */
	public void setBudgetLineEditable(String string) {
		budgetLineEditable = string;
	}

}
