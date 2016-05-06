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
<script language="JavaScript" type="text/JavaScript" src="dg-consumer.js"></script>
	
<title><bean:message key="marketingBudgets.text"/></title>

<style type="text/css">
/* scrollable table with fixed header */
div.tableContainer {
	height: 350px; /* must be greater than tbody*/
	/*width: 740px; /* must be greater than tbody*/
	overflow: auto;
}

table > tbody {
	overflow: auto;
	height: 330px;
	/*width: 700px;*/
}

thead td {
	font-weight: bold;
	font-size: 0.7em;
	padding: 3px 10px 3px 3px;
	text-align: left;
	vertical-align: top;
	background-color: #e5eef7;
	position: relative;
	top: expression(document . getElementById("data") . scrollTop-8 ); /*IE5+ only*/
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
	invoiceAuthoriseSelectionForm.actionChosen.value= goTo;
	invoiceAuthoriseSelectionForm.actionChosenType.value= "nav";
	invoiceAuthoriseSelectionForm.submit();
}
function mainPageNavigationClientDetails(accountName)
{
	invoiceAuthoriseSelectionForm.actionChosen.value= "clientDetails";
	invoiceAuthoriseSelectionForm.actionChosenType.value= "func";
	invoiceAuthoriseSelectionForm.clientDetailsAccountName.value= accountName;
	invoiceAuthoriseSelectionForm.submit();
}
function mainPageNavigationInvoiceAudit(invoiceId)
{
	invoiceAuthoriseSelectionForm.actionChosen.value= "invoiceAudit";
	invoiceAuthoriseSelectionForm.actionChosenType.value= "func";
	invoiceAuthoriseSelectionForm.invoiceAuditInvoiceId.value= invoiceId;
	invoiceAuthoriseSelectionForm.submit();
}
function mainPageNavigationInvoiceAuditADJ(accountNameYrMthPaymentType)
{
	invoiceAuthoriseSelectionForm.actionChosen.value= "invoiceAuditADJ";
	invoiceAuthoriseSelectionForm.actionChosenType.value= "func";
	invoiceAuthoriseSelectionForm.invoiceAuditAccountNameYrMthPaymentType.value = accountNameYrMthPaymentType;
	invoiceAuthoriseSelectionForm.submit();
}
function mainPageNavigationBudgetsAudit(accountNameYrMth)
{
	invoiceAuthoriseSelectionForm.actionChosen.value= "budgetsAudit";
	invoiceAuthoriseSelectionForm.actionChosenType.value= "func";
	invoiceAuthoriseSelectionForm.budgetsAuditAccountNameYearMonth.value = accountNameYrMth;
	invoiceAuthoriseSelectionForm.submit();
}
function setAction(action)
{
	invoiceAuthoriseSelectionForm.actionChosen.value= action;
	invoiceAuthoriseSelectionForm.actionChosenType.value= "func";
}
function setActionSort(action)
{
	invoiceAuthoriseSelectionForm.sortButtonPressed.value= "Y";
	invoiceAuthoriseSelectionForm.actionChosen.value= action;
	invoiceAuthoriseSelectionForm.actionChosenType.value= "func";
}
function setActionUpdate(invoiceIdLineNo)
{
	invoiceAuthoriseSelectionForm.actionChosen.value= "update";
	invoiceAuthoriseSelectionForm.actionChosenType.value= "func";
	invoiceAuthoriseSelectionForm.invoiceIdLineNo.value = invoiceIdLineNo
	invoiceAuthoriseSelectionForm.submit();
}
function resetClientName()
{
	invoiceAuthoriseSelectionForm.clientNameSel.value= "reset"
}
function resetAccountName()
{
	invoiceAuthoriseSelectionForm.accountNameSel.value= "reset"
}
function resetAccountHandler()
{
	invoiceAuthoriseSelectionForm.accountHandlerSel.value= "reset"
}
function resetAccountManager()
{
	invoiceAuthoriseSelectionForm.accountManagerSel.value= "reset"
}
function resetInvoicePeriodMMandYY()
{
	invoiceAuthoriseSelectionForm.invoicePeriodMMSel.value= "reset"
	invoiceAuthoriseSelectionForm.invoicePeriodYYSel.value= "reset"
}
function resetInvoicePeriodByOption()
{
	invoiceAuthoriseSelectionForm.invoicePeriodByOptionSel.value= "reset"
}
function resetInvoicePeriodByFromTo()
{
	invoiceAuthoriseSelectionForm.invoicePeriodByMMFromSel.value= "reset"
	invoiceAuthoriseSelectionForm.invoicePeriodByYYFromSel.value= "reset"
	invoiceAuthoriseSelectionForm.invoicePeriodByMMToSel.value= "reset"
	invoiceAuthoriseSelectionForm.invoicePeriodByYYToSel.value= "reset"
}
function resetStatus()
{
	invoiceAuthoriseSelectionForm.statusSel.value= "reset"
}
function resetInvoiceId()
{
	invoiceAuthoriseSelectionForm.invoiceIdSel.value= "reset"
}
function resetInvoiceNo()
{
	invoiceAuthoriseSelectionForm.invoiceNoSel.value= "reset"
}
function resetSortBy()
{
	invoiceAuthoriseSelectionForm.sortBy.value= "reset"
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

<div id="topLogo"><img src="images/domgen_logo.gif" alt="Domestic &amp; General Logo" width="136" height="75" />
	<i class="topStrap" style="text-indent: 15px"><bean:message key="marketingBudgets.text" /></i>
</div>

<bean:define id="roleid" name="navScreenResults" property="role" />
<bean:define id="functionid" name="navScreenResults" property="function" />
<div id="navMain">	
	<logic:equal name="navScreenResults" property="role" value="ACCMGR"><jsp:include page="navAccountsManager.jsp"/></logic:equal>
	<logic:equal name="navScreenResults" property="role" value="ACCUSR"><jsp:include page="navAccountsUser.jsp"/></logic:equal>
	<logic:equal name="navScreenResults" property="role" value="UWMGR"><jsp:include page="navUWManager.jsp"/></logic:equal>
	<logic:equal name="navScreenResults" property="role" value="UWUSR"><jsp:include page="navUWUser.jsp"/></logic:equal>
	<logic:equal name="navScreenResults" property="role" value="SSMGR"><jsp:include page="navSSManager.jsp"/></logic:equal>
	<logic:equal name="navScreenResults" property="role" value="SSUSR"><jsp:include page="navSSUser.jsp"/></logic:equal>
	<logic:equal name="navScreenResults" property="role" value="AHMMGR"><jsp:include page="navAccountHMsManager.jsp"/></logic:equal>
	<logic:equal name="navScreenResults" property="role" value="AHMUSR"><jsp:include page="navAccountHMsManager.jsp"/></logic:equal>
</div>

<div id="navTrail">
<ul>
	<!-- InstanceBeginEditable name="trail" -->
	<li><bean:write name="navScreenResults" property="function"/>&nbsp;&gt;</li>
	<li class="sectionSelected"><bean:message key="invoiceAuthoriseSelection.navBar.text" /></li>
	<!-- InstanceEndEditable -->
</ul>
</div>

<div id="content"><html:form action="/invoiceAuthoriseSelection.do" >

	<html:hidden property="actionChosen" value=""></html:hidden>
	<html:hidden property="actionChosenType" value=""></html:hidden>
	<html:hidden property="invoiceAuditInvoiceId" value=""></html:hidden>
	<html:hidden property="invoiceAuditAccountNameYrMthPaymentType" value=""></html:hidden>
	<html:hidden property="invoiceIdLineNo" value=""></html:hidden>
	<html:hidden property="clientDetailsAccountName" value=""></html:hidden>
	<html:hidden property="budgetsAuditAccountNameYearMonth" value=""></html:hidden>
	<html:hidden property="sortButtonPressed" value=""></html:hidden>
	<bean:define id="clients" name="navResults" property="clients" />
	<bean:define id="accounts" name="navResults" property="accounts" />
	<bean:define id="invoicesAllByInvId" name="navResults" property="invoicesAllByInvId" />
	<bean:define id="invoicesAllByInvNo" name="navResults" property="invoicesAllByInvNo" />

<div id="mainContent">
<div class="box">
	<h3 class="listHeadingA"><a href="javascript:void(0)" class="dsphead"
		onclick="dsp(this)"><span class="dspchar">+</span></a>Search</h3>
	<div class="dspcont">
	<table width="60%" border="0" cellpadding="2" cellspacing="0">
		<tr>
			<td><bean:message key="clientName.text" /></td>
			<td>
				<html:select name="navResults" property="clientNameSel">
					<html:option value="reset">&nbsp;</html:option>
					<html:options collection="clients" property="accountName" labelProperty="smaReference" />
				</html:select><html:button styleClass="formButtonSmall" property="Reset" value="Reset" onclick="javascript:resetClientName();" tabindex="2"/>&nbsp;
				<font color="red"><html:errors property="clientNameSelError" /></font>
			</td>	
		</tr>
		<tr><td colspan="2" >OR</td></tr>
		<tr>
			<td><bean:message key="accountName.text" /></td>
			<td>
				<html:select name="navResults" property="accountNameSel">
					<html:option value="reset">&nbsp;</html:option>
					<html:options collection="accounts" property="accountName"/>
				</html:select><html:button styleClass="formButtonSmall" property="Reset" value="Reset" onclick="javascript:resetAccountName();" tabindex="4"/>
				&nbsp;<font color="red"><html:errors property="accountNameSelError" /></font>
			</td>
		</tr>
		<tr>
			<td><bean:message key="invoicePeriod.text" />&nbsp;<font color="red"><html:errors property="invoicePeriodError" /></font></td>
			<td><html:select name="navResults" property="invoicePeriodByOptionSel" tabindex="9">
					<html:option value="reset">&nbsp;</html:option>
					<html:option value="CM" >Current Month</html:option>
					<html:option value="<=CM" >Up to Current Month</html:option>
					<html:option value="12" >Last 12 Months</html:option>
				</html:select><html:button styleClass="formButtonSmall" property="Reset" value="Reset" onclick="javascript:resetInvoicePeriodByOption();" tabindex="10"/><font color="red"><html:errors property="invoicePeriodByOptionSel" /></font>
		</tr>
		<tr><td>&nbsp;</td><td>OR</td></tr>
		<tr><td>&nbsp;</td>
			<td><html:select name="navResults" property="invoicePeriodMMSel" tabindex="9">
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
				</html:select>&nbsp;
				<html:select name="navResults" property="invoicePeriodYYSel" tabindex="9">
					<html:option value="reset">&nbsp;</html:option>
					<html:option value="04">2004</html:option>
					<html:option value="05">2005</html:option>
					<html:option value="06">2006</html:option>
					<html:option value="07">2007</html:option>
					<html:option value="08">2008</html:option>
					<html:option value="09">2009</html:option>
					<html:option value="10">2010</html:option>
				</html:select><html:button styleClass="formButtonSmall" property="Reset" value="Reset" onclick="javascript:resetInvoicePeriodMMandYY();" tabindex="10"/>&nbsp;<font color="red"><html:errors property="invoicePeriodMMYYSelError" /></font>
			</td>
		</tr>
		<tr><td>&nbsp;</td><td>OR</td></tr>
		<tr><td>&nbsp;</td>
			<td>
				<html:select name="navResults" property="invoicePeriodByMMFromSel" tabindex="9">
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
				</html:select>&nbsp;
				<html:select name="navResults" property="invoicePeriodByYYFromSel" tabindex="9">
					<html:option value="reset">&nbsp;</html:option>
					<html:option value="04">2004</html:option>
					<html:option value="05">2005</html:option>
					<html:option value="06">2006</html:option>
					<html:option value="07">2007</html:option>
					<html:option value="08">2008</html:option>
					<html:option value="09">2009</html:option>
					<html:option value="10">2010</html:option>
				</html:select>&nbsp;To
				<html:select name="navResults" property="invoicePeriodByMMToSel" tabindex="9">
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
				</html:select>&nbsp;
				<html:select name="navResults" property="invoicePeriodByYYToSel" tabindex="9">
					<html:option value="reset">&nbsp;</html:option>
					<html:option value="04">2004</html:option>
					<html:option value="05">2005</html:option>
					<html:option value="06">2006</html:option>
					<html:option value="07">2007</html:option>
					<html:option value="08">2008</html:option>
					<html:option value="09">2009</html:option>
					<html:option value="10">2010</html:option>
				</html:select><html:button styleClass="formButtonSmall" property="Reset" value="Reset" onclick="javascript:resetInvoicePeriodByFromTo();" tabindex="10"/><font color="red"><html:errors property="invoicePeriodFromToSelError" /></font>
				</td>
		</tr>
		<tr>
			<td><bean:message key="status.text" /></td>
			<td><html:select name="navResults" property="statusSel" tabindex="11">
			<html:option value="reset">&nbsp;</html:option>
				<html:option value="20">New Invoice Entry</html:option>
				<html:option value="32">U/W Auth'd</html:option>
				<html:option value="34">U/W Auth'd,Agr'mt o/s</html:option>
				<html:option value="36">U/W Rejection</html:option>
				<html:option value="38">U/W Query</html:option>
				<html:option value="40">S/S Auth'd</html:option>
				<html:option value="42">S/S Rejection</html:option>
				<html:option value="44">S/S Query</html:option>
				<html:option value="50">Reject to Accounts</html:option>
				<html:option value="52">Edited by Accounts</html:option>
			  	</html:select><html:button styleClass="formButtonSmall" property="Reset" value="Reset" onclick="javascript:resetStatus();" tabindex="12"/>
			</td>
		</tr>
		<tr>
			<td><bean:message key="invoiceId.text" /></td>
			<td>
				<html:select name="navResults" property="invoiceIdSel">
					<html:option value="reset">&nbsp;</html:option>
					<html:options collection="invoicesAllByInvId" property="invoiceIdLineNo"/>
				</html:select><html:button styleClass="formButtonSmall" property="Reset" value="Reset" onclick="javascript:resetInvoiceId();" tabindex="14"/>&nbsp;<font color="red"><html:errors property="invoiceIdSelError" /></font>
			</td>
		</tr>
		<tr><td colspan="2" >OR</td></tr>
		<tr>
			<td><bean:message key="invoiceNumber.text" /></td>
			<td>
				<html:select name="navResults" property="invoiceNoSel">
					<html:option value="reset">&nbsp;</html:option>
					<html:options collection="invoicesAllByInvNo" property="invoiceNo"/>
				</html:select><html:button styleClass="formButtonSmall" property="Reset" value="Reset" onclick="javascript:resetInvoiceNo();" tabindex="14"/>&nbsp;<font color="red"><html:errors property="invoiceNoSelError" /></font>
			</td>
		</tr>

		<tr>
			<td colspan="2" ><html:submit styleClass="formButton" value="Search" onclick="javascript:setAction('search');" tabindex="17"/></td>
		</tr>
	</table>
	<h3 class="listHeadingA">Sort</h3>
	<table width="60%" border="0" cellpadding="2" cellspacing="0">
		<tr>
			<td><bean:message key="sortBy.text" /></td>
			<td><html:select name="navResults" property="sortBy" tabindex="19">
				<html:option value="reset">&nbsp;</html:option>
				<html:option value="MBACCN" >Account Name</html:option>
				<html:option value="MBIPYM" >Invoice Period</html:option>
				<html:option value="MBSTA1" >Status</html:option>
				<html:option value="MBIVID">Invoice Id</html:option>
				<html:option value="MBIVNO">Invoice No</html:option>
			</html:select><html:button styleClass="formButtonSmall" property="Reset" value="Reset" onclick="javascript:resetSortBy();" tabindex="14"/>&nbsp;<font color="red"><html:errors property="sortBySelError" /></font></td>
		</tr>
		<tr>
			<td colspan="2" ><html:submit styleClass="formButton" value="Sort" onclick="javascript:setActionSort('search');" tabindex="20"/></td>
		</tr>		
	</table>
</div>
</div>
</div>
	
<div id="mainContentFullWidth">
<div class="box">

	<h3 class="headingB"><bean:message key="invoiceAuthoriseSelection.text" />&nbsp;(<bean:message key="total.recordCount.text" /><bean:write name="navResults" property="invoiceAuthoriseSelectionCount"/>)</h3>

	<br>

	<div class="tableContainer" id="data">
	<table border="0" cellpadding="2" cellspacing="0">
		<thead>
			<TR>
				<TD width="8%"><bean:message key="invoiceId.text" /></TD>
				<TD width="8%"><bean:message key="invoiceEntryDate.text" /></TD>
				<TD width="8%"><bean:message key="invoiceNumber.text" /></TD>
				<TD width="8%"><bean:message key="clientName.text" /></TD>
				<TD width="8%"><bean:message key="agreedMonthYear.text" /></TD>
				<TD width="8%"><bean:message key="invoiceAmountNet.columText" /></TD>
				<TD width="8%"><bean:message key="invoiceAmountVat.columText" /></TD>
				<TD width="8%"><bean:message key="invoiceAmountGross.columText" /></TD>
				<TD width="8%"><bean:message key="agreedMonthly.text" /></TD>
				<TD width="8%"><bean:message key="invoiceMinusAgreedAmount.columText" /></TD>
				<TD width="8%"><bean:message key="status.text" /></TD>
				<TD width="8%"><bean:message key="action.text" /></TD>
			</TR>
		</thead>
		<TBODY>
		<logic:iterate name="navResults" property="invoiceAuthoriseSelection" id="invoiceAuthoriseSelectionID" indexId="i">
		<% String updateError = "updateError" + i; %>
		<tr>
		
			<td width="8%" valign="top">
				<a href="#" onClick="mainPageNavigationInvoiceAudit('<bean:write name="invoiceAuthoriseSelectionID" property="invoiceId"/><bean:write name="invoiceAuthoriseSelectionID" property="invoiceLineNo"/>');return false;"><bean:write name="invoiceAuthoriseSelectionID" property="invoiceId"/><bean:write name="invoiceAuthoriseSelectionID" property="invoiceLineNo"/>*<bean:write name="invoiceAuthoriseSelectionID" property="numberOfLines"/></a>			
			</td>
			<td width="8%" valign="top"><bean:write name="invoiceAuthoriseSelectionID" property="entryDateFormatted"/></td>
			<td width="8%" valign="top">
				<logic:equal name="invoiceAuthoriseSelectionID" property="financeDivision" value="DOM">
					<bean:write name="invoiceAuthoriseSelectionID" property="invoiceNo"/>
				</logic:equal>
				<logic:notEqual name="invoiceAuthoriseSelectionID" property="financeDivision" value="DOM">
					<font color="blue"><bean:write name="invoiceAuthoriseSelectionID" property="invoiceNo"/></font>
				</logic:notEqual>
				
			</td>		
			<td width="8%" valign="top"><a href="#" onClick="mainPageNavigationClientDetails('<bean:write name="invoiceAuthoriseSelectionID" property="accountName"/>');return false;"><bean:write name="invoiceAuthoriseSelectionID" property="accountName"/></a></td>
			<td width="8%" valign="top"><bean:write name="invoiceAuthoriseSelectionID" property="invoiceMonth"/>/20<bean:write name="invoiceAuthoriseSelectionID" property="invoiceYear"/></td>
			<td width="8%" valign="top"><bean:write name="invoiceAuthoriseSelectionID" property="amountNet"/></td>
			<td width="8%" valign="top"><bean:write name="invoiceAuthoriseSelectionID" property="amountVat"/></td>
			<td width="8%" valign="top"><bean:write name="invoiceAuthoriseSelectionID" property="amountGross"/></td>									
			<td width="8%" valign="top">
			<logic:equal name="invoiceAuthoriseSelectionID" property="paymentType" value="ADJ">		
				<a href="#" onClick="mainPageNavigationInvoiceAuditADJ('<bean:write name="invoiceAuthoriseSelectionID" property="accountName"/><bean:write name="invoiceAuthoriseSelectionID" property="invoiceYear"/><bean:write name="invoiceAuthoriseSelectionID" property="invoiceMonth"/>REG');return false;">ADJ</a>
			</logic:equal>
			<logic:notEqual name="invoiceAuthoriseSelectionID" property="paymentType" value="ADJ">		
				<logic:equal name="invoiceAuthoriseSelectionID" property="monthlyAgreed" value="">no budget</logic:equal>
				<logic:equal name="invoiceAuthoriseSelectionID" property="amendmentFlag" value="Y">
					<a href="#" onClick="mainPageNavigationBudgetsAudit('<bean:write name="invoiceAuthoriseSelectionID" property="accountName"/><bean:write name="invoiceAuthoriseSelectionID" property="invoiceYear"/><bean:write name="invoiceAuthoriseSelectionID" property="invoiceMonth"/>');return false;"><bean:write name="invoiceAuthoriseSelectionID" property="monthlyAgreed"/></a>
				</logic:equal>
				<logic:equal name="invoiceAuthoriseSelectionID" property="amendmentFlag" value="N">
					<bean:write name="invoiceAuthoriseSelectionID" property="monthlyAgreed"/>
				</logic:equal>
			</logic:notEqual>
			</td>
			<td width="8%" valign="top">
			<logic:equal name="invoiceAuthoriseSelectionID" property="paymentType" value="ADJ">n/a</logic:equal>
			<logic:notEqual name="invoiceAuthoriseSelectionID" property="paymentType" value="ADJ">
				<logic:equal name="invoiceAuthoriseSelectionID" property="financeDivision" value="DOM">
					<logic:equal name="invoiceAuthoriseSelectionID" property="invoiceGrossMinusAgreed" value="0.00">
						<bean:write name="invoiceAuthoriseSelectionID" property="invoiceGrossMinusAgreed"/>	
					</logic:equal>
					<logic:notEqual name="invoiceAuthoriseSelectionID" property="invoiceGrossMinusAgreed" value="0.00">
						<font color="red"><bean:write name="invoiceAuthoriseSelectionID" property="invoiceGrossMinusAgreed"/></font>
					</logic:notEqual>
				</logic:equal>
				<logic:notEqual name="invoiceAuthoriseSelectionID" property="financeDivision" value="DOM">
					<logic:equal name="invoiceAuthoriseSelectionID" property="invoiceNetMinusAgreed" value="0.00">
						<bean:write name="invoiceAuthoriseSelectionID" property="invoiceNetMinusAgreed"/>	
					</logic:equal>
					<logic:notEqual name="invoiceAuthoriseSelectionID" property="invoiceNetMinusAgreed" value="0.00">
						<font color="red"><bean:write name="invoiceAuthoriseSelectionID" property="invoiceNetMinusAgreed"/></font>
					</logic:notEqual>
				</logic:notEqual>
			</logic:notEqual>
			
			</td>
			<td width="8%" valign="top">
				<logic:equal name="invoiceAuthoriseSelectionID" property="invoiceLineStatus" value="">
					<logic:equal name="invoiceAuthoriseSelectionID" property="approvalFlag" value="Y">
						<bean:write name="invoiceAuthoriseSelectionID" property="BudgetLineStatusText"/>
					</logic:equal>
					<logic:equal name="invoiceAuthoriseSelectionID" property="approvalFlag" value="N">
						<b><bean:write name="invoiceAuthoriseSelectionID" property="BudgetLineStatusText"/></b>
					</logic:equal>
				</logic:equal>
				<logic:notEqual name="invoiceAuthoriseSelectionID" property="invoiceLineStatus" value="">
					<logic:equal name="invoiceAuthoriseSelectionID" property="approvalFlag" value="Y">
						<bean:write name="invoiceAuthoriseSelectionID" property="invoiceLineStatusText"/>
					</logic:equal>
					<logic:equal name="invoiceAuthoriseSelectionID" property="approvalFlag" value="N">
						<b><bean:write name="invoiceAuthoriseSelectionID" property="invoiceLineStatusText"/></b>
					</logic:equal>
				</logic:notEqual>
			</td>		
			<td width="8%" valign="top"><input type="submit" class="formButton" value="Update" onClick="javascript:setActionUpdate('<bean:write name="invoiceAuthoriseSelectionID" property="invoiceIdLineNo"/>');">&nbsp;<font color="red"><html:errors property="<%= updateError %>" /></font></td>
		</tr>
		</logic:iterate>
	</tbody>
	</table>

</div>
</div>
</div>

</html:form>


<div class="clearBoth">&nbsp;</div>

<div id="footer">
<p>&copy; <bean:message key="domesticAndGeneral.text" /></p>
</div>

</BODY>
</html:html>




