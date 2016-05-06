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
	budgetsSelectionForm.actionChosen.value= goTo;
	budgetsSelectionForm.actionChosenType.value= "nav";
	budgetsSelectionForm.submit();
}
function setAction(action)
{
	budgetsSelectionForm.actionChosen.value= action;
	budgetsSelectionForm.actionChosenType.value= "func";
}
function setActionEdit(budgetSelected)
{
	budgetsSelectionForm.actionChosen.value= "edit";
	budgetsSelectionForm.actionChosenType.value= "func";
	budgetsSelectionForm.budgetSelected.value= budgetSelected;
	budgetsSelectionForm.submit();
}
function setActionAudit(budgetSelected)
{
	budgetsSelectionForm.actionChosen.value= "audit";
	budgetsSelectionForm.actionChosenType.value= "func";
	budgetsSelectionForm.budgetSelected.value= budgetSelected;
	budgetsSelectionForm.submit();
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
	<i class="topStrap" style="text-indent: 15px"><bean:message key="budgetsSelection.text" /></i>
</div>

<bean:define id="roleid" name="navScreenResults" property="role" />
<div id="navMain">	
	<logic:equal name="navScreenResults" property="role" value="UWMGR"><jsp:include page="navUWManager.jsp"/></logic:equal>
	<logic:equal name="navScreenResults" property="role" value="UWUSR"><jsp:include page="navUWUser.jsp"/></logic:equal>
</div>


<div id="navTrail">
<ul>
	<!-- InstanceBeginEditable name="trail" -->
	<li><bean:write name="navScreenResults" property="function"/>&nbsp;&gt;</li>
	<li class="sectionSelected"><bean:message key="budgetsSelection.text" /></li>
	<!-- InstanceEndEditable -->
</ul>
</div>

<div id="content"><html:form action="/budgetsSelection.do" >

	<html:hidden property="actionChosen" value=""></html:hidden>
	<html:hidden property="actionChosenType" value=""></html:hidden>
	<html:hidden property="budgetSelected" value=""></html:hidden>
	
  <div id="mainContent"><!-- InstanceBeginEditable name="Page content" --> 
    <div class="box"> 
    	<h3 class="headingB"><bean:message key="budgetsSelection.text" /></h3>
  		<p><bean:message key="budgetsSelection.prompt.text" /><br><br></p>
   
   <table width="50%" border="0" cellpadding="2" cellspacing="0">
	<logic:iterate name="navResults" property="budgetHeaders" id="budgetHeadersID" indexId="i">
        <tr>
        	<td width="20%" valign="top"><input type="submit" class="formButton" value="Edit" onClick="javascript:setActionEdit('<bean:write name="budgetHeadersID" property="accountName"/>');" /></td>	
           	<td width="55%" valign="top"><bean:write name="budgetHeadersID" property="accountName" /></td>
	       	<td width="20%" valign="top"><input type="submit" class="formButton" value="Audit" onClick="javascript:setActionAudit('<bean:write name="budgetHeadersID" property="accountName"/>');" /></td>	
	    </tr>
	</logic:iterate>
   </table>
   
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


