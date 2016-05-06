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
	createActionForm.actionChosen.value= goTo;
	createActionForm.actionChosenType.value= "nav";
	createActionForm.submit();
}
function secondBarNavigation(goTo)
{
	createActionForm.actionChosen.value= goTo;
	createActionForm.actionChosenType.value= "func";
	createActionForm.submit();
}
function secondBarNavigation(goTo)
{
	createActionForm.actionChosen.value= goTo;
	createActionForm.actionChosenType.value= "func";
	createActionForm.submit();
}
function mainPageNavigationInvoiceAudit(invoiceIDSelected)
{
	createActionForm.actionChosen.value= "invoiceAudit";
	createActionForm.actionChosenType.value= "func";
	createActionForm.invoiceIDSelected.value= invoiceIDSelected;
	createActionForm.submit();
}
function mainPageNavigationActionHistory(actionHistorySelected)
{
	createActionForm.actionChosen.value= "actionHistory";
	createActionForm.actionChosenType.value= "func";
	createActionForm.actionHistorySelected.value= actionHistorySelected;
	createActionForm.submit();
}
function setAction(action)
{
	createActionForm.actionChosen.value= action;
	createActionForm.actionChosenType.value= "func";
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
     	<logic:equal name="navScreenResults" property="previousPage" value="invoiceAuthoriseSelection">
 			<li><a href="#" onClick="secondBarNavigation('goToInvoiceAuthoriseSelection');return false;"><bean:message key="invoiceAuthoriseSelection.text" /></a>&nbsp;&gt;</li>	
		</logic:equal>
     	<logic:equal name="navScreenResults" property="previousPage" value="invoicesSearch">
 			<li><a href="#" onClick="secondBarNavigation('goToInvoicesSearch');return false;"><bean:message key="invoicesSearch.text" /></a>&nbsp;&gt;</li>
  		</logic:equal>
  	<li><a href="#" onClick="secondBarNavigation('goToClientDetails');return false;"><bean:message key="clientDetails.text" /></a>&nbsp;&gt;</li>
	<li class="sectionSelected"><bean:message key="createAction.text" /></li>
	<!-- InstanceEndEditable -->
</ul>
</div>

<div id="content"><html:form action="/createAction.do" >


	<html:hidden property="actionChosen" value=""></html:hidden>
	<html:hidden property="actionChosenType" value=""></html:hidden>

  <div id="mainContent"><!-- InstanceBeginEditable name="Page content" --> 
    <div class="box"> 
    	<h3 class="headingB"><bean:message key="createAction.text" />&nbsp;<bean:write name="createActionResults" property="accountName" /></h3>
  		<p><bean:message key="createAction.prompt.text" /><br>
	<br>
	<bean:message key="required.text" /><br />
	<bean:message key="help1.text" /><img
		src="images/questionmark.gif" alt="question mark icon" width="18"
		height="18" border="1" />&nbsp;<bean:message
		key="help2.text" /></p>
   
  <p>
  <table width="90%" border="0" cellpadding="2" cellspacing="0">
	
        <tr>
          <td width="40%" valign="top"><bean:message key="actionText.text" /><b> *</b> </td>
          <td width="5%" valign="top"><a href="#"  onclick="return showInfo('e1','Inital help text.')"><img
		src="images/questionmark.gif" alt="question mark icon" width="18"
		height="18" border="1" /></a></td>
          <td width="55%" valign="top"><html:textarea property="actionText" cols="50" rows="5"></html:textarea>&nbsp;<font color="red"><html:errors property="actionTextError" /></font></td>
        </tr>
        <tr>
            <td width="40%"><bean:message key="actionOwner.text" /><b> *</b> </td>
			<td width="5%" valign="top"><a href="#"  onclick="return showInfo('e1','Inital help text.')"><img
				src="images/questionmark.gif" alt="question mark icon" width="18"
				height="18" border="1" /></a></td>
			<td width="55%" valign="top">
				<html:radio property="actionOwner" value="AH" ></html:radio><bean:message key="accountHandler.text" />: <bean:write name="createActionResults" property="accountHandler"/><BR>
  				<html:radio property="actionOwner" value="AM" ></html:radio><bean:message key="accountManager.text" />: <bean:write name="createActionResults" property="accountManager"/>
  				 		&nbsp;<font color="red"><html:errors property="actionOwnerError" /></font>
          	</td>
        </tr>
        <tr>
          <td width="40%"><bean:message key="alertActionOwnerEmail.text" /><b> *</b> </td>
          <td width="5%" valign="top"><a href="#"  onclick="return showInfo('e1','Inital help text.')"><img
			src="images/questionmark.gif" alt="question mark icon" width="18"
			height="18" border="1" /></a></td>
          <td width="55%" valign="top">
          	<html:radio property="actionEmail"  value="Y" ></html:radio>Yes
  			<html:radio property="actionEmail"  value="N" ></html:radio>No
  			&nbsp;<font color="red"><html:errors property="actionEmailError" /></font>		
    	  </td>
        </tr>
        </table>
  
   	 <p><html:submit styleClass="formButton" value="Confirm" onclick="javascript:setAction('confirm');" />&nbsp;
   	 <html:submit styleClass="formButton" value="Back" onclick="javascript:setAction('back');" /></p>
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



