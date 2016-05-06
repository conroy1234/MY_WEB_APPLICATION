<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html:html>
<HEAD>
<%@ page 
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
%>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="theme/dg-consumer.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/JavaScript"
	src="dg-consumer.js"></script>

<title><bean:message key="marketingBudgets.text" /></title>

<style type="text/css">
/* scrollable table with fixed header */
div.tableContainer {
	height: 300px; /* must be greater than tbody*/
	/*width: 500px; /* must be greater than tbody*/
	overflow: auto;
}

table > tbody {
	overflow: auto;
	height: 280px;
	/*width: 300px;*/
}

thead td {
	font-weight: bold;
	font-size: 0.7em;
	padding: 3px 10px 3px 3px;
	text-align: left;
	vertical-align: top;
	background-color: #e5eef7;
	position: relative;

}


tfoot td {
	text-align: center;
	font-size: 11px;
	font-weight: bold;
	background-color: papayawhip;
	color: steelblue;
	border-top: solid #94B7D9 1px;
}

/* expandable sections */
a.dsphead {
	text-decoration: none;
	margin-left: 0px;
	color: #003366;
	background-color: #e5eef7;
}

a.dsphead:hover {
	text-decoration: none;
}

a.dsphead span.dspchar {
	color: #003366;
	font-family: monospace;
	font-weight: normal;
}

.dspcont {
	color: #003366;
	display: none;
	mrgin-left: 0px;
}

