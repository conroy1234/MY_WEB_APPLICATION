<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>

<HEAD>
</HEAD>

<BODY>
<ul>
	<li><a href="#" onClick="topBarNavigation('goToInvoiceEntry');return false;"><bean:message key="invoiceEntry.text" /></a></li>
	<li><a href="#" onClick="topBarNavigation('goToInvoiceEditSelection');return false;"><bean:message key="invoiceEdit.text" /></a></li>
	<li><a href="#" onClick="topBarNavigation('goToInvoicesSearch');return false;"><bean:message key="invoices.text" /></a></li>
	<li><a href="#" onClick="topBarNavigation('goToInvoicesAuthorised');return false;"><bean:message key="validate.text" /></a></li>
	<li><a href="#" onClick="topBarNavigation('goToInvoicesValidated');return false;"><bean:message key="transfer.text" /></a></li>
	<li><a href="#" onClick="topBarNavigation('goToMaintenanceAccounts');return false;"><bean:message key="maintenance.text" /></a></li>
	<li><a href="#" onClick="topBarNavigation('goToLogOut');return false;"><bean:message key="logOut.text" /></a></li>
</ul>
</BODY>
