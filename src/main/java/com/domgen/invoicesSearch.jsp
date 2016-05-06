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
	height: 500px; /* must be greater than tbody*/
	/*width: 800px; /* must be greater than tbody*/
	overflow: auto;
}

table > tbody {
	overflow: auto;
	height: 480px;
	/*width: 790px;*/
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
	invoicesSearchForm.actionChosen.value= goTo;
	invoicesSearchForm.actionChosenType.value= "nav";
	invoicesSearchForm.submit();
}
function mainPageNavigationClientDetails(accountName)
{
	invoicesSearchForm.actionChosen.value= "clientDetails";
	invoicesSearchForm.actionChosenType.value= "func";
	invoicesSearchForm.clientDetailsAccountName.value= accountName;
	invoicesSearchForm.submit();
}
function mainPageNavigationInvoiceAudit(invoiceId)
{
	invoicesSearchForm.actionChosen.value= "invoiceAudit";
	invoicesSearchForm.actionChosenType.value= "func";
	invoicesSearchForm.invoiceAuditInvoiceId.value= invoiceId;
	invoicesSearchForm.submit();
}
function mainPageNavigationInvoiceAuditADJ(accountNameYrMth)
{
	invoicesSearchForm.actionChosen.value= "invoiceAuditADJ";
	invoicesSearchForm.actionChosenType.value= "func";
	invoicesSearchForm.invoiceAuditAccountNameYearMonth.value = accountNameYrMth;
	invoicesSearchForm.submit();
}
function mainPageNavigationBudgetsAudit(accountNameYrMth)
{
	invoicesSearchForm.actionChosen.value= "budgetsAudit";
	invoicesSearchForm.actionChosenType.value= "func";
	invoicesSearchForm.budgetsAuditAccountNameYearMonth.value = accountNameYrMth;
	invoicesSearchForm.submit();
}
function setAction(action)
{
	invoicesSearchForm.actionChosen.value= action;
	invoicesSearchForm.actionChosenType.value= "func";
}
function setActionSort(action)
{
	invoicesSearchForm.sortButtonPressed.value= "Y";
	invoicesSearchForm.actionChosen.value= action;
	invoicesSearchForm.actionChosenType.value= "func";
}