.save {
	behaviour: url(#default#savehistory);
}
</style>

<script type="text/javascript">

function topBarNavigation(goTo)
{
	invoiceAuthorisedSelectionForm.actionChosen.value= goTo;
	invoiceAuthorisedSelectionForm.actionChosenType.value= "nav";
	invoiceAuthorisedSelectionForm.submit();
}

function setAction(action)
{
	invoiceAuthorisedSelectionForm.actionChosen.value= action;
	invoiceAuthorisedSelectionForm.actionChosenType.value= "func";
}
function setActionSort(action)
{
	invoiceAuthorisedSelectionForm.sortButtonPressed.value= "Y";
	invoiceAuthorisedSelectionForm.actionChosen.value= action;
	invoiceAuthorisedSelectionForm.actionChosenType.value= "func";
}
function setActionValidate(invoiceIdLineNo)
{
	invoiceAuthorisedSelectionForm.actionChosen.value= "validate";
	invoiceAuthorisedSelectionForm.actionChosenType.value= "func";
	invoiceAuthorisedSelectionForm.invoiceIdLineNo.value = invoiceIdLineNo
	invoiceAuthorisedSelectionForm.submit();
}
function setActionValidateError(invoiceIdLineNo)
{
	invoiceAuthorisedSelectionForm.actionChosen.value= "validateError";
	invoiceAuthorisedSelectionForm.actionChosenType.value= "func";
	invoiceAuthorisedSelectionForm.invoiceIdLineNo.value = invoiceIdLineNo
	invoiceAuthorisedSelectionForm.submit();
}

function resetClientName()
{
	invoiceAuthorisedSelectionForm.clientNameSel.value= "reset"
}
function resetAccountName()
{
	invoiceAuthorisedSelectionForm.accountNameSel.value= "reset"
}
function resetAccountHandler()
{
	invoiceAuthorisedSelectionForm.accountHandlerSel.value= "reset"
}
function resetAccountManager()
{
	invoiceAuthorisedSelectionForm.accountManagerSel.value= "reset"
}
function resetInvoicePeriodMMandYY()
{
	invoiceAuthorisedSelectionForm.invoicePeriodMMSel.value= "reset"
	invoiceAuthorisedSelectionForm.invoicePeriodYYSel.value= "reset"
}
function resetInvoicePeriodByOption()
{
	invoiceAuthorisedSelectionForm.invoicePeriodByOptionSel.value= "reset"
}
function resetInvoicePeriodByFromTo()
{
	invoiceAuthorisedSelectionForm.invoicePeriodByMMFromSel.value= "reset"
	invoiceAuthorisedSelectionForm.invoicePeriodByYYFromSel.value= "reset"
	invoiceAuthorisedSelectionForm.invoicePeriodByMMToSel.value= "reset"
	invoiceAuthorisedSelectionForm.invoicePeriodByYYToSel.value= "reset"
}
function resetStatus()
{
	invoiceAuthorisedSelectionForm.statusSel.value= "reset"
}
function resetInvoiceId()
{
	invoiceAuthorisedSelectionForm.invoiceIdSel.value= "reset"
}
function resetInvoiceNo()
{
	invoiceAuthorisedSelectionForm.invoiceNoSel.value= "reset"
}
function resetSortBy()
{
	invoiceAuthorisedSelectionForm.sortBy.value= "reset"
}
</script>

<script type="text/javascript">

function dsp(loc)
{
	if (document.getElementById)
	{
		var foc = loc.firstChild;
		foc = loc.firstChild.innerHTML?loc.firstChild:loc.firstChild.nextSibling;
		foc.innerHTML = foc.innerHTML=='+'?'-':'+';
		foc = loc.parentNode.nextSibling.style?loc.parentNode.nextSibling:loc.parentNode.nextSibling.nextSibling;
		foc.style.display = foc.style.display=='block'?'none':'block';
	}
}

</script>
</HEAD>
<BODY>

<div id="topLogo"><img src="images/domgen_logo.gif"
	alt="Domestic &amp; General Logo" width="136" height="75" /> <i
	class="topStrap" style="text-indent: 15px"><bean:message key="marketingBudgets.text" /></i></div>

<bean:define id="roleid" name="navScreenResults" property="role" />
<bean:define id="functionid" name="navScreenResults" property="function" />
<div id="navMain"><logic:equal name="navScreenResults" property="role"
	value="ACCMGR">
	<jsp:include page="navAccountsManager.jsp" />
</logic:equal> <logic:equal name="navScreenResults" property="role"
	value="ACCUSR">
	<jsp:include page="navAccountsUser.jsp" />
</logic:equal> <logic:equal name="navScreenResults" property="role"
	value="UWMGR">
	<jsp:include page="navUWManager.jsp" />
</logic:equal> <logic:equal name="navScreenResults" property="role"
	value="UWUSR">
	<jsp:include page="navUWUser.jsp" />
</logic:equal> <logic:equal name="navScreenResults" property="role"
	value="SSMGR">
	<jsp:include page="navSSManager.jsp" />
</logic:equal> <logic:equal name="navScreenResults" property="role"
	value="SSUSR">
	<jsp:include page="navSSUser.jsp" />
</logic:equal> <logic:equal name="navScreenResults" property="role"
	value="AHMMGR">
	<jsp:include page="navAccountHMsManager.jsp" />
</logic:equal> <logic:equal name="navScreenResults" property="role"
	value="AHMUSR">
	<jsp:include page="navAccountHMsManager.jsp" />
</logic:equal></div>

<div id="navTrail">
<ul>
	<!-- InstanceBeginEditable name="trail" -->
	<li><bean:write name="navScreenResults" property="function"/>&nbsp;&gt;</li>
	<li class="sectionSelected"><bean:message
		key="invoiceAuthorisedSelection.navBar.text" /></li>
	<!-- InstanceEndEditable -->
</ul>
</div>

<div id="content"><html:form action="/invoiceAuthorisedSelection.do">

	<html:hidden property="actionChosen" value=""></html:hidden>
	<html:hidden property="actionChosenType" value=""></html:hidden>
	<html:hidden property="invoiceAuditInvoiceId" value=""></html:hidden>
	<html:hidden property="invoiceIdLineNo" value=""></html:hidden>
	<html:hidden property="clientDetailsAccountName" value=""></html:hidden>
	<html:hidden property="sortButtonPressed" value=""></html:hidden>
	<bean:define id="clients" name="navResults" property="clients" />
	<bean:define id="accounts" name="navResults" property="accounts" />
	<bean:define id="invoicesAllByInvId" name="navResults" property="invoicesAllByInvId" />
	<bean:define id="invoicesAllByInvNo" name="navResults" property="invoicesAllByInvNo" />


<div id="content">
	<div id="mainContent">
	<div class="box">
<h3 class="listHeadingA"><a href="javascript:void(0)" class="dsphead"
		onclick="dsp(this)"><span class="dspchar">+</span></a>Search</h3>
	<div class="dspcont">
	<table width="60%" border="0" cellpadding="2" cellspacing="0">
		<tr>
			<td><bean:message key="clientName.text" /></td>
			<td><html:select name="navResults" property="clientNameSel">
				<html:option value="reset">&nbsp;</html:option>
				<html:options collection="clients" property="accountName"
					labelProperty="smaReference" />
			</html:select><html:button styleClass="formButtonSmall"
				property="Reset" value="Reset"
				onclick="javascript:resetClientName();" tabindex="2" />&nbsp; <font
				color="red"><html:errors property="clientNameSelError" /></font></td>
		</tr>
		<tr><td colspan="2" >OR</td></tr>
		<tr>
			<td><bean:message key="accountName.text" /></td>
			<td><html:select name="navResults" property="accountNameSel">
				<html:option value="reset">&nbsp;</html:option>
				<html:options collection="accounts" property="accountName" />
			</html:select><html:button styleClass="formButtonSmall"
				property="Reset" value="Reset"
				onclick="javascript:resetAccountName();" tabindex="4" />&nbsp;<font
				color="red"><html:errors property="accountNameSelError" /></font></td>
		<tr>
			<td><bean:message key="invoicePeriod.text" />&nbsp;<font color="red"><html:errors
				property="invoicePeriodError" /></font></td>
			<td><html:select name="navResults"
				property="invoicePeriodByOptionSel" tabindex="9">
				<html:option value="reset">&nbsp;</html:option>
					<html:option value="CM" >Current Month</html:option>
					<html:option value="12" >Last 12 Months</html:option>
			</html:select><html:button styleClass="formButtonSmall"
				property="Reset" value="Reset"
				onclick="javascript:resetInvoicePeriodByOption();" tabindex="10" /><font
				color="red"><html:errors property="invoicePeriodByOptionSel" /></font>
			</td>
		<tr><td>&nbsp;</td><td>OR</td></tr>
		<tr><td>&nbsp;</td>
			<td><html:select name="navResults" property="invoicePeriodMMSel"
				tabindex="9">
				<html:option value="reset">&nbsp;</html:option>
				<html:option value="01">01</html:option>
				<html:option value="02">02</html:option>
				<html:option value="03">03</html:option>
				<html:option value="04">04</html:option>
				<html:option value="05">05</html:option>
				<html:option value="06">06</html:option>
				<html:option value="07">07</html:option>
				<html:option value="08">08</html:option>
				<html:option value="09">09</html:option>
				<html:option value="10">10</html:option>
				<html:option value="11">11</html:option>
				<html:option value="12">12</html:option>
			</html:select>&nbsp; <html:select name="navResults"
				property="invoicePeriodYYSel" tabindex="9">
				<html:option value="reset">&nbsp;</html:option>
				<html:option value="05">2004</html:option>
				<html:option value="05">2005</html:option>
				<html:option value="06">2006</html:option>
				<html:option value="07">2007</html:option>
				<html:option value="08">2008</html:option>
				<html:option value="09">2009</html:option>
				<html:option value="10">2010</html:option>
			</html:select><html:button styleClass="formButtonSmall"
				property="Reset" value="Reset"
				onclick="javascript:resetInvoicePeriodMMandYY();" tabindex="10" />&nbsp;<font
				color="red"><html:errors property="invoicePeriodMMYYSelError" /></font><BR>
			</td>
		</tr>
		<tr><td>&nbsp;</td><td>OR</td></tr>
		<tr><td>&nbsp;</td>
			<td><html:select name="navResults"
				property="invoicePeriodByMMFromSel" tabindex="9">
				<html:option value="reset">&nbsp;</html:option>
				<html:option value="01">01</html:option>
				<html:option value="02">02</html:option>
				<html:option value="03">03</html:option>
				<html:option value="04">04</html:option>
				<html:option value="05">05</html:option>
				<html:option value="06">06</html:option>
				<html:option value="07">07</html:option>
				<html:option value="08">08</html:option>
				<html:option value="09">09</html:option>
				<html:option value="10">10</html:option>
				<html:option value="11">11</html:option>
				<html:option value="12">12</html:option>
			</html:select>&nbsp; <html:select name="navResults"
				property="invoicePeriodByYYFromSel" tabindex="9">
				<html:option value="reset">&nbsp;</html:option>
				<html:option value="05">2004</html:option>
				<html:option value="05">2005</html:option>
				<html:option value="06">2006</html:option>
				<html:option value="07">2007</html:option>
				<html:option value="08">2008</html:option>
				<html:option value="09">2009</html:option>
				<html:option value="10">2010</html:option>
			</html:select>&nbsp;To <html:select name="navResults"
				property="invoicePeriodByMMToSel" tabindex="9">
				<html:option value="reset">&nbsp;</html:option>
				<html:option value="01">01</html:option>
				<html:option value="02">02</html:option>
				<html:option value="03">03</html:option>
				<html:option value="04">04</html:option>
				<html:option value="05">05</html:option>
				<html:option value="06">06</html:option>
				<html:option value="07">07</html:option>
				<html:option value="08">08</html:option>
				<html:option value="09">09</html:option>
				<html:option value="10">10</html:option>
				<html:option value="11">11</html:option>
				<html:option value="12">12</html:option>
			</html:select>&nbsp; <html:select name="navResults"
				property="invoicePeriodByYYToSel" tabindex="9">
				<html:option value="reset">&nbsp;</html:option>
				<html:option value="05">2004</html:option>
				<html:option value="05">2005</html:option>
				<html:option value="06">2006</html:option>
				<html:option value="07">2007</html:option>
				<html:option value="08">2008</html:option>
				<html:option value="09">2009</html:option>
				<html:option value="10">2010</html:option>
			</html:select><html:button styleClass="formButtonSmall"
				property="Reset" value="Reset"
				onclick="javascript:resetInvoicePeriodByFromTo();" tabindex="10" /><font
				color="red"><html:errors property="invoicePeriodFromToSelError" /></font>

			</td>
		</tr>
		<tr>
			<td><bean:message key="status.text" /></td>
			<td><html:select name="navResults" property="statusSel" tabindex="11">
				<html:option value="reset">&nbsp;</html:option>
				<html:option value="40">S/S Authorised</html:option>
				</html:select><html:button styleClass="formButtonSmall"
				property="Reset" value="Reset" onclick="javascript:resetStatus();"
				tabindex="12" /></td>
		</tr>
		<tr>
			<td><bean:message key="invoiceId.text" /></td>
			<td><html:select name="navResults" property="invoiceIdSel">
				<html:option value="reset">&nbsp;</html:option>
				<html:options collection="invoicesAllByInvId" property="invoiceIdLineNo"/>
			</html:select><html:button styleClass="formButtonSmall"
				property="Reset" value="Reset"
				onclick="javascript:resetInvoiceId();" tabindex="14" />&nbsp;<font
				color="red"><html:errors property="invoiceIdSelError" /></font></td>
		</tr>
		<tr><td colspan="2" >OR</td></tr>
		<tr>
			<td><bean:message key="invoiceNumber.text" /></td>
			<td><html:select name="navResults" property="invoiceNoSel">
				<html:option value="reset">&nbsp;</html:option>
				<html:options collection="invoicesAllByInvNo" property="invoiceNo"/>
			</html:select><html:button styleClass="formButtonSmall"
				property="Reset" value="Reset"
				onclick="javascript:resetInvoiceNo();" tabindex="14" />&nbsp;<font
				color="red"><html:errors property="invoiceNoSelError" /></font></td>
		</tr>
		<tr>
			<td colspan="2"><html:submit styleClass="formButton" value="Search"
				onclick="javascript:setAction('search');" tabindex="17" /></td>
		</tr>
	</table>
	<h3 class="listHeadingA">Sort</h3>
	<table width="60%" border="0" cellpadding="2" cellspacing="0">
		<tr>
			<td><bean:message key="sortBy.text" /></td>
			<td><html:select name="navResults" property="sortBy" tabindex="19">
				<html:option value="reset">&nbsp;</html:option>
				<html:option value="MBSMAR">Client Name</html:option>
				<html:option value="MBACCN">Account Name</html:option>
				<html:option value="MBACCM">Account Manager</html:option>
				<html:option value="MBACCH">Account Handler</html:option>
				<html:option value="MBIPYM">Invoice Period</html:option>
				<html:option value="MBSTA1">Status</html:option>
				<html:option value="MBIVID">Invoice Id</html:option>
				<html:option value="MBIVNO">Invoice No</html:option>
			</html:select><html:button styleClass="formButtonSmall"
				property="Reset" value="Reset"
				onclick="javascript:resetSortBy();" tabindex="14" />&nbsp;<font
				color="red"><html:errors property="sortBySelError" /></font></td>
		</tr>
		<tr>
			<td colspan="2"><html:submit styleClass="formButton" value="Sort"
				onclick="javascript:setActionSort('search');" tabindex="20" /></td>
		</tr>
	</table>
	</div>
	</div>
	</div>

	<div id="mainContentFullWidth">

	<div class="box">

	<h3 class="headingB"><bean:message key="authorisedInvoices.text" />&nbsp;(<bean:message key="total.recordCount.text" /><bean:write name="navResults" property="invoiceAuthorisedSelectionCount"/>)</h3>
	<p>
	<font color="red"><html:errors property="processError" /></font>
	<font color="red"><html:errors property="validateGeneralError" /></font>
	</p>
	<div class="tableContainer" id="data">
	<table border="0" cellpadding="2" cellspacing="0">
		<thead>
			<TR>
				<TD width="50"><bean:message key="select.text" /></TD>
				<TD width="150"><bean:message key="invoiceId.text" /></TD>
				<TD width="150"><bean:message key="invoiceEntryDate.text" /></TD>
				<TD width="150"><bean:message key="invoiceDate.text" /></TD>
				<TD width="200"><bean:message key="invoiceNo.text" /></TD>
				<TD width="150"><bean:message key="account.text" /></TD>
				<TD width="150"><bean:message key="invoiceAmount.col.text" /></TD>
				<TD width="150"><bean:message key="uwAuthoriser.text" /></TD>
				<TD width="150"><bean:message key="ssAuthoriser.text" /></TD>
				<TD width="150"><bean:message key="action.text" /></TD>
			</TR>
		</thead>
		<TBODY>
			<logic:iterate name="navResults" property="invoiceAuthorisedSelection"
				id="invoiceAuthorisedSelectionID" indexId="i">
				<%String validateError = "validateError" + i;%>

				<TR>
				<td width="50" valign="top">
					<html:multibox property="chkboxSelect">
  						<bean:write name="invoiceAuthorisedSelectionID" property="invoiceIdLineNo"/>
 					</html:multibox> 
  				</td>
				<td width="150" valign="top"><bean:write name="invoiceAuthorisedSelectionID" property="invoiceIdLineNo"/></td>
				<td width="150" valign="top"><bean:write name="invoiceAuthorisedSelectionID" property="entryDateFormatted"/></td>
				<td width="150" valign="top"><bean:write name="invoiceAuthorisedSelectionID" property="invoiceMonth"/>/20<bean:write name="invoiceAuthorisedSelectionID" property="invoiceYear"/></td>
				<td width="200" valign="top">
				<logic:equal name="invoiceAuthorisedSelectionID" property="financeDivision" value="DOM">
					<bean:write name="invoiceAuthorisedSelectionID" property="invoiceNo"/>*<bean:write name="invoiceAuthorisedSelectionID" property="numberOfLines"/>
				</logic:equal>
				<logic:notEqual name="invoiceAuthorisedSelectionID" property="financeDivision" value="DOM">
					<font color="blue"><bean:write name="invoiceAuthorisedSelectionID" property="invoiceNo"/>*<bean:write name="invoiceAuthorisedSelectionID" property="numberOfLines"/></font>
				</logic:notEqual>
				</td>
				<td width="150" valign="top"><bean:write name="invoiceAuthorisedSelectionID" property="smaReference"/></td>							
				<td width="150" valign="top">
					<logic:equal name="invoiceAuthorisedSelectionID" property="financeDivision" value="DOM">
						<bean:write name="invoiceAuthorisedSelectionID" property="amountGross"/>
					</logic:equal>
					<logic:notEqual name="invoiceAuthorisedSelectionID" property="financeDivision" value="DOM">
						<bean:write name="invoiceAuthorisedSelectionID" property="amountNet"/>
					</logic:notEqual>
				</td>									
				<td width="150" valign="top"><bean:write name="invoiceAuthorisedSelectionID" property="approverUnderwriting"/></td>									
				<td width="150" valign="top"><bean:write name="invoiceAuthorisedSelectionID" property="approverSalesSupport"/></td>									
				<td width="150" valign="top"><input type="submit" class="formButton" value="Validate" onClick="javascript:setActionValidate('<bean:write name="invoiceAuthorisedSelectionID" property="invoiceIdLineNo"/>');">&nbsp;<font color="red"><html:errors property="<%= validateError %>" /></font></td>
				</TR>
			</logic:iterate>
		</tbody>
	</table>

	</div>
	<br>
	<p>
	<input type="submit" class="formButton" value="Multiple Validate" onClick="javascript:setAction('validateMultiple');">&nbsp;<font color="red"><html:errors property="validateMultipleError" /></font>
	</p>
	</div>
	<br>
	<div class="box">

	<h3 class="headingB"><bean:message key="validateInProgress.text" />&nbsp;(<bean:message key="total.recordCount.text" /><bean:write name="navResults" property="invoiceValidateInProgressCount"/>)</h3>

	<br>
	<table border="0" cellpadding="2" cellspacing="0">
		<thead>
				<TR>
				<TD width="150"><bean:message key="invoiceId.text" /></TD>
				<TD width="150"><bean:message key="invoiceEntryDate.text" /></TD>
				<TD width="150"><bean:message key="invoiceDate.text" /></TD>
				<TD width="200"><bean:message key="invoiceNo.text" /></TD>
				<TD width="150"><bean:message key="account.text" /></TD>
				<TD width="150"><bean:message key="invoiceAmount.col.text" /></TD>
				<TD width="150"><bean:message key="uwAuthoriser.text" /></TD>
				<TD width="150"><bean:message key="ssAuthoriser.text" /></TD>
			</TR>
		</thead>
	<TBODY>
			<logic:iterate name="navResults" property="invoiceValidateInProgress"
				id="invoiceValidateInProgressID" indexId="i">
				<%String updateError = "updateError" + i;%>

				<TR>
				<td width="150" valign="top"><bean:write name="invoiceValidateInProgressID" property="invoiceIdLineNo"/></td>
				<td width="150" valign="top"><bean:write name="invoiceValidateInProgressID" property="entryDateFormatted"/></td>
				<td width="150" valign="top"><bean:write name="invoiceValidateInProgressID" property="invoiceMonth"/>/20<bean:write name="invoiceValidateInProgressID" property="invoiceYear"/></td>
				<td width="200" valign="top">
					<logic:equal name="invoiceValidateInProgressID" property="financeDivision" value="DOM">
						<bean:write name="invoiceValidateInProgressID" property="invoiceNo"/>*<bean:write name="invoiceValidateInProgressID" property="numberOfLines"/>
					</logic:equal>
					<logic:notEqual name="invoiceValidateInProgressID" property="financeDivision" value="DOM">
						<font color="blue"><bean:write name="invoiceValidateInProgressID" property="invoiceNo"/>*<bean:write name="invoiceValidateInProgressID" property="numberOfLines"/></font>
					</logic:notEqual>				
				</td>
				<td width="150" valign="top"><bean:write name="invoiceValidateInProgressID" property="smaReference"/></td>							
				<td width="150" valign="top"><bean:write name="invoiceValidateInProgressID" property="amountGross"/></td>									
				<td width="150" valign="top"><bean:write name="invoiceValidateInProgressID" property="approverUnderwriting"/></td>									
				<td width="150" valign="top"><bean:write name="invoiceValidateInProgressID" property="approverSalesSupport"/></td>									
			
				</TR>
			</logic:iterate>
		</tbody>
	</table>
	<br>
	<p></p>
	</div>
	<div class="box">

	<h3 class="headingB"><bean:message key="validateError.text" />&nbsp;(<bean:message key="total.recordCount.text" /><bean:write name="navResults" property="invoiceValidateErrorCount"/>)</h3>
	<font color="red"><html:errors property="validateGeneralErrorError" /></font>
	<br>

	<div class="tableContainer" id="data">
	<table border="0" cellpadding="2" cellspacing="0">
		<thead>
				<TR>
				<TD width="30"><bean:message key="select.text" /></TD>
				<TD width="150"><bean:message key="invoiceId.text" /></TD>
				<TD width="150"><bean:message key="invoiceEntryDate.text" /></TD>
				<TD width="150"><bean:message key="invoiceDate.text" /></TD>
				<TD width="200"><bean:message key="invoiceNo.text" /></TD>
				<TD width="150"><bean:message key="account.text" /></TD>
				<TD width="150"><bean:message key="invoiceAmount.col.text" /></TD>
				<TD width="150"><bean:message key="uwAuthoriser.text" /></TD>
				<TD width="150"><bean:message key="ssAuthoriser.text" /></TD>
				<TD width="150"><bean:message key="error.text" /></TD>
				<TD width="150"><bean:message key="action.text" /></TD>
			</TR>

		</thead>
		<TBODY>
			<logic:iterate name="navResults" property="invoiceValidateError"
				id="invoiceValidateErrorID" indexId="i">
				<%String validateErrorError = "validateErrorError" + i;%>

				<TR>
				<td width="150" valign="top">
					<html:multibox property="chkboxErrorSelect">
  						<bean:write name="invoiceValidateErrorID" property="invoiceIdLineNo"/>
 					</html:multibox> 
  				</td>			
				<td width="150" valign="top"><bean:write name="invoiceValidateErrorID" property="invoiceIdLineNo"/></td>
				<td width="150" valign="top"><bean:write name="invoiceValidateErrorID" property="entryDateFormatted"/></td>
				<td width="150" valign="top"><bean:write name="invoiceValidateErrorID" property="invoiceMonth"/>/20<bean:write name="invoiceValidateErrorID" property="invoiceYear"/></td>
				<td width="200" valign="top">
				<logic:equal name="invoiceValidateErrorID" property="financeDivision" value="DOM">
					<bean:write name="invoiceValidateErrorID" property="invoiceNo"/>*<bean:write name="invoiceValidateErrorID" property="numberOfLines"/>
				</logic:equal>
				<logic:notEqual name="invoiceValidateErrorID" property="financeDivision" value="DOM">
					<font color="blue"><bean:write name="invoiceValidateErrorID" property="invoiceNo"/>*<bean:write name="invoiceValidateErrorID" property="numberOfLines"/></font>
				</logic:notEqual>				
				</td>
				<td width="150" valign="top"><bean:write name="invoiceValidateErrorID" property="smaReference"/></td>							
				<td width="150" valign="top"><bean:write name="invoiceValidateErrorID" property="amountGross"/></td>									
				<td width="150" valign="top"><bean:write name="invoiceValidateErrorID" property="approverUnderwriting"/></td>									
				<td width="150" valign="top"><bean:write name="invoiceValidateErrorID" property="approverSalesSupport"/></td>									
				<td width="150" valign="top"><bean:write name="invoiceValidateErrorID" property="transferError"/></td>									
				<td width="150" valign="top"><input type="submit" class="formButton" value="Validate" onClick="javascript:setActionValidateError('<bean:write name="invoiceValidateErrorID" property="invoiceIdLineNo"/>');">&nbsp;<font color="red"><html:errors property="<%= validateErrorError %>" /></font></td>
	
				</TR>
			</logic:iterate>
		</tbody>
	</table>

	</div>
	<br>
	<p>
	<input type="submit" class="formButton" value="Multiple Validate" onClick="javascript:setAction('validateMultipleError');">&nbsp;<font color="red"><html:errors property="validateMultipleErrorError" /></font>
	</p>
	</div>
	</div>

</html:form>
	</div>

<div class="clearBoth">&nbsp;</div>

<div id="footer">
<p>&copy; <bean:message key="domesticAndGeneral.text" /></p>
</div>
</BODY>
</html:html>




