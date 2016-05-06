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
	invoiceEditSelectionForm.actionChosen.value= goTo;
	invoiceEditSelectionForm.actionChosenType.value= "nav";
	invoiceEditSelectionForm.submit();
}

function setActionNav(action)
{
	invoiceEditSelectionForm.actionChosen.value = action;
	invoiceEditSelectionForm.actionChosenType.value= "nav";
}

function setAction(action)
{
	invoiceEditSelectionForm.actionChosen.value= action;
	invoiceEditSelectionForm.actionChosenType.value= "func";
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
	<li><a href="index.jsp"><bean:message key="accounts.text" /></a>&nbsp;&gt;</li>
	<li class="sectionSelected"><bean:message key="invoiceEditSelection.text" /></li>
	<!-- InstanceEndEditable -->
</ul>
</div>

<div id="content"><html:form action="/invoiceEditSelection.do" >

	<html:hidden property="actionChosen" value=""></html:hidden>
	<html:hidden property="actionChosenType" value=""></html:hidden>
	
	<bean:define id="clients" name="navResults" property="clients" />
	<bean:define id="invoices" name="navResults" property="invoices" />

  <div id="mainContent"><!-- InstanceBeginEditable name="Page content" --> 
    <div class="box"> 
    	<h3 class="headingB"><bean:message key="editInvoice.text" /></h3>
  		<p><bean:message key="invoiceEdit.prompt.text" />&nbsp;<a href="#"	onclick="return showInfo('e1','Select an account<br>Click Get invoices for selected account (This will retrieve  a list of editable invoices for the selected account)<br>Select an invoice<br>Click Get invoice<br><br>Click ? to close help.')"><img
				src="images/questionmark.gif" width="18" height="18" border="0"	alt="Select an account, click Get invoices for selected account, select an invoice, click Get invoice." /></a><br><br></p>
    
    	<table width="90%" border="0" cellpadding="2" cellspacing="0">
    	<tr id="e1" class="extraInfo">
			<td colspan="2">&nbsp;</td>
		</tr>
        <tr>
          	<td width="40%"> <bean:message key="clientName.text" />&nbsp;<b>*</b>  </td>
           	<td width="55%" valign="top">
        	   	<html:select property="client" tabindex="1">
					<html:option value=""><bean:message key="pleaseSelect.text" /></html:option>
					<html:options collection="clients" property="accountName" labelProperty="smaReference" />
				</html:select>&nbsp;<font color="red"><html:errors property="client" /></font>&nbsp;<html:submit styleClass="formButton" value="Get invoices for selected account" onclick="javascript:setActionNav('getListOfInvoices');" />  			
			</td>
	    </tr>  
     	<tr>
        	<td width="40%"> <bean:message key="invoiceNumber.text" />&nbsp;<b>*</b> </td>
     		<td width="55%" valign="top">	
          		<html:select property="invoice" tabindex="2">
					<html:option value=""><bean:message key="pleaseSelect.text" /></html:option>
					<html:options collection="invoices" property="systemInvoiceId" labelProperty="invoiceNo" />
				</html:select>&nbsp;
				<font color="red"><html:errors property="invoices" /></font>
			</td>
     	</tr>
      </table>
      <p><font color="red"><html:errors property="getInvoiceError"/></font></p>
     <p><html:submit styleClass="formButton" value="Get Invoice" onclick="javascript:setAction('getInvoice');" />
   
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


