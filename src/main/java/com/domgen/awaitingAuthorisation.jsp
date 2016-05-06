
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
<LINK href="theme/dg-consumer.css" rel="stylesheet"
	type="text/css">
<script language="JavaScript" type="text/JavaScript"
	src="dg-consumer.js"></script>
	
<title>Marketing Budgets</title>

<style type="text/css">
/* scrollable table with fixed header */
div.tableContainer {
	height: 348px; /* must be greater than tbody*/
	/*width: 500px; /* must be greater than tbody*/
	overflow: auto;
}

table > tbody {
	overflow: auto;
	height: 288px;
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

function setAction(action)
{
	awaitingAuthorisationForm.actionChosen.value= action;
}

function clearInvoiceEntryDate()
{
	awaitingAuthorisationForm.invoiceEntryDate.value = "";
}

function clearInvoiceDate()
{
	awaitingAuthorisationForm.invoiceDate.value = "";
}

function clearInvoiceNo()
{
	awaitingAuthorisationForm.invoiceNo.value = "";
}

function clearClientName()
{
	awaitingAuthorisationForm.clientName.value = "";
}

function clearStatus()
{
	awaitingAuthorisationForm.status.value = "";
}

function clearInvoiceId()
{
	awaitingAuthorisationForm.invoiceId.value = "";
}

function setRow(rowNo)
{
	awaitingAuthorisationForm.rowNo.value= rowNo;
}

</script>
</HEAD>

<BODY>
<div id="topLogo"><img src="images/domgen_logo.gif"
	alt="Domestic &amp; General Logo" width="136" height="75" /><i
	class="topStrap" style="text-indent: 15px"><bean:message key="marketingBudgets.text"/></i></div>
<div id="navMain">
<ul>
	<li><a href="/MarketingBudgets/test.jsp"><bean:message
		key="invoices.text" /></a></li>
	<li class="selected"><bean:message key="awaitingAuthorisation.text"/></li>
</ul>
</div>
<div id="navTrail">
<ul>
	<!-- InstanceBeginEditable name="trail" -->
	<li><a href="index.jsp"><bean:message key="underwriting.text"/></a>&nbsp;&gt;</li>
	<li class="sectionSelected"><bean:message key="awaitingAuthorisation.text"/></li>
	<!-- InstanceEndEditable -->
</ul>
</div>


<div id="content">
<html:form action="/awaitingAuthorisation.do">
<html:hidden property="rowNo" value=""></html:hidden>
<html:hidden property="actionChosen" value=""></html:hidden>
<div id="content">
	<div id="subSections">
	<div class="box">
	<h3 class="listHeadingA"><a href="javascript:void(0)" class="dsphead"
		onclick="dsp(this)"><span class="dspchar">+</span></a><bean:message key="search.text"/></h3>
	<div class="dspcont">
	<table width="60%" border="0" cellpadding="2" cellspacing="0">
		<tr>
			<td><bean:message key="invoiceId.text"/></td>
		</tr>
		<tr>
			<td><html:text property="invoiceId" size="10" maxlength="7" /><br>
			<html:button property="resetInvoiceId" styleClass="formButton" value="reset" onclick="clearInvoiceId()" /></td>
		</tr>
		<tr>
			<td><bean:message key="invoiceEntryDate.text"/></td>
		</tr>
		<tr>
			<td><html:text property="invoiceEntryDate" size="10" maxlength="8" /><br>
			<html:button property="resetInvoiceEntryDate" styleClass="formButton" value="reset" onclick="clearInvoiceEntryDate()" /></td>
		</tr>
		<tr>
			<td><bean:message key="invoiceDate.text"/></td>
		</tr>
		<tr>
			<td><html:text property="invoiceDate" size="10" maxlength="8" /><br>
			<html:button property="resetInvoiceDate" styleClass="formButton" value="reset" onclick="clearInvoiceDate()" /></td>
		</tr>
		<tr>
			<td><bean:message key="invoiceNumber.text"/></td>
		</tr>
		<tr>
			<td><html:text property="invoiceNo" size="10" maxlength="8" /><br>
			<html:button property="resetInvoiceNo" styleClass="formButton" value="reset" onclick="clearInvoiceNo()" /></td>
		</tr>				
		<tr>
			<td><bean:message key="clientName.text"/></td>
		</tr>
		<tr>
			<td><html:text property="clientName" size="15" maxlength="15" /><br>
			<html:button property="resetClientName" styleClass="formButton" value="reset" onclick="clearClientName()" /></td>
		</tr>
		<tr>
			<td><bean:message key="status.text"/></td>
		</tr>
		<tr>
			<td>
				<html:select property="status" styleClass="formText">
					<html:option value=""><bean:message key="pleaseSelect.text"/></html:option>
					<html:option value="10" >Early</html:option>
					<html:option value="20">New Entry</html:option>
					<html:option value="30" >U/W Authorised)</html:option>
					<html:option value="40">U/W Auth, agreement o/s</html:option>
			    </html:select><br>
			<html:button property="resetStatus" styleClass="formButton" value="reset" onclick="clearStatus()" /></td>
		</tr>		
		<tr>
			<td><html:submit styleClass="formButton" value="search" onclick="javascript:setAction('search');"/>&nbsp;<font color="red"><html:errors property="search" /></font></td>
		</tr>
		<tr>
			<td><html:submit styleClass="formButton" value="display all" onclick="javascript:setAction('displayAll');" /></td>
		</tr>
	</table>
	</div>
	<h3 class="listHeadingA"><a href="javascript:void(0)" class="dsphead"
		onclick="dsp(this)"><span class="dspchar">+</span></a><bean:message key="sort.text"/></h3>
	<div class="dspcont">
	<table width="60%" border="0" cellpadding="2" cellspacing="0">
		<tr>
			<td><bean:message key="sortBy.text"/></td>
		</tr>
		<tr>
			<td><html:select property="sortBy" styleClass="formText">
				<html:option value=""><bean:message key="pleaseSelect.text"/></html:option>
				<html:option value="MBIVID" >Invoice ID</html:option>
				<html:option value="MBEDAT">Invoice Entry Date</html:option>
				<html:option value="MB" >Invoice Date</html:option>
				<html:option value="MBIVNO">Invoice No</html:option>
				<html:option value="MBACCN">Client Name</html:option>
				<html:option value="MBSTAT">Status</html:option>
			</html:select></td>
		</tr>
		<tr>
			<td><html:submit styleClass="formButton" value="sort" onclick="javascript:setAction('sort');"/>&nbsp;<font color="red"><html:errors property="sort" /></font></td>
		</tr>
	</table>
	</div>
	</div>
	</div>
	
	<div id="mainContent">

	<div class="box">

	<h3 class="headingB"><bean:message key="awaitingAuthorisation.text"/></h3>

	<br>

	<div class="tableContainer" id="data">
	<table border="0" cellpadding="2" cellspacing="0">
		<thead>
			<tr>
				<bean:size id="size" name="indexResults" property="unauthorisedInvoices" scope="session"/>
				<td colspan="12"><bean:message key="total.text"/>:&nbsp;<bean:write name="size"/></td>
			</tr>
			<TR>
				<TD width="100">Invoice<BR>ID</TD>
				<TD width="100">Invoice<BR>Entry Date</TD>
				<TD width="100">Invoice<BR>No</TD>
				<TD width="100">Client<BR>Name</TD>
				<TD width="100">Agreed<BR>Month/Year</TD>
				<TD width="100">Invoice<BR>Amount<BR>Net</TD>
				<TD width="100">Invoice<BR>Amount<BR>VAT</TD>
				<TD width="100">Invoice<BR>Amount<BR>Gross</TD>								
				<TD width="100">Agreed<BR>Paid<BR>Amount</TD>
				<TD width="100">Invoice<BR>-<BR>Agreed</TD>
				<TD width="100">Status</TD>				
				<TD width="100">Action</TD>
			</TR>
		</thead>
		<TBODY>
			<logic:iterate name="indexResults" property="unauthorisedInvoices" id="invoice" indexId="i">
			<TR>
				<logic:equal name="invoice" property="financeDivision" value="DGS">
					<TD><font color="blue"><bean:write name="invoice" property="invoiceId"/></font></TD>
				</logic:equal>
				<logic:equal name="invoice" property="financeDivision" value="DOM">
					<TD><bean:write name="invoice" property="invoiceId"/></TD>
				</logic:equal>				
				<TD><bean:write name="invoice" property="entryDate"/></TD>
				<TD><bean:write name="invoice" property="invoiceNo"/></TD>
				<TD><bean:write name="invoice" property="accountName"/></TD>
				<TD><bean:write name="invoice" property="invoiceMonth"/>/<bean:write name="invoice" property="invoiceYear"/></TD>
				<TD><bean:write name="invoice" property="invoiceNetAmount"/></TD>
				<TD><bean:write name="invoice" property="invoiceVatAmount"/></TD>
				<TD><bean:write name="invoice" property="invoiceGrossAmount"/></TD>	
				<logic:equal name="invoice" property="paymentType" value="ADJ">
					<TD><a href="auditTrail.jsp">ADJ</a></TD>
					<TD>0.00</TD>
				</logic:equal>	
				<logic:equal name="invoice" property="paymentType" value="REG">						
					<TD><bean:write name="invoice" property="monthlyAgreed"/></TD>
					<TD><font color="red">5.00</font></TD>
				</logic:equal>
				<TD><bean:write name="invoice" property="status"/></TD>				
				<TD><html:submit styleClass="formButton" value="update" onclick="javascript.setRow('<%= i %>'); javascript:setAction('update');"/></TD>
			</TR>
			</logic:iterate>
	</tbody>
	</table>

	</div>

	<br>


	</div>
<br>
	</div>
	</div>

</html:form></div>
<!-- InstanceEndEditable -->
<div class="clearBoth">&nbsp;</div>
<div id="footer">
<p>&copy; <bean:message key="domesticAndGeneral.text" /></p>
</div>
</BODY>
</html:html>
