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
<LINK href="theme/dg-consumer.css" rel="stylesheet"	type="text/css">
<script language="JavaScript" type="text/JavaScript" src="dg-consumer.js"></script>

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
	invoiceEditForm.actionChosen.value= goTo;
	invoiceEditForm.actionChosenType.value= "nav";
	invoiceEditForm.submit();
}
function secondBarNavigation(goTo)
{
	invoiceEditForm.actionChosen.value= goTo;
	invoiceEditForm.actionChosenType.value= "func";
	invoiceEditForm.submit();
}
function setAction(action)
{
	invoiceEditForm.actionChosen.value= action;
	invoiceEditForm.actionChosenType.value= "func";
}

function setActionDelete(invoiceLineToDelete)
{
	input_box=confirm('Deleting this invoice line will also confirm any other changes made to this invoice.  Continue?');
	if (input_box==true)
	{
	invoiceEditForm.actionChosen.value= "delete";
	invoiceEditForm.actionChosenType.value= "func";
	invoiceEditForm.invoiceLineToDelete.value = invoiceLineToDelete
	invoiceEditForm.submit();
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
</div>


<div id="navTrail">
<ul>
	<!-- InstanceBeginEditable name="trail" -->
	<li><bean:write name="navScreenResults" property="function"/>&nbsp;&gt;</li>
	<li><a href="#" onClick="secondBarNavigation('goToInvoiceEditSelection');return false;"><bean:message key="invoiceEditSelection.text" /></a>&nbsp;&gt;</li>
	<li class="sectionSelected"><bean:message key="invoiceEdit.text" /></li>
	<!-- InstanceEndEditable -->
</ul>
</div>

<div id="content"><html:form action="/invoiceEdit.do" >
	
	<html:hidden property="actionChosen" value=""></html:hidden>
	<html:hidden property="actionChosenType" value=""></html:hidden>
	<html:hidden property="invoiceLineToDelete" value=""></html:hidden>
	
	<bean:define id="clients" name="invoiceEditSelectionResults" property="clients" />
	<bean:define id="financeDivisions" name="invoiceEditSelectionResults" property="financeDivisions" />
	<bean:define id="purchaseLedgers" name="invoiceEditSelectionResults" property="purchaseLedgers" />
	<bean:define id="units" name="invoiceEditSelectionResults" property="units" />
	<bean:define id="natures" name="invoiceEditSelectionResults" property="natures" />
	<bean:define id="transactions" name="invoiceEditSelectionResults" property="transactions" />
			
  <div id="mainContent"><!-- InstanceBeginEditable name="Page content" --> 
    <div class="box"> 
      <h3 class="headingB"><bean:message key="editInvoice.text" /></h3>
  		<p><bean:message key="invoiceEdit.prompt.text" /><br><br>
   		<bean:message key="required.text" /><br />
		</p>
<logic:iterate name="invoiceEditSelectionResults" property="invoiceHeader" id="invoiceHeaderID" indexId="iHdr" length="1">
			<% String day = "day" + iHdr;
				String month = "month" + iHdr;
				String year = "year" + iHdr;
				String accountName = "accountName" + iHdr;
				String invoiceNo = "invoiceNo" + iHdr;
				String unit = "unit" + iHdr;
				String financeDivision = "financeDivision" + iHdr;
				String nature = "nature" + iHdr;
				String purchaseLedger = "purchaseLedger" + iHdr;
				String transactionType = "transactionType" + iHdr;%>

<table width="90%" border="0" cellpadding="2" cellspacing="0">
	<tr>
        <td width="40%"> <bean:message key="clientName.text" /><b>*</b> </td>
        <td colspan="4" valign="top">
        		<html:select name="invoiceHeaderID" property="accountName" indexed="true" tabindex="1">
				<html:options collection="clients" property="accountName" labelProperty="smaReference" />
				</html:select>&nbsp;
				<font color="red"><html:errors property="<%= accountName %>" /></font>
		</td>
	</tr>
    
    <tr>
          <td width="40%"> <bean:message key="invoiceDate.text" /> <b>*</b> </td>
          <td colspan="4" valign="top">          		
				<html:select name="invoiceHeaderID" property="entryDateDay" styleClass="border" styleId="entryDateDay" style="width:auto" tabindex="2">
	                <html:optionsCollection name="dayDDL" property="daysList" value="value" label="label" />						
				</html:select>&nbsp;<font color="red"><html:errors property="<%= day %>" /></font>				
				<html:select name="invoiceHeaderID"  property="entryDateMonth" styleClass="border" styleId="entryDateMonth" style="width:auto" tabindex="3">
	                <html:optionsCollection name="monthsDDL" property="monthsListMM" value="value" label="label" />				
				</html:select>&nbsp;<font color="red"><html:errors property="<%= month %>" /></font>				
				<html:select name="invoiceHeaderID" property="entryDateYear" styleClass="border" styleId="entryDateYear" style="width:auto"  tabindex="4">
	                <html:optionsCollection name="yearDDL" property="yearsList" value="value" label="label" />					
				</html:select>&nbsp;<font color="red"><html:errors property="<%= year %>" /></font>
			</td>
	</tr>
       
    <tr>
        <td width="40%"> <bean:message key="invoiceNumber.text" /> <b>*</b> </td>
        <td colspan="1" valign="top"><html:text name="invoiceHeaderID" property="invoiceNo" indexed="true" />&nbsp;
			<font color="red"><html:errors property="<%= invoiceNo %>" /></font></td>
        <td width="40%"> <bean:message key="unit.text" /> <b>*</b> </td>
       	<td width="20%" valign="top">
			<html:select name="invoiceHeaderID" property="unit"  indexed="true" tabindex="5">
			<html:options collection="units" property="unit" />
			</html:select>&nbsp;
			<font color="red"><html:errors property="<%= unit %>" /></font>
		</td>

	<tr>
    	<td width="40%"> <bean:message key="financeDivision.text" /> <b>*</b> </td>
        <td width="20%" valign="top">
			<html:select name="invoiceHeaderID" property="financeDivision" indexed="true" tabindex="6">
			<html:options collection="financeDivisions" property="financeDivision" />
			</html:select>&nbsp;
			<font color="red"><html:errors property="<%= financeDivision %>" /></font>
		</td>
		<td width="40%"> <bean:message key="nature.text" /> <b>*</b> </td>
       	<td width="20%" valign="top">
			<html:select name="invoiceHeaderID" property="nature" indexed="true" tabindex="7">
			<html:options collection="natures" property="nature" />
			</html:select>&nbsp;
			<font color="red"><html:errors property="<%= nature %>" /></font>
		</td>
	</tr>

    <tr>
        <td width="40%" valign="top"> <bean:message key="purchaseLedger.text" /> <b>*</b> </td>
            <td width="20%" valign="top">
			<html:select name="invoiceHeaderID" property="purchaseLedger" indexed="true" tabindex="8">
			<html:options collection="purchaseLedgers" property="purchaseLedger" />
			</html:select>&nbsp;
			<font color="red"><html:errors property="<%= purchaseLedger %>" /></font>
	 	</td>
		<td width="40%"> <bean:message key="transaction.text" /> <b>*</b> 
		</td>  
		<td width="20%" valign="top">
			<html:select name="invoiceHeaderID" property="transactionType" indexed="true" tabindex="9">
			<html:options collection="transactions" property="transactionType" />
			</html:select>&nbsp;
			<font color="red"><html:errors property="<%= transactionType %>" /></font>
		</td>
	</tr>
	<tr id="e1" class="extraInfo">
    	<td colspan="4" >&nbsp;</td>
	</tr>
        
	</table>

	<div class="tableContainer" id="data">
	  <table width="92%" border="0" cellpadding="2" cellspacing="0">
	   <thead>
	  <tr>
		  <td width="10%"><bean:message key="invoicelineNo.text" /> </td>
		  <td width="15%"><bean:message key="netAmount.text" /><b>*</b> </td>
		  <td width="15%"><bean:message key="vatAmount.text" /></td>
		  <td width="15%"><bean:message key="grossAmount.text" /></td>
		  <td width="15%"><bean:message key="paymentType.text" /> <b>*</b> </td>
		  <td width="15%"><bean:message key="invoiceMonth.text" /> <b>*</b></td>
		  <td width="15%"><bean:message key="invoiceYear.text" /> <b>*</b></td>
		  <td width="15%"><bean:message key="invoiceStatus.text" /></td>
		  <td width="15%"><bean:message key="action.text" /><br><a href="#"	onclick="return showInfo('e1','Click Delete to: <br>  delete selected invoice line <br>  AND <br>  confirm all other edits to the invoice<br><br> For Audit purposes, it is best practice to delete an invoice line with relevant comments and then to make any other invoice edits separately with relevant comments<br><br> (Click ? to hide help text)')"><img
			src="images/questionmark.gif" width="18" height="18" border="0"	alt="Click Delete to: delete selected invoice line and confirm all other edits to the invoice." /></a></td>
		</tr>
	
		</thead>
		<tbody>
			
			<logic:iterate name="invoiceEditSelectionResults" property="invoices" id="invoice" indexId="i">
			<% String netAmountError = "netAmount" + i;
				String invoiceMonthError = "invoiceMonth" + i;
				String invoiceYearError = "invoiceYear" + i;
				String statusError = "status" + i;%>
		
			<tr>
				<td width="10%" valign="top"><html:text name="invoice" property="invoiceLineNo"
					style="border:0; background-color:#FFFFFF;" size="3"
					readonly="true" indexed="true"><bean:write name="invoice" property="invoiceLineNo"/></html:text></td>
				<td width="15%" valign="top"><html:text name="invoice" property="invoiceNetAmount" size="15" indexed="true" tabindex="<%=Integer.toString(10 + 4*i.intValue())%>"/><br>
				<font color="red"><logic:equal name="invoice" property="invoiceLineNo" value="1"><html:errors property="atLeastOneInvoice"/></logic:equal><html:errors property="<%= netAmountError %>"/></font></td>
				<td width="15%" valign="top"><html:text name="invoice" property="invoiceVatAmount"
					style="border:0; background-color:#FFFFFF;" size="15"
					readonly="true" indexed="true"/></td>
				<td width="15%" valign="top"><html:text name="invoice" property="invoiceGrossAmount"
					style="border:0; background-color:#FFFFFF;" size="15"
					readonly="true" indexed="true"/></td>
				<td width="15%" valign="top"><html:select name="invoice" property="paymentType" indexed="true" tabindex="<%=Integer.toString(11 + 4*i.intValue())%>">
					<html:option value="REG">Regular</html:option>
					<html:option value="ADJ">Adjustment</html:option>
				</html:select><br>
				<font color="red"><html:errors property="paymentType" /></font></td>
				<td width="15%" valign="top">
					<html:select  name="invoice" property="invoicePeriodMonth" styleClass="border" styleId="invoiceMonth" style="width:auto" indexed="true"  tabindex="<%=Integer.toString(12 + 4*i.intValue())%>">
	                   	<html:optionsCollection name="monthsDDL" property="monthsList" value="value" label="label" />
					</html:select>&nbsp;
				<font color="red"><html:errors property="<%= invoiceMonthError %>" /></font></td>
				<td width="15%" valign="top">
					<html:select name="invoice"  property="invoicePeriodYear" styleClass="border" styleId="invoiceYear" style="width:auto"  indexed="true" tabindex="<%=Integer.toString(13 + 4*i.intValue())%>">
	                   	<html:optionsCollection name="yearDDL" property="yearsListYY" value="value" label="label" />
					</html:select>&nbsp;<br>
				<font color="red"><html:errors property="<%= invoiceYearError %>" /></font></td>
			<td width="15%" valign="top"><html:text name="invoice" property="statusFormatted"
					style="border:0; background-color:#FFFFFF;" size="15"
					readonly="true" indexed="true"><bean:write name="invoice" property="statusFormatted"/></html:text><logic:equal name="invoice" property="statusFormatted" value="">&nbsp;</logic:equal><font color="red"><html:errors property="<%= statusError %>" /></font></td>
			
			<td width="15%" valign="top"><input name="Delete" type="button" class="formButton" value="Delete" onClick="javascript:setActionDelete('<bean:write name="invoice" property="invoiceLineNo"/>');"></td>
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
           <tr><td width="70%"><bean:message key="netAmount.text" /></td><td width="30%"><html:text name="invoiceHeaderID" property="totalNetAmount"
					style="border:0; background-color:#FFFFFF;" size="15"
					readonly="true" indexed="true"><bean:write name="invoiceHeaderID" property="totalNetAmount"/></html:text></td></tr>
           <tr><td width="70%"><bean:message key="vatAmount.text" /></td><td width="30%"><html:text name="invoiceHeaderID" property="totalVatAmount"
					style="border:0; background-color:#FFFFFF;" size="15"
					readonly="true" indexed="true"><bean:write name="invoiceHeaderID" property="totalVatAmount"/></html:text></td></tr>
           <tr><td width="70%"><bean:message key="grossAmount.text" /></td><td width="30%"><html:text name="invoiceHeaderID" property="totalGrossAmount"
					style="border:0; background-color:#FFFFFF;" size="15"
					readonly="true" indexed="true"><bean:write name="invoiceHeaderID" property="totalGrossAmount"/></html:text></td></tr>
           </table>
           </td>
          <td width="60%" valign="top"><bean:message key="comments.text" /><font color="red"><html:errors property="commentsError" /></font><br><textarea name="comments" rows="5" cols="50"><bean:write name="invoiceEditSelectionResults" property="comments"/></textarea></td>
        </tr>
      </table>
</logic:iterate>
	<p><html:submit styleClass="formButton" value="Calculate"
		onclick="javascript:setAction('calculate');" tabindex="105"/>&nbsp;
	<html:submit styleClass="formButton" value="Confirm"
		onclick="javascript:setAction('confirm');" tabindex="106"/>&nbsp;
	<html:submit styleClass="formButton" value="Cancel"
		onclick="javascript:setAction('cancel'); return confirm('Are you sure you want to cancel without saving changes? Continue?');" tabindex="107"/></p>
<p><html:submit styleClass="formButton" value="Delete Entire Invoice"
		onclick="javascript:setAction('deleteInvoice');return confirm('Are you sure you want to delete the entire invoice? Continue?');" tabindex="105"/>&nbsp;<font color="red"><html:errors property="deleteInvoiceError" /></font>
    </p>

    </div> 
  <div class="clearBoth">&nbsp;</div> 
</div>

</html:form>


<div class="clearBoth">&nbsp;</div>

<div id="footer">
<p>&copy; <bean:message key="domesticAndGeneral.text" /></p>
</div>

</div>
</BODY>
</html:html>


