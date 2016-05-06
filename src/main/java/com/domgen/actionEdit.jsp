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
	actionEditForm.actionChosen.value= goTo;
	actionEditForm.actionChosenType.value= "nav";
	actionEditForm.submit();
}
function secondBarNavigation(goTo)
{
	actionEditForm.actionChosen.value= goTo;
	actionEditForm.actionChosenType.value= "func";
	actionEditForm.submit();
}

function setActionDisplayYes(natureCodeSelected)
{
	actionEditForm.actionChosen.value= "displayYes";
	actionEditForm.actionChosenType.value= "func";
	actionEditForm.natureCodeSelected.value = natureCodeSelected
	actionEditForm.submit();
}
function setActionDisplayNo(natureCodeSelected)
{
	actionEditForm.actionChosen.value= "displayNo";
	actionEditForm.actionChosenType.value= "func";
	actionEditForm.natureCodeSelected.value = natureCodeSelected
	actionEditForm.submit();
}
function setAction(action)
{
	actionEditForm.actionChosen.value= action;
	actionEditForm.actionChosenType.value= "func";
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
	<logic:equal name="navScreenResults" property="role" value="SSMGR"><jsp:include page="navSSManager.jsp"/></logic:equal>
	<logic:equal name="navScreenResults" property="role" value="AHMMGR"><jsp:include page="navAccountHMsManager.jsp"/></logic:equal>
	<logic:equal name="navScreenResults" property="role" value="AHMUSR"><jsp:include page="navAccountHMsManager.jsp"/></logic:equal>
</div>


<div id="navTrail">
<ul>
	<!-- InstanceBeginEditable name="trail" -->
	<li><bean:message key="accounts.text" />&nbsp;&gt;</li>
	<li><a href="#" onClick="secondBarNavigation('goToActionDisplay');return false;"><bean:message key="actionDisplay.text" /></a>&nbsp;&gt;</li>
	<li class="sectionSelected"><bean:message key="actionEdit.text" /></li>
	<!-- InstanceEndEditable -->
</ul>
</div>

<div id="content"><html:form action="/actionEdit.do" >

	<html:hidden property="actionChosen" value=""></html:hidden>
	<html:hidden property="actionChosenType" value=""></html:hidden>
		
  <div id="mainContent"><!-- InstanceBeginEditable name="Page content" --> 

   
	<div class="box"> 
 	<h3 class="headingB"><bean:message key="actionEdit.Edit.text" /></h3>
  		<p><bean:message key="actionEdit.Edit.prompt.text" /><br><br></p>
      <p>
     
    <table width="90%" border="0" cellpadding="2" cellspacing="0">
      <logic:iterate name="actionEditResults" property="actions" id="actionsID" indexId="i" length="1">
	<tr>
          	<th width="40%" valign="top"><bean:message key="accountName.text" /></th>
          	<td width="55%" valign="top"><bean:write name="actionsID" property="accountName" /></td>
    </tr>
	<tr>
        	<th width="40%" valign="top"><bean:message key="actionText.text" /></th>
        	<td width="55%" valign="top"><bean:write name="actionsID" property="actionText" /></td>
    </tr>
	<tr>
          	<th width="40%" valign="top"><bean:message key="actionOwner.text" /></th>
          	<td width="55%" valign="top"><bean:write name="actionsID" property="actionOwner" /></td>
    </tr>
	<tr>
          	<th width="40%" valign="top"><bean:message key="currentStatus.text" /></th>
          	<td width="55%" valign="top"><bean:write name="actionsID" property="statusText" /></td>
    </tr>

    <tr>
          	<th width="40%" valign="top"><bean:message key="newStatus.text" /> *</th>
          	<td width="55%" valign="top"><html:select property="status" >
			<html:option value="">Please Select...</html:option>
				<html:option value="30">WIP</html:option>
				<html:option value="40">Completed</html:option>
			</html:select>&nbsp;<font color="red"><html:errors property="statusError" /></font></td>
	</tr>
    <tr>	
    		<th width="40%" valign="top"><bean:message key="comments.text" /> *</th>
			<td width="55%" valign="top"><html:textarea property="comments" rows="5" cols="50"></html:textarea>&nbsp;<font color="red"><html:errors property="commentsError" /></font></td>
	</tr>	
	
 	</logic:iterate>
    </table>
    
     <p><html:submit styleClass="formButton" value="Confirm" onclick="javascript:setAction('confirm');" />&nbsp;
      	<html:submit styleClass="formButton" value="Back" onclick="javascript:setAction('back');" /></p>
   
	<p>
    </div> 
    
    <div class="box"> 
    	<h3 class="headingB"><bean:message key="actionEdit.EditHistory.text" /></h3>
 
	<p>
		<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>
		    	<th width="60%" valign="top"><bean:message key="comments.text" /></th>
    	    	<th width="13%" valign="top"><bean:message key="status.text" /></th>
 	        	<th width="13%" valign="top"><bean:message key="enteredBy.text" /></th>
 	        	<th width="13%" valign="top"><bean:message key="date.text" /></th>
 	        </tr>
<logic:iterate name="actionEditResults" property="actionAudits" id="actionAuditsID" indexId="i">

<tr>
		<td width="60%" valign="top"><bean:write name="actionAuditsID" property="comments"/></td>
		<td width="13%" valign="top"><bean:write name="actionAuditsID" property="statusUpdateText"/></td>	
		<td width="13%" valign="top"><bean:write name="actionAuditsID" property="author"/></td>
 		<td width="13%" valign="top"><bean:write name="actionAuditsID" property="dateFormatted"/></td>
</tr>
</logic:iterate>
			
      </table>
      
 
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




