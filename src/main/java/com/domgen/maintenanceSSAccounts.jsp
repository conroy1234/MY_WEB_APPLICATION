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
	maintenanceSSAccountsForm.actionChosen.value= goTo;
	maintenanceSSAccountsForm.actionChosenType.value= "nav";
	maintenanceSSAccountsForm.submit();
}
function setActionUpdate(accountNameSelected)
{
	maintenanceSSAccountsForm.actionChosen.value= "update";
	maintenanceSSAccountsForm.actionChosenType.value= "func";
	maintenanceSSAccountsForm.accountNameSelected.value= accountNameSelected;
	maintenanceSSAccountsForm.submit();
}
function setAction(action)
{
	maintenanceSSAccountsForm.actionChosen.value= action;
	maintenanceSSAccountsForm.actionChosenType.value= "func";
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
	<li ><a href="#" onClick="topBarNavigation('goToMaintenanceSS');return false;"><bean:message key="maintenanceSS.text" /></a>&nbsp;&gt;</li>
	<li class="sectionSelected"><bean:message key="maintenanceSSAccounts.text" /></li>
	<!-- InstanceEndEditable -->
</ul>
</div>

<div id="content"><html:form action="/maintenanceSSAccounts.do" >

	<html:hidden property="actionChosen" value=""></html:hidden>
	<html:hidden property="actionChosenType" value=""></html:hidden>
	<html:hidden property="accountNameSelected" value=""></html:hidden>
	
  <div id="mainContent"><!-- InstanceBeginEditable name="Page content" --> 
  
  	<div class="box">

    	<h3 class="headingB"><bean:message key="maintenanceSSAccounts.text" /></h3>
  		<p><bean:message key="maintenanceSSAccounts.prompt.text" /><br><br></p>

	<br>

	<div class="tableContainer" id="data">
	<table border="0" cellpadding="2" cellspacing="0">
		<thead>

			<TR>
				<TH width="15%"><bean:message key="accountName.text" /></TH>
				<TH width="10%"><bean:message key="accountManager.text" /></TH>
				<TH width="5%"><bean:message key="accountManagerSetUp.text" /></TH>
				<TH width="10%"><bean:message key="accountHandler.text" /></TH>
				<TH width="5%"><bean:message key="accountHandlerSetUp.text" /></TH>
				<TH width="10%"><bean:message key="smaReference.text" /></TH>
				<TH width="5%"><bean:message key="smaReferenceSetUp.text" /></TH>
				<TH width="15%"><bean:message key="status.text" /></TH>
				<TH width="10%">&nbsp;</TH>
			</TR>
		</thead>
		<TBODY>
		<logic:iterate name="maintenanceSSResults" property="accounts" id="accountsID" indexId="i">
					<% String accountNameError = "accountName" + i;%>			
			<tr>
				<td width="15%" valign="top"><html:text name="accountsID" property="accountName" style="border:0; background-color:#E5EEF7;" readonly="true"  size="20" indexed="true">
				<bean:write name="accountsID" property="accountName" /></html:text>&nbsp;<font color="red"><html:errors property="<%= accountNameError %>"/></font></td>
			
				<td width="10%" valign="top"><html:text name="accountsID" property="accountManager" style="border:0; background-color:#E5EEF7;" readonly="true" size="10" indexed="true">
				<bean:write name="accountsID" property="accountManager" /></html:text></td>
				<td width="5%" valign="top"><html:text name="accountsID" property="accountManagerSetUp" style="border:0; background-color:#E5EEF7;" readonly="true" size="3"indexed="true">
				<bean:write name="accountsID" property="accountManagerSetUp" /></html:text></td>
				<td width="10%" valign="top"><html:text name="accountsID" property="accountHandler" style="border:0; background-color:#E5EEF7;" readonly="true" size="10" indexed="true">
				<bean:write name="accountsID" property="accountHandler" /></html:text></td>				
				<td width="5%" valign="top"><html:text name="accountsID" property="accountHandlerSetUp" style="border:0; background-color:#E5EEF7;" readonly="true" size="3" indexed="true">
				<bean:write name="accountsID" property="accountHandlerSetUp" /></html:text></td>
				<td width="10%" valign="top"><html:text name="accountsID" property="smaReference" style="border:0; background-color:#E5EEF7;" readonly="true" size="20" indexed="true">
				<bean:write name="accountsID" property="smaReference" /></html:text></td>
				<td width="5%" valign="top"><html:text name="accountsID" property="smaReferenceSetUp" style="border:0; background-color:#E5EEF7;" readonly="true" size="3" indexed="true">
				<bean:write name="accountsID" property="smaReferenceSetUp" /></html:text></td>
				<td width="15%" valign="top"><html:select name="accountsID" property="status" indexed="true">
						<html:option value="10">Pending</html:option>
						<html:option value="20">Live</html:option>
						<html:option value="30">Reject</html:option>
					</html:select></td>
				<td width="10%" valign="top"><input type="submit" class="formButton" value="Update" onClick="javascript:setActionUpdate('<bean:write name="accountsID" property="accountName"/>');"></td>		
			</tr>
		</logic:iterate>
	</tbody>
	</table>

	</div>
<p><html:submit styleClass="formButton" value="Back" onclick="javascript:setAction('back');" /></p>
	<br>
	</div>
  
   <p>
  </div> 
  </div> 

</html:form>
<div class="clearBoth">&nbsp;</div>

<div id="footer">
<p>&copy; <bean:message key="domesticAndGeneral.text" /></p>
</div>

</BODY>
</html:html>


