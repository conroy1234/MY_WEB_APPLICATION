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
	budgetsEditForm.actionChosen.value= goTo;
	budgetsEditForm.actionChosenType.value= "nav";
	budgetsEditForm.submit();
}
function secondBarNavigation(goTo)
{
	budgetsEditForm.actionChosen.value= goTo;
	budgetsEditForm.actionChosenType.value= "func";
	budgetsEditForm.submit();
}
function setAction(action)
{
	budgetsEditForm.actionChosen.value= action;
	budgetsEditForm.actionChosenType.value= "func";
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
	<li><a href="#" onClick="secondBarNavigation('goToBudgetsSelection');return false;"><bean:message key="budgetsSelection.text" /></a>&nbsp;&gt;</li>
	<li class="sectionSelected"><bean:message key="budgetsEdit.text" /></li>
	<!-- InstanceEndEditable -->
</ul>
</div>

<div id="content"><html:form action="/budgetsEdit.do" >

	<html:hidden property="actionChosen" value=""></html:hidden>
	<html:hidden property="actionChosenType" value=""></html:hidden>
	<bean:define id="accountNameid" name="budgetLinesResults" property="accountName" />
  <div id="mainContent"><!-- InstanceBeginEditable name="Page content" --> 
    <div class="box"> 
    	<h3 class="headingB"><bean:message key="budgetsEdit.text" /></h3>
  		<p><bean:message key="budgetsEdit.prompt.text" /><br><br>
		<bean:message key="required.text" /><br><font color="red"><html:errors property="editError" /></font></p>
		
   <div class="tableContainer" id="data">
   <table width="90%" border="0" cellpadding="2" cellspacing="0">
      <tr>
        	<th width="20%" ><bean:message key="accountName.text" /></th>	
           	<td colspan="2" ><bean:write name="budgetLinesResults" property="accountName" /></td>
	  </tr>
      <tr>
        	<th width="20%" ><bean:message key="invoicePeriod.text" /></th>	
           	<th width="35%" ><bean:message key="agreedAmountNet.text" /></th>
           	<th width="35%" ><bean:message key="agreedAmountNetNew.text" /></th>
	  </tr>

	<logic:iterate name="budgetLinesResults" property="budgetLines" id="budgetLinesID" indexId="i">
      <% String monthlyAgreedNewError = "monthlyAgreedNewError" + i; %>
        <tr>				
        	<td width="20%" valign="top"><bean:write name="budgetLinesID" property="invoiceMonth" />/20<bean:write name="budgetLinesID" property="invoiceYear" /></td>	
           	<td width="35%" valign="top"><bean:write name="budgetLinesID" property="monthlyAgreed" /></td>
           	<td width="35%" valign="top">           		
			<logic:equal name="budgetLinesID" property="budgetLineEditable" value="Y">		
				<html:text name="budgetLinesID" property="monthlyAgreedNew" indexed="true" size="9" />&nbsp;
					<font color="red"><html:errors property="<%= monthlyAgreedNewError %>" /><bean:write name="budgetLinesID" property="monthlyAgreedNew" /></font>
			</logic:equal>
			<logic:notEqual name="budgetLinesID" property="budgetLineEditable" value="Y"><bean:message key="budgetLineNotEditable.text" />&nbsp;<bean:write name="budgetLinesID" property="invoiceLineStatusText" />
			</logic:notEqual>		
			</td>           	

	    </tr>
	</logic:iterate>
    </table>
    </div>
   
	<table width="90%" border="0" cellpadding="2" cellspacing="0">
		<tr>
        	<td width="40%" valign="top"><bean:message key="comments.text" />* &nbsp;
					<font color="red"><html:errors property="commentsError" /></font>
          	<br>
          	<html:textarea property="comments" rows="5" cols="50"></html:textarea></td>
        </tr>
	</table>
   <p><input type="submit" class="formButton" value="Back" onClick="javascript:setAction('back');" />&nbsp;<input type="submit" class="formButton" value="Confirm" onClick="javascript:setAction('confirm');" /></p>
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


