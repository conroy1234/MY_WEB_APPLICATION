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
	maintenanceFinanceDivisionsForm.actionChosen.value= goTo;
	maintenanceFinanceDivisionsForm.actionChosenType.value= "nav";
	maintenanceFinanceDivisionsForm.submit();
}
function secondBarNavigation(goTo)
{
	maintenanceFinanceDivisionsForm.actionChosen.value= goTo;
	maintenanceFinanceDivisionsForm.actionChosenType.value= "func";
	maintenanceFinanceDivisionsForm.submit();
}
function setActionConfirm(vatCodeSelected)
{
	maintenanceFinanceDivisionsForm.actionChosen.value= "confirm";
	maintenanceFinanceDivisionsForm.actionChosenType.value= "func";
	maintenanceFinanceDivisionsForm.vatCodeSelected.value = vatCodeSelected
	maintenanceFinanceDivisionsForm.submit();
}
function setActionAudit(vatCodeSelected)
{
	maintenanceFinanceDivisionsForm.actionChosen.value= "audit";
	maintenanceFinanceDivisionsForm.actionChosenType.value= "func";
	maintenanceFinanceDivisionsForm.vatCodeSelected.value = vatCodeSelected
	maintenanceFinanceDivisionsForm.submit();
}
function setActionDisplayYes(vatCodeSelected)
{
	maintenanceFinanceDivisionsForm.actionChosen.value= "displayYes";
	maintenanceFinanceDivisionsForm.actionChosenType.value= "func";
	maintenanceFinanceDivisionsForm.vatCodeSelected.value = vatCodeSelected
	maintenanceFinanceDivisionsForm.submit();
}
function setActionDisplayNo(vatCodeSelected)
{
	maintenanceFinanceDivisionsForm.actionChosen.value= "displayNo";
	maintenanceFinanceDivisionsForm.actionChosenType.value= "func";
	maintenanceFinanceDivisionsForm.vatCodeSelected.value = vatCodeSelected
	maintenanceFinanceDivisionsForm.submit();
}
function setAction(action)
{
	maintenanceFinanceDivisionsForm.actionChosen.value= action;
	maintenanceFinanceDivisionsForm.actionChosenType.value= "func";
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
	<li class="sectionSelected"><bean:message key="maintenanceFinanceDivisions.text" /></li>
	<!-- InstanceEndEditable -->
</ul>
</div>

<div id="content"><html:form action="/maintenanceFinanceDivisions.do" >

	<html:hidden property="actionChosen" value=""></html:hidden>
	<html:hidden property="actionChosenType" value=""></html:hidden>
	<html:hidden property="vatCodeSelected" value=""></html:hidden>
		
  <div id="mainContent"><!-- InstanceBeginEditable name="Page content" --> 
    <div class="box"> 
    	<h3 class="headingB"><bean:message key="maintenanceFinanceDivisions.Edit.text" /></h3>
  		<p><bean:message key="maintenanceFinanceDivisions.Edit.prompt.text" /><br><br></p>
   
  <p>
		<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>
		    	<th width="5%" valign="top"><bean:message key="code.text" /></th>
    	    	<th width="20%" valign="top"><bean:message key="description.text" /></th>
        		<th width="10%" valign="top"><bean:message key="vatRate.text" /></th>
	        	<th width="10%" valign="top"><bean:message key="vatRateNew.text" /><br><a href="#"	onclick="return showInfo('e1','VAT rate must be entered in the format nn.nn<br>where n = numeric input<br>(Click ? to hide help text)')"><img
			src="images/questionmark.gif" width="18" height="18" border="0"	alt="VAT rate must be entered in the format nn.nn, where n = numeric input" /></a></th>
    	    	<th width="39%" valign="top"><bean:message key="comments.text" /></th>
        		<th width="15%" valign="top"><bean:message key="action.text" /></th>
 	        	<th width="15%" valign="top"><bean:message key="display.text" /></th>
 	        	<th width="15%" valign="top"><bean:message key="action.text" /><br><a href="#"	onclick="return showInfo('e1','Click Yes to set Display = Y if you wish this VAT rate to be displayed in the drop down list<br>Click No to Set Display = N if you do not wish this VAT rate to be displayed in the drop down list<br>(Click ? to hide help text)')"><img
			src="images/questionmark.gif" width="18" height="18" border="0"	alt="Set Display = Y if you wish this VAT rate to be displayed in the drop down list, or N if you do not wish this VAT rate to be displayed" /></a></th>
 	        </tr>
 	       	<tr id="e1" class="extraInfo">
   			 	<td colspan="8" >&nbsp;</td>
			</tr>
<logic:iterate name="maintenanceAccountsResults" property="financeDivisions" id="financeDivisionsID" indexId="i">
			<% String vatRateNewError = "vatRateNewError" + i;
			String commentsError = "commentsError" + i;
			String auditError = "auditError" + i;%>
		
<tr>
		<td width="5%" valign="top"><html:text name="financeDivisionsID" property="financeDivision"
					style="border:0; background-color:#E5EEF7;" size="3"
					readonly="true" indexed="true"><bean:write name="financeDivisionsID" property="financeDivision"/></html:text></td>
		<td width="20%" valign="top"><html:text name="financeDivisionsID" property="description"
					style="border:0; background-color:#E5EEF7;" size="30"
					readonly="true" indexed="true"><bean:write name="financeDivisionsID" property="description"/></html:text></td>
		<td width="10%" valign="top"><html:text name="financeDivisionsID" property="vatRate"
					style="border:0; background-color:#E5EEF7;" size="5"
					readonly="true" indexed="true"><bean:write name="financeDivisionsID" property="vatRate"/></html:text></td>
		<td  width="10%"><html:text name="financeDivisionsID" property="vatRateNew" indexed="true" size="5"/>&nbsp;
				<font color="red"><html:errors property="<%= vatRateNewError %>" /></font></td>
		<td  width="39%"><html:textarea  name="financeDivisionsID" property="comments" indexed="true" cols="30" rows="3"></html:textarea>&nbsp;
				<font color="red"><html:errors property="<%= commentsError %>" /></font></td>
		<td width="15%">
			<input type="submit" class="formButton" value="Confirm" onClick="javascript:setActionConfirm('<bean:write name="financeDivisionsID" property="financeDivision"/>');">
			<br><br>
			<input type="submit" class="formButton" value=" Audit " onClick="javascript:setActionAudit('<bean:write name="financeDivisionsID" property="financeDivision"/>');">
			&nbsp;<font color="red"><html:errors property="<%= auditError %>" /></font>
		</td>		
		<td width="15%" valign="top"><html:text name="financeDivisionsID" property="displayFlag"
					style="border:0; background-color:#E5EEF7;" size="1"
					readonly="true" indexed="true"><bean:write name="financeDivisionsID" property="displayFlag"/></html:text></td>
 		<td width="15%"><input type="submit" class="formButton" value="Yes" onClick="javascript:setActionDisplayYes('<bean:write name="financeDivisionsID" property="financeDivision"/>');">&nbsp;<input type="submit" class="formButton" value="No" onClick="javascript:setActionDisplayNo('<bean:write name="financeDivisionsID" property="financeDivision"/>');"></td>
		
</tr>
</logic:iterate>
			
      </table>
      
      <p><html:submit styleClass="formButton" value="Back" onclick="javascript:setAction('back');" />&nbsp;<html:submit styleClass="formButton" value="Cancel"
		onclick="javascript:setAction('cancelEdit');" tabindex="106"/></p>

	</div> 
   
	<div class="box"> 
 	<h3 class="headingB"><bean:message key="maintenanceFinanceDivisions.Create.text" /></h3>
  		<p><bean:message key="maintenanceFinanceDivisions.Create.prompt.text" /><br><br></p>
      <p>
     <table width="90%" border="0" cellpadding="2" cellspacing="0">
	 <tr>
          <th width="40%" valign="top"><bean:message key="code.text" /> *</th>
          <td width="55%" valign="top"><html:text property="codeCreate" size="4" maxlength="3" tabindex="4"/>&nbsp;
				<font color="red"><html:errors property="codeCreateError" /></font></td>
        </tr>
     <tr>
          <th width="40%" valign="top"><bean:message key="description.text" /> *</th>
          <td width="55%" valign="top"><html:text property="descriptionCreate" size="31" maxlength="30" tabindex="5"/>&nbsp;
				<font color="red"><html:errors property="descriptionCreateError" /></font></td>
        </tr>
    <tr>
          <th width="40%"><bean:message key="vatRate.text" /> *</th>
          <td width="55%" valign="top"><html:text property="vatRateCreate" size="10" maxlength="7" tabindex="6"/>&nbsp;
				<font color="red"><html:errors property="vatRateCreateError" /></font></td>
        </tr>
       
   <tr>
          <th width="40%" valign="top"><bean:message key="comments.text" /> *</th>
          <td width="55%" valign="top"><html:textarea property="commentsCreate" rows="5" cols="50"></html:textarea>&nbsp;
				<font color="red"><html:errors property="commentsCreateError" /></font></td>
           
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



