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
	originalInvoiceForm.actionChosen.value= goTo;
	originalInvoiceForm.actionChosenType.value= "nav";
	originalInvoiceForm.submit();
}
function secondBarNavigation(goTo)
{
	originalInvoiceForm.actionChosen.value= goTo;
	originalInvoiceForm.actionChosenType.value= "func";
	originalInvoiceForm.submit();
}
function setAction(action)
{
	originalInvoiceForm.actionChosen.value= action;
	originalInvoiceForm.actionChosenType.value= "func";
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
	<li><a href="#" onClick="secondBarNavigation('goToInvoicesSearch');return false;"><bean:message key="invoicesSearch.text" /></a>&nbsp;&gt;</li>
	<li><a href="#" onClick="secondBarNavigation('goToInvoiceAudit');return false;"><bean:message key="invoiceAudit.text" /></a>&nbsp;&gt;</li>
	<li class="sectionSelected"><bean:message key="originalInvoice.text" /></li>
	<!-- InstanceEndEditable -->
</ul>
</div>

<div id="content"><html:form action="/originalInvoice.do" >

	<html:hidden property="actionChosen" value=""></html:hidden>
	<html:hidden property="actionChosenType" value=""></html:hidden>
		
  <div id="mainContent"><!-- InstanceBeginEditable name="Page content" --> 
    <div class="box"> 
    	<h3 class="headingB"><bean:message key="originalInvoice.text" />&nbsp; <bean:write name="originalInvoiceResults" property="invoiceId" /></h3>
  		<p><br><br></p>
  		
   <table width="99%" border="0" cellpadding="2" cellspacing="0">
       <tr>
			<TH width="24%"><bean:message key="clientName.text" /></TH>
     	  	<TD width="24%"><bean:write name="originalInvoiceResults" property="accountName"/></TD>
      	 	<TH width="24%"><bean:message key="smaReference.text" /></TH>
      	 	<TD width="24%"><bean:write name="originalInvoiceResults" property="smaReference"/></TD>
       </tr>
        <tr>
			<TH width="24%"><bean:message key="invoiceNumber.text" /></TH>
     	  	<TD width="24%"><bean:write name="originalInvoiceResults" property="invoiceNo"/></TD>
      	 	<TH width="24%"><bean:message key="invoiceId.text" /></TH>
      	 	<TD width="24%"><bean:write name="originalInvoiceResults" property="invoiceId"/></TD>
       </tr>
       <tr>
			<TH width="24%"><bean:message key="invoiceDate.text" /></TH>
     	  	<TD width="24%"><bean:write name="originalInvoiceResults" property="invoiceDate" /></TD>
      	 	<TH width="24%"><bean:message key="unit.text" /></TH>
      	 	<TD width="24%"><bean:write name="originalInvoiceResults" property="unit"/></TD>
       </tr>
       <tr>
			<TH width="24%"><bean:message key="financeDivision.text" /></TH>
     	  	<TD width="24%"><bean:write name="originalInvoiceResults" property="financeDivision"/></TD>
      	 	<TH width="24%"><bean:message key="nature.text" /></TH>
      	 	<TD width="24%"><bean:write name="originalInvoiceResults" property="nature"/></TD>
       </tr>
       <tr>
			<TH width="24%"><bean:message key="purchaseLedger.text" /></TH>
     	  	<TD width="24%"><bean:write name="originalInvoiceResults" property="purchaseLedger"/></TD>
      	 	<TH width="24%"><bean:message key="transactionType.text" /></TH>
      	 	<TD width="24%"><bean:write name="originalInvoiceResults" property="transactionType"/></TD>
       </tr>
       
      </table>
      
 <div class="tableContainer" id="data">
	<table border="0" cellpadding="2" cellspacing="0">
		<thead>
			<TR>
				<TD width="9%"><bean:message key="lineNo.text" /></TD>
				<TD width="15%"><bean:message key="grossAmount.text" /></TD>
				<TD width="15%"><bean:message key="netAmount.text" /></TD>
				<TD width="15%"><bean:message key="vatAmount.text" /></TD>
				<TD width="15%"><bean:message key="paymentType.text" /></TD>
				<TD width="15%"><bean:message key="invoicePeriod.text" /></TD>
				<TD width="15%"><bean:message key="status.text" /></TD>
			</TR>
		</thead>
		<TBODY>
		<logic:iterate name="originalInvoiceResults" property="invoices" id="invoicesID" indexId="i">
			<TR>
				<TD width="9%"><bean:write name="invoicesID" property="invoiceLineNo"/></TD>
				<TD width="15%"><bean:write name="invoicesID" property="invoiceGrossAmount"/></TD>
				<TD width="15%"><bean:write name="invoicesID" property="invoiceNetAmount"/></TD>
				<TD width="15%"><bean:write name="invoicesID" property="invoiceVatAmount"/></TD>
				<TD width="15%"><bean:write name="invoicesID" property="paymentType"/></TD>
				<TD width="15%"><bean:write name="invoicesID" property="invoicePeriodMonth"/>/20<bean:write name="invoicesID" property="invoicePeriodYear"/></TD>
				<TD width="15%"><bean:write name="invoicesID" property="statusFormatted"/></TD>
			</TR>
		</logic:iterate>
	</tbody>
	</table>
	</div>
	
	<table width="99%" border="0" cellpadding="2" cellspacing="0">
        <tr>
          <td width="40%" valign="top">
           <table width="90%" border="0" cellpadding="2" cellspacing="0"> 
           <tr><th colspan="2"><bean:message key="total.text" /></th></tr>
           <tr><th width="70%"><bean:message key="netAmount.text" /></th><td width="30%"><bean:write name="originalInvoiceResults" property="totalNetAmount"/></td></tr>
           <tr><th width="70%"><bean:message key="vatAmount.text" /></th><td width="30%"><bean:write name="originalInvoiceResults" property="totalVatAmount"/></td></tr>
           <tr><th width="70%"><bean:message key="grossAmount.text" /></th><td width="30%"><bean:write name="originalInvoiceResults" property="totalGrossAmount"/></td></tr>
           </table>
           </td>
          <td width="60%" valign="top"><b><bean:message key="comments.text" /></b><br><bean:write name="originalInvoiceResults" property="comments" /></td>
        </tr>
      </table>
 
  
      <p><html:submit styleClass="formButton" value="Back" onclick="javascript:setAction('back');" /></p>
	<br>
	 	<h3 class="headingB"><bean:message key="headerAuditTrail.text" /></h3>
		<table border="0" cellpadding="2" cellspacing="0">

		<TBODY>
		<logic:iterate name="originalInvoiceResults" property="invoiceAudits" id="invoiceAuditsID" indexId="i">
			<TR>
				<TD width="39%"><bean:write name="invoiceAuditsID" property="statusUpdateFormatted"/></TD>
				<TD width="10%"><bean:write name="invoiceAuditsID" property="dateFormatted"/></TD>
				<TD width="10%"><bean:write name="invoiceAuditsID" property="author"/></TD>
				<TD width="39%"><bean:write name="invoiceAuditsID" property="comments"/></TD>
			</TR>
		</logic:iterate>
			
	</tbody>
	</table>
<br>
</div> 
</div> 
<div class="clearBoth">&nbsp;</div> 
</div>
</html:form>
<div class="clearBoth">&nbsp;</div>
<div id="footer">
<p>&copy; <bean:message key="domesticAndGeneral.text" /></p>
</div>
</BODY>
</html:html>



