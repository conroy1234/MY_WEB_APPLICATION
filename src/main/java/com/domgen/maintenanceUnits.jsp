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
	maintenanceUnitsForm.actionChosen.value= goTo;
	maintenanceUnitsForm.actionChosenType.value= "nav";
	maintenanceUnitsForm.submit();
}
function secondBarNavigation(goTo)
{
	maintenanceUnitsForm.actionChosen.value= goTo;
	maintenanceUnitsForm.actionChosenType.value= "func";
	maintenanceUnitsForm.submit();
}

function setActionDisplayYes(unitCodeSelected)
{
	maintenanceUnitsForm.actionChosen.value= "displayYes";
	maintenanceUnitsForm.actionChosenType.value= "func";
	maintenanceUnitsForm.unitCodeSelected.value = unitCodeSelected
	maintenanceUnitsForm.submit();
}
function setActionDisplayNo(unitCodeSelected)
{
	maintenanceUnitsForm.actionChosen.value= "displayNo";
	maintenanceUnitsForm.actionChosenType.value= "func";
	maintenanceUnitsForm.unitCodeSelected.value = unitCodeSelected
	maintenanceUnitsForm.submit();
}
function setActionDelete(unitCodeSelected)
{
	maintenanceUnitsForm.actionChosen.value= "delete";
	maintenanceUnitsForm.actionChosenType.value= "func";
	maintenanceUnitsForm.unitCodeSelected.value = unitCodeSelected
	maintenanceUnitsForm.submit();
}
function setAction(action)
{
	maintenanceUnitsForm.actionChosen.value= action;
	maintenanceUnitsForm.actionChosenType.value= "func";
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
<div id="navMain">	
	<logic:equal name="navScreenResults" property="role" value="ACCMGR"><jsp:include page="navAccountsManager.jsp"/></logic:equal>
	<logic:equal name="navScreenResults" property="role" value="ACCUSR"><jsp:include page="navAccountsUser.jsp"/></logic:equal>
</div>


<div id="navTrail">
<ul>
	<!-- InstanceBeginEditable name="trail" -->
	<li><bean:message key="accounts.text" />&nbsp;&gt;</li>
	<li><a href="#" onClick="secondBarNavigation('goToMaintenanceAccounts');return false;"><bean:message key="maintenanceAccounts.text" /></a>&nbsp;&gt;</li>
	<li class="sectionSelected"><bean:message key="maintenanceUnits.text" /></li>
	<!-- InstanceEndEditable -->
</ul>
</div>

<div id="content"><html:form action="/maintenanceUnits.do" >

	<html:hidden property="actionChosen" value=""></html:hidden>
	<html:hidden property="actionChosenType" value=""></html:hidden>
	<html:hidden property="unitCodeSelected" value=""></html:hidden>
		
  <div id="mainContent"><!-- InstanceBeginEditable name="Page content" --> 
    <div class="box"> 
    	<h3 class="headingB"><bean:message key="maintenanceUnits.Edit.text" /></h3>
  		<p><bean:message key="maintenanceUnits.Edit.prompt.text" /><br><br></p>
   
  <p>
		<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>
		    	<th width="5%" valign="top"><bean:message key="code.text" /></th>
    	    	<th width="20%" valign="top"><bean:message key="description.text" /></th>
 	        	<th width="15%" valign="top"><bean:message key="display.text" /></th>
 	        	<th width="15%" valign="top"><bean:message key="displaySetting.text" /></th>
 	        	<th width="15%" valign="top"><bean:message key="action.text" /></th>
 	        </tr>
<logic:iterate name="maintenanceAccountsResults" property="units" id="unitsID" indexId="i">

<tr>
		<td width="5%" valign="top"><html:text name="unitsID" property="unit"
					style="border:0; background-color:#E5EEF7;" size="6"
					readonly="true" indexed="true"><bean:write name="unitsID" property="unit"/></html:text></td>
		<td width="20%" valign="top"><html:text name="unitsID" property="description"
					style="border:0; background-color:#E5EEF7;" size="30"
					readonly="true" indexed="true"><bean:write name="unitsID" property="description"/></html:text></td>	
		<td width="15%" valign="top"><html:text name="unitsID" property="displayFlag"
					style="border:0; background-color:#E5EEF7;" size="1"
					readonly="true" indexed="true"><bean:write name="unitsID" property="displayFlag"/></html:text></td>
 		<td width="15%"><input type="submit" class="formButton" value="Yes" onClick="javascript:setActionDisplayYes('<bean:write name="unitsID" property="unit"/>');">&nbsp;<input type="submit" class="formButton" value="No" onClick="javascript:setActionDisplayNo('<bean:write name="unitsID" property="unit"/>');"></td>
		<td width="15%"><input type="submit" class="formButton" value="Delete" onClick="javascript:setActionDelete('<bean:write name="unitsID" property="unit"/>');"></td>
		
</tr>
</logic:iterate>
			
      </table>
      
      <p><html:submit styleClass="formButton" value="Back" onclick="javascript:setAction('back');" /></p>

	</div> 
   
	<div class="box"> 
 	<h3 class="headingB"><bean:message key="maintenanceUnits.Create.text" /></h3>
  		<p><bean:message key="maintenanceUnits.Create.prompt.text" /><br><br></p>
      <p>
     <table width="90%" border="0" cellpadding="2" cellspacing="0">
	 <tr>
          <th width="40%" valign="top"><bean:message key="code.text" /> *</th>
          <td width="55%" valign="top"><html:text property="codeCreate" size="6" maxlength="5" tabindex="4"/>&nbsp;
				<font color="red"><html:errors property="codeCreateError" /></font></td>
        </tr>
     <tr>
          <th width="40%" valign="top"><bean:message key="description.text" /> *</th>
          <td width="55%" valign="top"><html:text property="descriptionCreate" size="31" maxlength="30" tabindex="5"/>&nbsp;
				<font color="red"><html:errors property="descriptionCreateError" /></font></td>
        </tr>
  
        </table>
        <p>
<html:submit styleClass="formButton" value="Confirm"
		onclick="javascript:setAction('confirmCreate');" tabindex="105"/>&nbsp;<html:submit styleClass="formButton" value="Back" onclick="javascript:setAction('back');" />&nbsp;<html:submit styleClass="formButton" value="Cancel"
		onclick="javascript:setAction('cancelCreate');" tabindex="106"/>
    </p>
   
   <p>
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



