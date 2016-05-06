
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
	
<title><bean:message key="marketingBudgets.text"/></title>

<style type="text/css">
/* scrollable table with fixed header */
div.tableContainer {
	height: 248px; /* must be greater than tbody*/
	/*width: 500px; /* must be greater than tbody*/
	overflow: auto;
}

table > tbody {
	overflow: auto;
	height: 188px;
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

function topBarNavigation(goTo)
{
	invoiceEntryForm.actionChosen.value= goTo;
	invoiceEntryForm.actionChosenType.value= "nav";
	invoiceEntryForm.submit();
}

function setAction(action)
{
	invoiceEntryForm.actionChosen.value= action;
	invoiceEntryForm.actionChosenType.value= "func";
}
</script>

</HEAD>

<BODY>
<div id="topLogo"><img src="images/domgen_logo.gif"
	alt="Domestic &amp; General Logo" width="136" height="75" /><i
	class="topStrap" style="text-indent: 15px"><bean:message key="marketingBudgets.text" /></i></div>

<bean:define id="roleid" name="navScreenResults" property="role" />
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
	<li><a href="index.jsp"><bean:message key="accounts.text" /></a>&nbsp;&gt;</li>
	<li class="sectionSelected"><bean:message key="invoiceEntry.text" /></li>
	<!-- InstanceEndEditable -->
</ul>
</div>
<div id="content"><html:form action="/invoiceEntry.do">

	<html:hidden property="actionChosen" value=""></html:hidden>
	<html:hidden property="actionChosenType" value=""></html:hidden>
	
	<bean:define id="clients" name="navResults" property="clients" />
	<bean:define id="financeDivisions" name="navResults" property="financeDivisions" />
	<bean:define id="purchaseLedgers" name="navResults" property="purchaseLedgers" />
	<bean:define id="units" name="navResults" property="units" />
	<bean:define id="natures" name="navResults" property="natures" />
	<bean:define id="transactions" name="navResults" property="transactions" />
	
	<div id="mainContent"><!-- InstanceBeginEditable name="Page content" -->
	<div class="box">
	
	<h3 class="headingB">
	<logic:notEqual name="invoiceEntryForm" property="previousInvoiceId" value="">
		<bean:message key="previousInvoiceId.text" />&nbsp;<html:text property="previousInvoiceId"
			style="border:0; font-weight: bold; color: #F0F5FB; background-color:#003366;" size="15"
			readonly="true"/><br><br>
	</logic:notEqual>
	<bean:message key="createNewInvoice.text" /></h3>
	<p><bean:message key="invoiceEntry.prompt.text" /><br>
	<br>
	<bean:message key="required.text" /><br />
	<bean:message key="help1.text" /><img
		src="images/questionmark.gif" alt="question mark icon" width="18"
		height="18" border="1" />&nbsp;<bean:message
		key="help2.text" /></p>
	<table width="90%" border="0" cellpadding="2" cellspacing="0">
		<tr>
			<td width="40%"><bean:message key="clientName.text" />&nbsp;<b>*</b>
			</td>
			<td width="5%" valign="top"><a href="#"	onclick="return showInfo('e1','Please select a Client Name (SMA reference).')"><img
				src="images/questionmark.gif" width="18" height="18" border="0"	alt="Please select a Client Name (SMA reference)." /></a>
			</td>
			<td colspan="4" valign="top">
				<html:select property="accountName" tabindex="1">
				<html:option value=""><bean:message key="pleaseSelect.text" /></html:option>
				<html:options collection="clients" property="accountName" labelProperty="smaReference" />
				</html:select>&nbsp;<font color="red"><html:errors property="accountName" /></font>
			</td>
		</tr>
		<tr>
			<td width="40%"><bean:message key="invoiceDate.text" />&nbsp;<b>*</b>
			</td>
			<td width="5%" valign="top"><a href="#"	onclick="return showInfo('e1','Please enter the clients invoice date.')"><img
				src="images/questionmark.gif" width="18" height="18" border="0"	alt="Please enter the clients invoice date." /></a>
			</td>
			<td colspan="4" valign="top">				
				<html:select property="entryDateDay" styleClass="border" styleId="entryDateDay" style="width:auto" tabindex="2">
	                <html:optionsCollection name="dayDDL" property="daysList" value="value" label="label" />						
				</html:select>&nbsp;<font color="red"><html:errors property="entryDateDay" /></font>									
				<html:select property="entryDateMonth" styleClass="border" styleId="entryDateMonth" style="width:auto" tabindex="2">
	                <html:optionsCollection name="monthsDDL" property="monthsListMM" value="value" label="label" />				
				</html:select>&nbsp;<font color="red"><html:errors property="entryDateMonth" /></font>
				<html:select property="entryDateYear" styleClass="border" styleId="entryDateYear" style="width:auto"  tabindex="3">
	                <html:optionsCollection name="yearDDL" property="yearsList" value="value" label="label" />					
				</html:select>&nbsp;<font color="red"><html:errors property="entryDateYear" /></font>
			</td>
		</tr>
		<tr>
			<td width="40%"><bean:message key="invoiceNumber.text" />&nbsp;<b>*</b>
			</td>
			<td width="5%" valign="top"><a href="#"	onclick="return showInfo('e1','Please enter the clients invoice number.')"><img
				src="images/questionmark.gif" width="18" height="18" border="0" alt="Please enter the clients invoice number." /></a>
			</td>
			<td width="30%" valign="top"><html:text property="invoiceNo" size="26" tabindex="4"/>&nbsp;<font color="red"><html:errors
				property="invoiceNumber" /></font>
			</td>
			<td width="40%"> <bean:message key="unit.text" /> <b>*</b>
			</td>
            <td width="20%" valign="top">
				<html:select property="unit" tabindex="1">				
				<html:options collection="units" property="unit" />
				</html:select>&nbsp;<font color="red"><html:errors property="unit" /></font>
			</td>
		</tr>
		
		<tr>
			<td width="40%"><bean:message key="financeDivision.text" />&nbsp;<b>*</b>
			</td>
			<td width="5%" valign="top"><a href="#"	onclick="return showInfo('e1','Please enter the relevant finance division.')"><img
				src="images/questionmark.gif" width="18" height="18" border="0"	alt="Please enter the relevant finance division." /></a>
			</td>
			<td width="30%" valign="top"><html:select property="financeDivision" tabindex="5">
				<html:options collection="financeDivisions"	property="financeDivision" labelProperty="financeDivision" />
				</html:select>&nbsp;<font color="red"><html:errors property="financeDivision" /></font></td>
			<td width="40%"> <bean:message key="nature.text" /> <b>*</b> 
			</td>
       		<td width="20%" valign="top">
				<html:select property="nature" tabindex="1">
				<html:options collection="natures" property="nature" />
				</html:select>&nbsp;<font color="red"><html:errors property="nature" /></font>
			</td>
		</tr>
		<tr>
			<td width="40%" valign="top"><bean:message key="purchaseLedger.text" />&nbsp;<b>*</b>
			</td>
			<td width="5%" valign="top"><a href="#"	onclick="return showInfo('e1','Please enter the relevant purchase ledger.')"><img
				src="images/questionmark.gif" width="18" height="18" border="0"	alt="Please enter the relevant purchase ledger." /></a>
			</td>
			<td width="30%" valign="top">
				<html:select property="purchaseLedger" tabindex="6">
				<html:options collection="purchaseLedgers" property="purchaseLedger" labelProperty="purchaseLedger" />
				</html:select>&nbsp;<font color="red"><html:errors property="purchaseLedger" /></font>
			</td>
			<td width="40%"> <bean:message key="transaction.text" /> <b>*</b> 
			</td>  
			<td width="20%" valign="top">
				<html:select property="transactionType" tabindex="1">
				<html:options collection="transactions" property="transactionType" />
				</html:select>&nbsp;<font color="red"><html:errors property="transactionType" /></font>
			</td>
		</tr>
		<tr id="e1" class="extraInfo">
			<td colspan="5">&nbsp;</td>
		</tr>
	</table>

<div class="tableContainer" id="data">
	<table width="92%" border="0" cellpadding="2" cellspacing="0">
		<thead>
			<tr>
				<td width="10%"><bean:message key="lineNo.text" /></td>
				<td width="15%"><bean:message key="netAmount.text" />&nbsp;<bean:message key="pound.text" />&nbsp;<b>*</b></td>
				<td width="15%"><bean:message key="vatAmount.text" /></td>
				<td width="15%"><bean:message key="grossAmount.text" /></td>
				<td width="15%"><bean:message key="paymentType.text" />&nbsp;<b>*</b></td>
				<td width="15%"><bean:message key="invoiceMonth.text" />&nbsp;<b>*</b></td>
				<td width="15%"><bean:message key="invoiceYear.text" />&nbsp;<b>*</b></td>
			</tr>
		</thead>
		<tbody>
			<logic:iterate name="navResults" property="invoices" id="invoice" indexId="i">
			<% String netAmountError = "netAmount" + i;
				String invoiceMonthError = "invoiceMonth" + i;
				String invoiceYearError = "invoiceYear" + i;%>
			<tr>
				<td width="10%" valign="top"><html:text name="invoice" property="lineNo"
					style="border:0; background-color:#E5EEF7;" size="3"
					readonly="true" indexed="true"><bean:write name="invoice" property="lineNo"/></html:text></td>
				<td width="15%" valign="top"><html:text name="invoice" property="netAmount" size="15" indexed="true" tabindex="<%=Integer.toString(7 + 4*i.intValue())%>"/><br>
				<font color="red"><logic:equal name="invoice" property="lineNo" value="1"><html:errors property="atLeastOneInvoice"/></logic:equal><html:errors property="<%= netAmountError %>"/></font></td>
				<td width="15%" valign="top"><html:text name="invoice" property="vatAmount"
					style="border:0; background-color:#E5EEF7;" size="15"
					readonly="true" indexed="true"/></td>
				<td width="15%" valign="top"><html:text name="invoice" property="grossAmount"
					style="border:0; background-color:#E5EEF7;" size="15"
					readonly="true" indexed="true"/></td>
				<td width="15%" valign="top"><html:select name="invoice" property="paymentType" indexed="true" tabindex="<%=Integer.toString(8 + 4*i.intValue())%>">
					<html:option value="REG">Regular</html:option>
					<html:option value="ADJ">Adjustment</html:option>
				</html:select><br>
				<font color="red"><html:errors property="paymentType" /></font></td>
				<td width="15%" valign="top">
					<html:select name="invoice" property="invoiceMonth" styleClass="border" styleId="invoiceMonth" style="width:auto" indexed="true" tabindex="<%=Integer.toString(9 + 4*i.intValue())%>">
	                   	<html:optionsCollection name="monthsDDL" property="monthsList" value="value" label="label" />
					</html:select>&nbsp;<br>		
				<font color="red"><html:errors property="<%= invoiceMonthError %>" /></font></td>
				
				<td width="15%" valign="top">			
					<html:select name="invoice" property="invoiceYear" styleClass="border" styleId="invoiceYear" style="width:auto"  indexed="true" tabindex="<%=Integer.toString(10 + 4*i.intValue())%>">
	                   	<html:optionsCollection name="yearDDL" property="yearsListYY" value="value" label="label" />
					</html:select>&nbsp;<br>		
				<font color="red"><html:errors property="<%= invoiceYearError %>" /></font></td>
			</tr>
			</logic:iterate>
		</tbody>
	</table>
	</div>
	  <table width="90%" border="0" cellpadding="2" cellspacing="0">
        <tr>
          <td width="40%" valign="top">
           <table width="90%" border="0" cellpadding="2" cellspacing="0"> 
           <tr><td colspan="2"><bean:message key="total.text" /></td></tr>
           <tr><td width="70%"><bean:message key="netAmount.text" /></td><td width="30%"><html:text property="totalNetAmount"
				style="border:0; background-color:#E5EEF7;" size="15" readonly="true" /></td></tr>
           <tr><td width="70%"><bean:message key="vatAmount.text" /></td><td width="30%"><html:text property="totalVatAmount"
				style="border:0; background-color:#E5EEF7;" size="15" readonly="true" /></td></tr>
           <tr><td width="70%"><bean:message key="grossAmount.text" /></td><td width="30%"><html:text property="totalGrossAmount"
				style="border:0; background-color:#E5EEF7;" size="15" readonly="true" /></td></tr>
           </table>
           </td>
          <td width="60%" valign="top"><bean:message key="comments.text" /><br><html:textarea property="comments" rows="5" cols="50"></html:textarea>&nbsp;<font color="red"><html:errors property="commentsError" /></td>
        </tr>
      </table>

	<p><html:submit styleClass="formButton" value="Calculate"
		onclick="javascript:setAction('calculate');" tabindex="105"/>&nbsp;<html:submit
		styleClass="formButton" value="Confirm"
		onclick="javascript:setAction('confirm');" tabindex="106"/>&nbsp;<html:submit
		styleClass="formButton" value="Cancel"
		onclick="javascript:setAction('cancel');" tabindex="107"/></p>
	</div>
	<!-- InstanceEndEditable --></div>
	<div class="clearBoth">&nbsp;</div></div>
</html:form>
<!-- InstanceEndEditable -->
<div class="clearBoth">&nbsp;</div>
<div id="footer">
<p>&copy; <bean:message key="domesticAndGeneral.text" /></p>
</div>
</BODY>
</html:html>
