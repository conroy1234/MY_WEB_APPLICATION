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
	invoiceAuditForm.actionChosen.value= goTo;
	invoiceAuditForm.actionChosenType.value= "nav";
	invoiceAuditForm.submit();
}
function secondBarNavigation(goTo)
{
	invoiceAuditForm.actionChosen.value= goTo;
	invoiceAuditForm.actionChosenType.value= "func";
	invoiceAuditForm.submit();
}
function secondBarNavigation(goTo)
{
	invoiceAuditForm.actionChosen.value= goTo;
	invoiceAuditForm.actionChosenType.value= "func";
	invoiceAuditForm.submit();
}

function setAction(action)
{
	invoiceAuditForm.actionChosen.value= action;
	invoiceAuditForm.actionChosenType.value= "func";
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
<bean:define id="previousPageid" name="navScreenResults" property="previousPage" />
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
	    <logic:equal name="navScreenResults" property="previousPage" value="clientDetails">
			<li><a href="#" onClick="secondBarNavigation('goToInvoicesSearch');return false;"><bean:message key="invoicesSearch.text" /></a>&nbsp;&gt;</li>
			<li><a href="#" onClick="secondBarNavigation('goToClientDetails');return false;"><bean:message key="clientDetails.text" /></a>&nbsp;&gt;</li>
		</logic:equal>
     	<logic:equal name="navScreenResults" property="previousPage" value="invoiceAuthoriseSelection">
 			<li><a href="#" onClick="secondBarNavigation('goToInvoiceAuthoriseSelection');return false;"><bean:message key="invoiceAuthoriseSelection.text" /></a>&nbsp;&gt;</li>	
		</logic:equal>
     	<logic:equal name="navScreenResults" property="previousPage" value="invoicesSearch">
 			<li><a href="#" onClick="secondBarNavigation('goToInvoicesSearch');return false;"><bean:message key="invoicesSearch.text" /></a>&nbsp;&gt;</li>
  		</logic:equal>
	<li class="sectionSelected"><bean:message key="invoiceAudit.text" /></li>
	<!-- InstanceEndEditable -->
</ul>
</div>

<div id="content"><html:form action="/invoiceAudit.do" >

	<html:hidden property="actionChosen" value=""></html:hidden>
	<html:hidden property="actionChosenType" value=""></html:hidden>
		
  <div id="mainContent"><!-- InstanceBeginEditable name="Page content" --> 
    <div class="box"> 
    	<h3 class="headingB"><bean:message key="invoiceAuditTrail.text" />&nbsp;<bean:write name="invoiceAuditResults" property="accountName" />&nbsp;<bean:message key="invoiceId.text" />&nbsp; <bean:write name="invoiceAuditResults" property="invoiceId" /><bean:write name="invoiceAuditResults" property="invoiceLineNo" /></h3>
  		<p><br><br></p>
   
 <div class="tableContainer" id="data">
	<table border="0" cellpadding="2" cellspacing="0">
		<thead>
			<tr>
				<td colspan="9">Total:&nbsp;<bean:write name="invoiceAuditResults" property="totalInvoiceAudits" /></td>
			</tr>
			<TR>
				<TD width="39%"><bean:message key="status.text" /></TD>
				<TD width="10%"><bean:message key="date.text" /></TD>
				<TD width="10%"><bean:message key="userId.text" /></TD>
				<TD width="39%"><bean:message key="comments.text" /></TD>
			</TR>
		</thead>
		<TBODY>
		<logic:iterate name="invoiceAuditResults" property="invoiceAudits" id="invoiceAuditsID" indexId="i">
			<TR>
				<TD width="39%"><bean:write name="invoiceAuditsID" property="statusUpdateFormatted"/></TD>
				<TD width="10%"><bean:write name="invoiceAuditsID" property="dateFormatted"/></TD>
				<TD width="10%"><bean:write name="invoiceAuditsID" property="author"/></TD>
				<TD width="39%"><bean:write name="invoiceAuditsID" property="comments"/></TD>
			</TR>
		</logic:iterate>
			
	</tbody>
	</table>
 	</div>
  
   	 <p><html:submit styleClass="formButton" value="Original Invoice" onclick="javascript:setAction('originalInvoice');" /></p>
     <p>
     	<logic:equal name="navScreenResults" property="previousPage" value="clientDetails">
   			<html:submit styleClass="formButton" value="Back" onclick="javascript:setAction('backClientDetails');" />
		</logic:equal>
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



