package com.domgen.marketingbudgets.helper;

/**
 * Invoice Status code and descriptions
 * 
 * @version	1.0
 * @author 	SIMMR on 08-Jul-05
 */
public interface IStatusCodes
{
	String ADD_COMMENTS = "99";

	String INVOICE_STATUS_EARLY = "10";
	String INVOICE_STATUS_NEW_ENTRY = "20";
	String INVOICE_STATUS_UW_AUTHORISED = "32";
	String INVOICE_STATUS_UW_AUTH_AGREEMENT = "34";
	String INVOICE_STATUS_UW_REJECTION = "36";
	String INVOICE_STATUS_UW_QUERY = "38";
	String INVOICE_STATUS_SS_AUTHORISED = "40";
	String INVOICE_STATUS_SS_REJECTION = "42";
	String INVOICE_STATUS_SS_QUERY = "44";
	String INVOICE_STATUS_REJECT_TO_ACCOUNTS = "50";
	String INVOICE_STATUS_EDITED_BY_ACCOUNTS = "52";
	String INVOICE_STATUS_DELETED_BY_ACCOUNTS = "56";
	String INVOICE_STATUS_AWAITING_VALIDATION = "60";
	String INVOICE_STATUS_VALIDATION_ERROR = "62";
	String INVOICE_STATUS_VALIDATION_COMPLETE = "64";	
	String INVOICE_STATUS_AWAITING_TRANSFER = "65";
	String INVOICE_STATUS_TRANSFER_ERROR = "67";
	String INVOICE_STATUS_TRANSFER_COMPLETE = "70";

	String ACTION_NEW_ACTION = "10";
	String ACTION_ACKNOWLEDGED = "20";
	String ACTION_WORK_IN_PROGRESS = "30";
	String ACTION_COMPLETED = "40";
	
	String BUDGET_HEADER_PENDING = "10";
	String BUDGET_HEADER_LIVE = "20";
	String BUDGET_HEADER_REJECTED = "30";
	
	String BUDGET_LINE_UNSUBMITTED = "10";
	String BUDGET_LINE_SUBMITTED = "20";
	String BUDGET_LINE_TRANSFERRED = "30";
}
