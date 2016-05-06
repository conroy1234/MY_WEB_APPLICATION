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
	clientDetailsForm.actionChosen.value= goTo;
	clientDetailsForm.actionChosenType.value= "nav";
	clientDetailsForm.submit();
}
function secondBarNavigation(goTo)
{
	clientDetailsForm.actionChosen.value= goTo;
	clientDetailsForm.actionChosenType.value= "func";
	clientDetailsForm.submit();
}
function mainPageNavigationInvoiceAudit(invoiceIDSelected)
{
	clientDetailsForm.actionChosen.value= "invoiceAudit";
	clientDetailsForm.actionChosenType.value= "func";
	clientDetailsForm.invoiceIDSelected.value= invoiceIDSelected;
	clientDetailsForm.submit();
}
function mainPageNavigationActionHistory(actionHistorySelected)
{
	clientDetailsForm.actionChosen.value= "actionHistory";
	clientDetailsForm.actionChosenType.value= "func";
		clientDetailsForm.actionHistorySelected.value= actionHistorySelected;
	clientDetailsForm.submit();
}
function setAction(action)
{
	clientDetailsForm.actionChosen.value= action;
	clientDetailsForm.actionChosenType.value= "func";
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
<bean:define id="previousPageid" name="navScreenResults" property="previousPage" />
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
     	<logic:equal name="navScreenResults" property="previousPage" value="invoiceAuthoriseSelection">
 			<li><a href="#" onClick="secondBarNavigation('goToInvoiceAuthoriseSelection');return false;"><bean:message key="invoiceAuthoriseSelection.text" /></a>&nbsp;&gt;</li>	
		</logic:equal>
     	<logic:equal name="navScreenResults" property="previousPage" value="invoicesSearch">
 			<li><a href="#" onClick="secondBarNavigation('goToInvoicesSearch');return false;"><bean:message key="invoicesSearch.text" /></a>&nbsp;&gt;</li>
  		</logic:equal>	
  	<li class="sectionSelected"><bean:message key="clientDetails.text" /></li>
	<!-- InstanceEndEditable -->
</ul>
</div>

<div id="content"><html:form action="/clientDetails.do" >

	<html:hidden property="actionChosen" value=""></html:hidden>
	<html:hidden property="actionChosenType" value=""></html:hidden>
	<html:hidden property="invoiceIDSelected" value=""></html:hidden>
	<html:hidden property="actionHistorySelected" value=""></html:hidden>

		
  <div id="mainContent"><!-- InstanceBeginEditable name="Page content" --> 
    <div class="box"> 
    	<h3 class="headingB"><bean:message key="clientDetails.text" />&nbsp;<bean:write name="clientDetailsResults" property="accountName" /></h3>
  		<p><br><br></p>
   
  <p>
  <font color="red"><html:errors property="error" /></font>
	<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>
        	<td width="30%" valign="top"><bean:message key="clientName.text" /></td>
        	<td width="40%" valign="top"><bean:write name="clientDetailsResults" property="accountName"/></td>	        	
        </tr>
        <tr>
        	<td width="30%" valign="top"><bean:message key="accountManager.text" /></td>
        	<td width="40%" valign="top"><bean:write name="clientDetailsResults" property="accountManager"/></td>	        	
        </tr>
        <tr>
        	<td width="30%" valign="top"><bean:message key="accountHandler.text" /></td>
        	<td width="40%" valign="top"><bean:write name="clientDetailsResults" property="accountHandler"/></td>	        	
        </tr>
        <tr>
        	<td width="30%" valign="top"><bean:message key="currentInvoicePeriod.text" /></td>
        	<td width="40%" valign="top"><bean:write name="clientDetailsResults" property="currentInvoicePeriod"/></td>	        	
        </tr>
        <tr>
        	<td width="30%" valign="top"><bean:message key="AgreedInvoiceAmountCurrentPeriod.text" /></td>
        	<td width="40%" valign="top"><bean:write name="clientDetailsResults" property="agreedInvoiceAmountCurrentPeriod"/></td>	        	
        </tr>
        <tr>
        	<td width="30%" valign="top"><bean:message key="currentInvoiceID.text" /></td>
        	<td width="40%" valign="top"><a href="#" onClick="mainPageNavigationInvoiceAudit('<bean:write name="clientDetailsResults" property="currentInvoiceID"/>');return false;"><bean:write name="clientDetailsResults" property="currentInvoiceID"/></a></td>	        	
        </tr>
        <tr>
        	<td width="30%" valign="top"><bean:message key="currentInvoiceAmount.text" /></td>
        	<td width="40%" valign="top"><bean:write name="clientDetailsResults" property="currentInvoiceAmount"/></td>	        	
        </tr>
         <tr>
        	<td width="30%" valign="top"><bean:message key="currentStatus.text" /></td>
        	<td width="40%" valign="top"><bean:write name="clientDetailsResults" property="currentStatus"/></td>	        	
        </tr>
  
        <tr>
        	<td width="30%" valign="top"><bean:message key="previousMostRecentPaymentDate.text" /></td>
        	<td width="40%" valign="top"><a href="#" onClick="mainPageNavigationInvoiceAudit('<bean:write name="clientDetailsResults" property="previousMostRecentPaymentInvoiceID"/>');return false;"><bean:write name="clientDetailsResults" property="previousMostRecentPaymentDate"/></a></td>	        	
        </tr>
		 <tr>
        	<td width="30%" valign="top"><bean:message key="previousMostRecentPaymentAmount.text" /></td>     	
          	<td width="40%" valign="top"><bean:write name="clientDetailsResults" property="previousMostRecentPaymentAmount"/> </td>	        	
  
        </tr>
        <tr>
        	<td width="30%" valign="top"><bean:message key="marketingBudgetPeriod.text" /></td>
        	<td width="40%" valign="top"><bean:write name="clientDetailsResults" property="marketingBudgetPeriod"/></td>	        	
        </tr>
        <tr>
        	<td width="30%" valign="top"><bean:message key="budgetExpiryDate.text" /></td>
        	<td width="40%" valign="top"><bean:write name="clientDetailsResults" property="budgetExpiryDate"/></td>	        	
        </tr>
        <tr>
        	<td width="30%" valign="top"><bean:message key="action.text" /></td>
        	<td width="40%" valign="top"><a href="#" onClick="mainPageNavigationActionHistory('<bean:write name="clientDetailsResults" property="accountName"/>');return false;"><bean:write name="clientDetailsResults" property="action"/></a></td>      	        	
        </tr>	
        <tr>
        	<td width="30%" valign="top"><bean:message key="actionOwner.text" /></td>
        	<td width="40%" valign="top"><bean:write name="clientDetailsResults" property="actionOwner"/></td>	        	
        </tr>
    </table>
      <p><html:submit styleClass="formButton" value="Add New Action" onclick="javascript:setAction('createAction');" /></p>
      <p>
     	<logic:equal name="navScreenResults" property="previousPage" value="invoiceAuthoriseSelection">
   			<html:submit styleClass="formButton" value="Back" onclick="javascript:setAction('backInvoiceAuthoriseSelection');" />
		</logic:equal>
     	<logic:equal name="navScreenResults" property="previousPage" value="invoicesSearch">
   			<html:submit styleClass="formButton" value="Back" onclick="javascript:setAction('backInvoicesSearch');" />
		</logic:equal>
	</p>

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



