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
	actionHistoryForm.actionChosen.value= goTo;
	actionHistoryForm.actionChosenType.value= "nav";
	actionHistoryForm.submit();
}
function secondBarNavigation(goTo)
{
	actionHistoryForm.actionChosen.value= goTo;
	actionHistoryForm.actionChosenType.value= "func";
	actionHistoryForm.submit();
}

function mainPageNavigationActionHistory(actionHistorySelected)
{
	actionHistoryForm.actionChosen.value= "actionHistory";
	actionHistoryForm.actionChosenType.value= "func";
		actionHistoryForm.actionHistorySelected.value= actionHistorySelected;
	actionHistoryForm.submit();
}
function setAction(action)
{
	actionHistoryForm.actionChosen.value= action;
	actionHistoryForm.actionChosenType.value= "func";
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
	<li class="sectionSelected"><bean:message key="clientHistory.text" /></li>
	<!-- InstanceEndEditable -->
</ul>
</div>

<div id="content"><html:form action="/actionHistory.do" >

	<html:hidden property="actionChosen" value=""></html:hidden>
	<html:hidden property="actionChosenType" value=""></html:hidden>
			
  <div id="mainContent"><!-- InstanceBeginEditable name="Page content" --> 
    <div class="box"> 
    	<h3 class="headingB"><bean:message key="actionHistory.text" />&nbsp;<bean:write name="actionHistoryResults" property="accountName" /></h3>
  		<p><br><br></p>
   
  <p>
<div class="tableContainer" id="data">
	<table border="0" cellpadding="2" cellspacing="0">
		<thead>
			<tr>
				<td colspan="9">Total:&nbsp;<bean:write name="actionHistoryResults" property="totalActions" /></td>
			</tr>
			<TR>
				<TD width="60%"><bean:message key="actionText.text" /></TD>
				<TD width="13%"><bean:message key="status.text" /></TD>
				<TD width="13%"><bean:message key="actionOwner.text" /></TD>
				<TD width="13%"><bean:message key="dateCreated.text" /></TD>
			</TR>
		</thead>
		<TBODY>
		<logic:iterate name="actionHistoryResults" property="actions" id="actionsID" indexId="i">
			<TR>
				<TD width="60%"><bean:write name="actionsID" property="actionText"/></TD>
				<TD width="13%"><bean:write name="actionsID" property="statusText"/></TD>
				<TD width="13%"><bean:write name="actionsID" property="actionOwner"/></TD>
				<TD width="13%"><bean:write name="actionsID" property="dateFormatted"/></TD>
			</TR>
		</logic:iterate>
			
	</tbody>
	</table>
 	</div>
  
   	 <p><html:submit styleClass="formButton" value="Add New Action" onclick="javascript:setAction('createAction');" /></p>
     <p><html:submit styleClass="formButton" value="Back" onclick="javascript:setAction('back');" /></p>
   
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



