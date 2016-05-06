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
<script language="JavaScript" type="text/JavaScript"
	src="dg-consumer.js"></script>

<title><bean:message key="marketingBudgets.text" /></title>

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

function topBarNavigation(goTo)
{
	maintenanceSSAccountHMsForm.actionChosen.value= goTo;
	maintenanceSSAccountHMsForm.actionChosenType.value= "nav";
	maintenanceSSAccountHMsForm.submit();
}
function setActionUpdate(initialsSelected)
{
	maintenanceSSAccountHMsForm.actionChosen.value= "update";
	maintenanceSSAccountHMsForm.actionChosenType.value= "func";
	maintenanceSSAccountHMsForm.initialsSelected.value= initialsSelected;
	maintenanceSSAccountHMsForm.submit();
}
function setAction(action)
{
	maintenanceSSAccountHMsForm.actionChosen.value= action;
	maintenanceSSAccountHMsForm.actionChosenType.value= "func";
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

<div id="topLogo"><img src="images/domgen_logo.gif"
	alt="Domestic &amp; General Logo" width="136" height="75" /> <i
	class="topStrap" style="text-indent: 15px"><bean:message key="marketingBudgets.text" /></i></div>

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
	<li><a href="#"
		onClick="topBarNavigation('goToMaintenanceSS');return false;"><bean:message
		key="maintenanceSS.text" /></a>&nbsp;&gt;</li>
	<li class="sectionSelected">
		<logic:equal name="maintenanceSSResults" property="accountHandlerManagerType" value="AH">
		<bean:message key="maintenanceSSAccountHMs.AH.text" />
		</logic:equal>
		<logic:equal name="maintenanceSSResults" property="accountHandlerManagerType" value="AM">
		<bean:message key="maintenanceSSAccountHMs.AM.text" />
		</logic:equal>
		<logic:equal name="maintenanceSSResults" property="accountHandlerManagerType" value="UW">
		<bean:message key="maintenanceSSEmail.UW.text" />
		</logic:equal>
		<logic:equal name="maintenanceSSResults" property="accountHandlerManagerType" value="SS">
		<bean:message key="maintenanceSSEmail.SS.text" />
		</logic:equal>
	</li>
	<!-- InstanceEndEditable -->
</ul>
</div>

<div id="content"><html:form action="/maintenanceSSAccountHMs.do">

	<html:hidden property="actionChosen" value=""></html:hidden>
	<html:hidden property="actionChosenType" value=""></html:hidden>
	<html:hidden property="initialsSelected" value=""></html:hidden>

	<div id="mainContent"><!-- InstanceBeginEditable name="Page content" -->

	<div class="box">

	<h3 class="headingB">
		<logic:equal name="maintenanceSSResults" property="accountHandlerManagerType" value="AH">
		<bean:message key="maintenanceSSAccountHMs.AH.edit.text" />
		</logic:equal>
		<logic:equal name="maintenanceSSResults" property="accountHandlerManagerType" value="AM">
		<bean:message key="maintenanceSSAccountHMs.AM.edit.text" />
		</logic:equal>
		<logic:equal name="maintenanceSSResults" property="accountHandlerManagerType" value="UW">
		<bean:message key="maintenanceSSEmail.UW.edit.text" />
		</logic:equal>
		<logic:equal name="maintenanceSSResults" property="accountHandlerManagerType" value="SS">
		<bean:message key="maintenanceSSEmail.SS.edit.text" />
		</logic:equal>
	</h3>
	<p>
		<logic:equal name="maintenanceSSResults" property="accountHandlerManagerType" value="AH">
		<bean:message key="maintenanceSSAccountHMs.AH.edit.prompt.text" />
		</logic:equal>
		<logic:equal name="maintenanceSSResults" property="accountHandlerManagerType" value="AM">
		<bean:message key="maintenanceSSAccountHMs.AM.edit.prompt.text" />
		</logic:equal>
		<logic:equal name="maintenanceSSResults" property="accountHandlerManagerType" value="UW">
		<bean:message key="maintenanceSSEmail.UW.edit.prompt.text" />
		</logic:equal>
		<logic:equal name="maintenanceSSResults" property="accountHandlerManagerType" value="SS">
		<bean:message key="maintenanceSSEmail.SS.edit.prompt.text" />
		</logic:equal>
	<br>
	</p>

	<div class="tableContainer" id="data">
	<p>
	<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>
			<th width="10%" valign="top"><bean:message key="initials.text" /></th>
			<th width="10%" valign="top"><bean:message key="userId.text" /></th>
			<th width="30%" valign="top"><bean:message key="name.text" /></th>
			<th width="40%" valign="top"><bean:message key="email.text" /></th>
			<th width="10%" valign="top"><bean:message key="action.text" /></th>
		</tr>
		<logic:iterate name="maintenanceSSResults" property="accountHMs"
			id="accountHMsID" indexId="i">
			<%String userIdError = "userIdError" + i;%>

			<tr>
				<td width="10%" valign="top"><html:text name="accountHMsID"
					property="initials" style="border:0; background-color:#E5EEF7;"
					size="20" readonly="true" indexed="true">
					<bean:write name="accountHMsID" property="initials" />
				</html:text></td>
				<td width="10%"><html:text name="accountHMsID"
					property="userId" size="20" indexed="true">
					<bean:write name="accountHMsID" property="userId" /></html:text>&nbsp; 
					<font color="red"><html:errors property="<%=userIdError%>" /></font></td>
				<td width="30%" valign="top"><html:text name="accountHMsID"
					property="name" style="border:0; background-color:#E5EEF7;"
					size="30" readonly="true" indexed="true"><bean:write
					name="accountHMsID" property="name" /></html:text></td>
				<td width="40%" valign="top"><html:text name="accountHMsID"
					property="email" style="border:0; background-color:#E5EEF7;"
					size="40" readonly="true" indexed="true"><bean:write
					name="accountHMsID" property="email" /></html:text></td>
				<td width="10%"><input type="submit" class="formButton"
					value="Update"
					onClick="javascript:setActionUpdate('<bean:write name="accountHMsID" property="initials"/>');"></td>
			</tr>

		</logic:iterate>
	</table>
	</div>
		<p><html:submit styleClass="formButton" value="Back"
		onclick="javascript:setAction('back');" /></p>
	<p>
	</div>
	<div class="box">
	<h3 class="headingB">
		<logic:equal name="maintenanceSSResults" property="accountHandlerManagerType" value="AH">
		<bean:message key="maintenanceSSAccountHMs.AH.create.text" />
		</logic:equal>
		<logic:equal name="maintenanceSSResults" property="accountHandlerManagerType" value="AM">
		<bean:message key="maintenanceSSAccountHMs.AM.create.text" />
		</logic:equal>
		<logic:equal name="maintenanceSSResults" property="accountHandlerManagerType" value="UW">
		<bean:message key="maintenanceSSEmail.UW.create.text" />
		</logic:equal>
		<logic:equal name="maintenanceSSResults" property="accountHandlerManagerType" value="SS">
		<bean:message key="maintenanceSSEmail.SS.create.text" />
		</logic:equal>
		<br>
		</h3>
	<p>
		<logic:equal name="maintenanceSSResults" property="accountHandlerManagerType" value="AH">
		<bean:message key="maintenanceSSAccountHMs.AH.create.prompt.text" />
		</logic:equal>
		<logic:equal name="maintenanceSSResults" property="accountHandlerManagerType" value="AM">
		<bean:message key="maintenanceSSAccountHMs.AM.create.prompt.text" />
		</logic:equal>
		<logic:equal name="maintenanceSSResults" property="accountHandlerManagerType" value="UW">
		<bean:message key="maintenanceSSEmail.UW.create.prompt.text" />
		</logic:equal>
		<logic:equal name="maintenanceSSResults" property="accountHandlerManagerType" value="SS">
		<bean:message key="maintenanceSSEmail.SS.create.prompt.text" />
		</logic:equal>	
	<br>
	</p>
	<p>
	<table width="90%" border="0" cellpadding="2" cellspacing="0">
		<tr>
			<th width="40%" valign="top"><bean:message key="initials.text" /> *</th>
			<td width="55%" valign="top"><html:text property="initialsCreate"
				size="11" maxlength="10" tabindex="4" />&nbsp; <font color="red"><html:errors
				property="initialsCreateError" /></font></td>
		</tr>
		<tr>
			<th width="40%" valign="top"><bean:message key="userId.text" /> *</th>
			<td width="55%" valign="top"><html:text property="userIdCreate"
				size="11" maxlength="10" tabindex="5" />&nbsp; <font color="red"><html:errors
				property="userIdCreateError" /></font></td>
		</tr>
	</table>
	<p><html:submit styleClass="formButton" value="Confirm"
		onclick="javascript:setAction('confirmCreate');" tabindex="105" />&nbsp;<html:submit styleClass="formButton" value="Back" onclick="javascript:setAction('back');" />&nbsp;<html:submit styleClass="formButton" value="Cancel"
		onclick="javascript:setAction('cancelCreate');" tabindex="106"/></p>

	<p>
	</div>

	<p>
	</div></div>

</html:form>
<div class="clearBoth">&nbsp;</div>

<div id="footer">
<p>&copy; <bean:message key="domesticAndGeneral.text" /></p>
</div>

</BODY>
</html:html>