function resetClientName()
{
	invoicesSearchForm.clientNameSel.value= "reset"
}
function resetAccountName()
{
	invoicesSearchForm.accountNameSel.value= "reset"
}
function resetAccountHandler()
{
	invoicesSearchForm.accountHandlerSel.value= "reset"
}
function resetAccountManager()
{
	invoicesSearchForm.accountManagerSel.value= "reset"
}
function resetInvoicePeriodMMandYY()
{
	invoicesSearchForm.invoicePeriodMMSel.value= "reset"
	invoicesSearchForm.invoicePeriodYYSel.value= "reset"
}
function resetInvoicePeriodByOption()
{
	invoicesSearchForm.invoicePeriodByOptionSel.value= "reset"
}
function resetInvoicePeriodByFromTo()
{
	invoicesSearchForm.invoicePeriodByMMFromSel.value= "reset"
	invoicesSearchForm.invoicePeriodByYYFromSel.value= "reset"
	invoicesSearchForm.invoicePeriodByMMToSel.value= "reset"
	invoicesSearchForm.invoicePeriodByYYToSel.value= "reset"
}
function resetStatus()
{
	invoicesSearchForm.statusSel.value= "reset"
}
function resetInvoiceId()
{
	invoicesSearchForm.invoiceIdSel.value= "reset"
}
function resetInvoiceNo()
{
	invoicesSearchForm.invoiceNoSel.value= "reset"
}
function resetSortBy()
{
	invoicesSearchForm.sortBy.value= "reset"
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
	<li class="sectionSelected"><bean:message key="invoicesSearch.text" /></li>
	<!-- InstanceEndEditable -->
</ul>
</div>

<div id="content"><html:form action="/invoicesSearch.do" >

	<html:hidden property="actionChosen" value=""></html:hidden>
	<html:hidden property="actionChosenType" value=""></html:hidden>
	<html:hidden property="invoiceAuditInvoiceId" value=""></html:hidden>
	<html:hidden property="clientDetailsAccountName" value=""></html:hidden>
	<html:hidden property="invoiceAuditAccountNameYearMonth" value=""></html:hidden>
	<html:hidden property="budgetsAuditAccountNameYearMonth" value=""></html:hidden>
	<html:hidden property="sortButtonPressed" value=""></html:hidden>
	<bean:define id="clients" name="navResults" property="clients" />
	<bean:define id="accounts" name="navResults" property="accounts" />
	<bean:define id="accountHandlers" name="navResults" property="accountHandlers" />
	<bean:define id="accountManagers" name="navResults" property="accountManagers" />
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
				</html:select><html:button styleClass="formButtonSmall" property="Reset" value="Reset" onclick="javascript:resetAccountName();" tabindex="4"/>&nbsp;<font color="red"><html:errors property="accountNameSelError" /></font>
				</td>
		</tr>
		<tr>
			<td><bean:message key="accountManager.text" /></td>
			<td>
				<html:select name="navResults"  property="accountManagerSel">
					<html:option value="reset">&nbsp;</html:option>
					<html:options collection="accountManagers" property="initials"/>
				</html:select><html:button styleClass="formButtonSmall" property="Reset" value="Reset" onclick="javascript:resetAccountManager();" tabindex="6"/>&nbsp;<font color="red"><html:errors property="accountManagerSel" /></font>
				</td>
		</tr>
		<tr>
			<td><bean:message key="accountHandler.text" /></td>
			<td>
				<html:select name="navResults" property="accountHandlerSel">
					<html:option value="reset">&nbsp;</html:option>
					<html:options collection="accountHandlers" property="initials"/>
				</html:select><html:button styleClass="formButtonSmall" property="Reset" value="Reset" onclick="javascript:resetAccountHandler();" tabindex="8"/>&nbsp;<font color="red"><html:errors property="accountHandlerSel" /></font>
				</td>
		</tr>
		<tr>
			<td><bean:message key="invoicePeriod.text" />&nbsp;<font color="red"><html:errors property="invoicePeriodError" /></font></td>
			<td><html:select name="navResults" property="invoicePeriodByOptionSel" tabindex="9">
					<html:option value="reset">&nbsp;</html:option>
					<html:option value="CM" >Current Month</html:option>
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
				<html:option value="UN">Unsubmitted</html:option>
				<html:option value="10">Early</html:option>
				<html:option value="SS">Awaiting UW Auth'n</html:option>
				<html:option value="20">New Invoice Entry</html:option>
				<html:option value="32">U/W Auth'd</html:option>
				<html:option value="34">U/W Auth'd,Agr'mt o/s</html:option>
				<html:option value="36">U/W Rejection</html:option>
				<html:option value="38">U/W Query</html:option>
				<html:option value="UW">Awaiting SS Auth'n</html:option>
				<html:option value="40">S/S Auth'd</html:option>
				<html:option value="42">S/S Rejection</html:option>
				<html:option value="44">S/S Query</html:option>
				<html:option value="50">Reject to Accounts</html:option>
				<html:option value="60">Awaiting Validation</html:option>
				<html:option value="62">Validation Error</html:option>
				<html:option value="64">Validation Complete</html:option>
				<html:option value="65">Awaiting Transfer</html:option>
				<html:option value="67">Transfer Error</html:option>
				<html:option value="70">Transfer Complete</html:option>
			  	</html:select><br><html:button styleClass="formButtonSmall" property="Reset" value="Reset" onclick="javascript:resetStatus();" tabindex="12"/>
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
		
		<tr>
			<td colspan="2" ><html:submit styleClass="formButton" value="Search" onclick="javascript:setAction('search');" tabindex="17"/></td>
		</tr>
	</table>
	<h3 class="listHeadingA"><bean:message key="sortBy.text" /></h3>
	<table width="60%" border="0" cellpadding="2" cellspacing="0">
		<tr>
			<td><bean:message key="sortBy.text" /></td>
				<td><html:select name="navResults" property="sortBy" tabindex="19">
				<html:option value="reset">&nbsp;</html:option>
				<html:option value="MBSMAR" >Client Name</html:option>
				<html:option value="MBACCN" >Account Name</html:option>
				<html:option value="MBACCM" >Account Manager</html:option>
				<html:option value="MBACCH">Account Handler</html:option>
				<html:option value="MBIPYM" >Invoice Period</html:option>
				<html:option value="MBSTA1" >Status</html:option>
				<html:option value="MBIVID">Invoice Id</html:option>
				<html:option value="MBIVNO">Invoice No</html:option>
			</html:select><br><html:button styleClass="formButtonSmall" property="Reset" value="Reset" onclick="javascript:resetSortBy();" tabindex="14"/>&nbsp;<font color="red"><html:errors property="sortBySelError" /></font></td>
		</tr>
		<tr>
			<td colspan="2" ><html:submit styleClass="formButton" value="Sort" onclick="javascript:setActionSort('search');" tabindex="20"/></td>
		</tr>		
	</table>
	<h3 class="listHeadingA"><bean:message key="invoiceAudit.text" /></h3>
	<table width="60%" border="0" cellpadding="2" cellspacing="0">
		<tr>
					<html:select name="navResults" property="invoiceAuditSel">
					<html:option value="reset">&nbsp;</html:option>
					<html:options collection="invoicesAllByInvId" property="invoiceIdLineNo"/>
				</html:select>&nbsp;<font color="red"><html:errors property="invoiceAuditSelError" /></font>
		</tr>
		<tr>
			<td><html:submit styleClass="formButton" value="View" onclick="javascript:setAction('invoiceAuditSel');" tabindex="20"/></td>
		</tr>		
	</table>
	</div>
	</div>
	</div>
	<div id="mainContent">

	<div class="box">

	<h3 class="headingB"><bean:message key="invoices.text" />&nbsp;(<bean:message key="total.recordCount.text" /><bean:write name="navResults" property="invoicesSearchCount"/>)</h3>

	<br>

	<div class="tableContainer" id="data">
	<table border="0" cellpadding="2" cellspacing="0">
		<thead>
			<TR>
				<TD width="100"><bean:message key="account.text" /></TD>
				<TD width="50"><bean:message key="accountManager.text" /></TD>
				<TD width="50"><bean:message key="accountHandler.text" /></TD>
				<TD width="100"><bean:message key="invoiceId.text" /></TD>
				<TD width="50"><bean:message key="invoicePeriod.text" /></TD>
				<TD width="80"><bean:message key="agreedInvoiceAmount.columText" /></TD>
				<TD width="80"><bean:message key="actualInvoiceAmount.columText" /></TD>
				<TD width="100"><bean:message key="status.text" /></TD>
			</TR>
		</thead>
		<TBODY>
		<logic:iterate name="navResults" property="invoicesSearch" id="invoicesSearchID" indexId="i">
		<% String updateError = "updateError" + i; %>					
		<tr>
		<td width="100" valign="top"><a href="#" onClick="mainPageNavigationClientDetails('<bean:write name="invoicesSearchID" property="accountName"/>');return false;"><bean:write name="invoicesSearchID" property="accountName"/></a></td>
		<td width="50" valign="top"><bean:write name="invoicesSearchID" property="accountManager"/></td>
		<td width="50" valign="top"><bean:write name="invoicesSearchID" property="accountHandler"/></td>
		<td width="100" valign="top">
			<logic:equal name="invoicesSearchID" property="amountGross" value="n/a"><bean:write name="invoicesSearchID" property="amountGross"/></logic:equal>
			<logic:notEqual name="invoicesSearchID" property="amountGross" value="n/a">
				<a href="#" onClick="mainPageNavigationInvoiceAudit('<bean:write name="invoicesSearchID" property="invoiceId"/><bean:write name="invoicesSearchID" property="invoiceLineNo"/>');return false;"><bean:write name="invoicesSearchID" property="invoiceId"/><bean:write name="invoicesSearchID" property="invoiceLineNo"/>*<bean:write name="invoicesSearchID" property="numberOfLines"/></a>
			</logic:notEqual>
		</td>
		<td width="50" valign="top"><bean:write name="invoicesSearchID" property="invoiceMonth"/>/20<bean:write name="invoicesSearchID" property="invoiceYear"/></td>
		<td width="80" valign="top">
			<logic:equal name="invoicesSearchID" property="paymentType" value="ADJ">		
				<a href="#" onClick="mainPageNavigationInvoiceAuditADJ('<bean:write name="invoicesSearchID" property="accountName"/><bean:write name="invoicesSearchID" property="invoiceYear"/><bean:write name="invoicesSearchID" property="invoiceMonth"/>');return false;">ADJ</a>
			</logic:equal>
			<logic:notEqual name="invoicesSearchID" property="paymentType" value="ADJ">		
				<logic:equal name="invoicesSearchID" property="monthlyAgreed" value="">no budget</logic:equal>
				<logic:equal name="invoicesSearchID" property="amendmentFlag" value="Y">
					<a href="#" onClick="mainPageNavigationBudgetsAudit('<bean:write name="invoicesSearchID" property="accountName"/><bean:write name="invoicesSearchID" property="invoiceYear"/><bean:write name="invoicesSearchID" property="invoiceMonth"/>');return false;"><bean:write name="invoicesSearchID" property="monthlyAgreed"/></a>
				</logic:equal>
				<logic:equal name="invoicesSearchID" property="amendmentFlag" value="N">
					<bean:write name="invoicesSearchID" property="monthlyAgreed"/>
				</logic:equal>
			</logic:notEqual>
			&nbsp;<font color="red"><html:errors property="<%= updateError %>" /></font>
		</td>
		<td width="80" valign="top">
			<logic:equal name="invoicesSearchID" property="financeDivision" value="DOM">
				<bean:write name="invoicesSearchID" property="amountGross"/>
			</logic:equal>
			<logic:notEqual name="invoicesSearchID" property="financeDivision" value="DOM">
				<bean:write name="invoicesSearchID" property="amountNet"/>
			</logic:notEqual>
		</td>
		<td width="100" valign="top">
			<logic:equal name="invoicesSearchID" property="invoiceLineStatus" value="">
				<bean:write name="invoicesSearchID" property="budgetLineStatusText"/>
			</logic:equal>
			<logic:notEqual name="invoicesSearchID" property="invoiceLineStatus" value="">
				<bean:write name="invoicesSearchID" property="invoiceLineStatusText"/>
			</logic:notEqual>
			
		</td>		
		</tr>
		</logic:iterate>
	</tbody>
	</table>

	</div>
<br>
	</div>
<br>
	</div>
	</div>

</html:form>


<div class="clearBoth">&nbsp;</div>

<div id="footer">
<p>&copy; <bean:message key="domesticAndGeneral.text" /></p>
</div>

</BODY>
</html:html>



