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
	height: 350px; /* must be greater than tbody*/
	/*width: 740px; /* must be greater than tbody*/
	overflow: auto;
}

table > tbody {
	overflow: auto;
	height: 330px;
	/*width: 700px;*/
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
	invoiceAuthoriseSelectionForm.actionChosen.value= goTo;
	invoiceAuthoriseSelectionForm.actionChosenType.value= "nav";
	invoiceAuthoriseSelectionForm.submit();
}
function mainPageNavigationClientDetails(accountName)
{
	invoiceAuthoriseSelectionForm.actionChosen.value= "clientDetails";
	invoiceAuthoriseSelectionForm.actionChosenType.value= "func";
	invoiceAuthoriseSelectionForm.clientDetailsAccountName.value= accountName;
	invoiceAuthoriseSelectionForm.submit();
}
function mainPageNavigationInvoiceAudit(invoiceId)
{
	invoiceAuthoriseSelectionForm.actionChosen.value= "invoiceAudit";
	invoiceAuthoriseSelectionForm.actionChosenType.value= "func";
	invoiceAuthoriseSelectionForm.invoiceAuditInvoiceId.value= invoiceId;
	invoiceAuthoriseSelectionForm.submit();
}
function mainPageNavigationInvoiceAuditADJ(accountNameYrMthPaymentType)
{
	invoiceAuthoriseSelectionForm.actionChosen.value= "invoiceAuditADJ";
	invoiceAuthoriseSelectionForm.actionChosenType.value= "func";
	invoiceAuthoriseSelectionForm.invoiceAuditAccountNameYrMthPaymentType.value = accountNameYrMthPaymentType;
	invoiceAuthoriseSelectionForm.submit();
}
function mainPageNavigationBudgetsAudit(accountNameYrMth)
{
	invoiceAuthoriseSelectionForm.actionChosen.value= "budgetsAudit";
	invoiceAuthoriseSelectionForm.actionChosenType.value= "func";
	invoiceAuthoriseSelectionForm.budgetsAuditAccountNameYearMonth.value = accountNameYrMth;
	invoiceAuthoriseSelectionForm.submit();
}
function setAction(action)
{
	invoiceAuthoriseSelectionForm.actionChosen.value= action;
	invoiceAuthoriseSelectionForm.actionChosenType.value= "func";
}
function setActionSort(action)
{
	invoiceAuthoriseSelectionForm.sortButtonPressed.value= "Y";
	invoiceAuthoriseSelectionForm.actionChosen.value= action;
	invoiceAuthoriseSelectionForm.actionChosenType.value= "func";
}
function setActionUpdate(invoiceIdLineNo)
{
	invoiceAuthoriseSelectionForm.actionChosen.value= "update";
	invoiceAuthoriseSelectionForm.actionChosenType.value= "func";
	invoiceAuthoriseSelectionForm.invoiceIdLineNo.value = invoiceIdLineNo
	invoiceAuthoriseSelectionForm.submit();
}
function resetClientName()
{
	invoiceAuthoriseSelectionForm.clientNameSel.value= "reset"
}
function resetAccountName()
{
	invoiceAuthoriseSelectionForm.accountNameSel.value= "reset"
}
function resetAccountHandler()
{
	invoiceAuthoriseSelectionForm.accountHandlerSel.value= "reset"
}
function resetAccountManager()
{
	invoiceAuthoriseSelectionForm.accountManagerSel.value= "reset"
}
function resetInvoicePeriodMMandYY()
{
	invoiceAuthoriseSelectionForm.invoicePeriodMMSel.value= "reset"
	invoiceAuthoriseSelectionForm.invoicePeriodYYSel.value= "reset"
}
function resetInvoicePeriodByOption()
{
	invoiceAuthoriseSelectionForm.invoicePeriodByOptionSel.value= "reset"
}
function resetInvoicePeriodByFromTo()
{
	invoiceAuthoriseSelectionForm.invoicePeriodByMMFromSel.value= "reset"
	invoiceAuthoriseSelectionForm.invoicePeriodByYYFromSel.value= "reset"
	invoiceAuthoriseSelectionForm.invoicePeriodByMMToSel.value= "reset"
	invoiceAuthoriseSelectionForm.invoicePeriodByYYToSel.value= "reset"
}
function resetStatus()
{
	invoiceAuthoriseSelectionForm.statusSel.value= "reset"
}
function resetInvoiceId()
{
	invoiceAuthoriseSelectionForm.invoiceIdSel.value= "reset"
}
function resetInvoiceNo()
{
	invoiceAuthoriseSelectionForm.invoiceNoSel.value= "reset"
}
function resetSortBy()
{
	invoiceAuthoriseSelectionForm.sortBy.value= "reset"
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
	<i class="topStrap" style="text-indent: 15px">OLR - Content Management</i>
</div>

<div id="navMain">	
	<li><a href="#" onClick="topBarNavigation('goToInvoiceEntry');return false;">Content Management</a></li>
	<li><a href="#" onClick="topBarNavigation('goToLogOut');return false;">Logout</a></li>
</div>
<div id="navTrail">
<ul>
	<!-- InstanceBeginEditable name="trail" -->
	<li>Application Selection&nbsp;&gt;</li>
	<li>Content Selection&nbsp;&gt;</li>
	<li>Complete Registration: ALL Options</li>
		<!-- <li>Complete Registration: Soft Sell</li> -->
		<!-- <li>Complete Registration: No Extennded Warranty/Got Extended Warranty Edit</li> -->
		<!-- <li>Complete Registration: Default Extended warranties</li> -->
	<!-- InstanceEndEditable -->

</ul>
</div>
<div id="content"><html:form action="/invoiceAuthoriseSelection.do" >
	<div id="subSections200">
	<div class="box">
		<h3 class="headingA">Fields</h3>
		<p>Please select the text you wish to edit<br><br></p>
	  	<table width="99%" border="0" cellpadding="2" cellspacing="0">	
 	    	<tr>
	          	<td width="30"><html:submit styleClass="formButton" value="Select" onclick="javascript:setAction('purchaseLedger');" /></td>
		   		<td><b>Screen Text</b></td>
		    </tr>   	 
 		</table>
	  	<table width="99%" border="0" cellpadding="2" cellspacing="0">	
 	 	   	<tr>
 	         	<td width="30"><html:submit styleClass="formButton" value="Select" onclick="javascript:setAction('purchaseLedger');" /></td>
		   		<td>Adhoc Text</td>
		    </tr>   	 
 		</table>
 		
		<p>Update content in Live<br></p>
     	<p><html:submit styleClass="formButton" value="Update Live" onclick="javascript:setAction('purchaseLedger');" /></p>
	    <br>
	</div>
	</div>
	
	<div id="mainContent">
	
					<div class="box">
	<!   Complete Registration: ALL options>
		
	<h3 class="headingA">Screen Text</h3>
	<p>Window</p>
	<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>						
			<th width="180">Title:</th>
			<td colspan="3"><input type="text" name="control" size="50"></td>
		</tr>
	</table>
		<p>Heading</p>
		<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>						
			<th width="150">Header:</th>
			<td colspan="3"><input type="text" name="control" size="70"></td>
		</tr>
		<tr>						
			<th width="180">Body:</th>
			<td colspan="3"><textarea rows="2" cols="60" name="control" /></td>
		</tr>
		</table>
		<p>Sub Heading 1</p>
		<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>						
			<th width="150">Header:</th>
			<td colspan="3"><input type="text" name="control" size="70"></td>
		</tr>
		<tr>						
			<th width="180">Body:</th>
			<td colspan="3"><textarea rows="2" cols="60" name="control" /></td>
		</tr>
		</table>
	<p>Kitchen Plan</p>	
	<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>						
			<th width="180">Text:<br>(before list of appliances)</th>
			<td colspan="3"><textarea rows="2" cols="60" name="control" /></td>
		</tr>	
		<tr>						
			<th width="180">Text:<br>(after list of appliances)</th>
			<td colspan="3"><textarea rows="2" cols="60" name="control" /></td>
		</tr>	
		<tr>						
			<th width="180">Don't Group Link Text:</th>
			<td colspan="3"><textarea rows="2" cols="60" name="control" /></td>
		</tr>	

		<tr>						
			<th width="180">Group Together Link Text:<br>(before list of appliances)</th>
			<td colspan="3"><textarea rows="2" cols="60" name="control" /></td>
		</tr>	
		<tr>						
			<th width="180">Group Together Link Text:<br>(after list of appliances)</th>
			<td colspan="3"><textarea rows="2" cols="60" name="control" /></td>
		</tr>				
	</table>
	<p>Home Entertainment Plan</p>	
	<table width="95%" border="0" cellpadding="2" cellspacing="0">	
		<tr>						
			<th width="180">Text:<br>(before list of appliances)</th>
			<td colspan="3"><textarea rows="2" cols="60" name="control" /></td>
		</tr>	
		<tr>						
			<th width="180">Text:<br>(after list of appliances)</th>
			<td colspan="3"><textarea rows="2" cols="60" name="control" /></td>
		</tr>
		<tr>						
			<th width="180">Don't Group Link Text:</th>
			<td colspan="3"><textarea rows="2" cols="60" name="control" /></td>
		</tr>	

		<tr>						
			<th width="180">Group Together Link Text:<br>(before list of appliances)</th>
			<td colspan="3"><textarea rows="2" cols="60" name="control" /></td>
		</tr>	
		<tr>						
			<th width="180">Group Together Link Text:<br>(after list of appliances)</th>
			<td colspan="3"><textarea rows="2" cols="60" name="control" /></td>
		</tr>						
	</table>

	
	<p><html:submit styleClass="formButton" value="Back" onclick="javascript:setAction('Back');"/>&nbsp;<html:submit styleClass="formButton" value="Cancel" onclick="javascript:setAction('Cancel');"/>&nbsp;
	<html:submit styleClass="formButton" value="Save" onclick="javascript:setAction('Update');"/></p>

	</div>
	<br>
			
				<br><br><br><br><br><br><br><br><br><br><br><br>	
	
	<div class="box">
	<!Complete Registration: No extended warranties avaiable OR already taken up>

		<h3 class="headingA">Screen Text</h3>
		<p>Window</p>
		<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>						
			<th width="150">Title:</th>
			<td colspan="3"><input type="text" name="control" size="70"></td>
		</tr>
		</table>
		<p>Heading</p>
		<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>						
			<th width="150">Header:</th>
			<td colspan="3"><input type="text" name="control" size="70"></td>
		</tr>
		<tr>						
			<th width="180">Body:</th>
			<td colspan="3"><textarea rows="2" cols="60" name="control" /></td>
		</tr>
		</table>
		<p>Sub Heading 1</p>
		<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>						
			<th width="150">Header:</th>
			<td colspan="3"><input type="text" name="control" size="70"></td>
		</tr>
		<tr>						
			<th width="180">Body:</th>
			<td colspan="3"><textarea rows="2" cols="60" name="control" /></td>
		</tr>
		</table>
			<p>Register another appliance</p>
			<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>						
			<th width="150">Non-link Text:</th>
			<td colspan="3"><input type="text" name="control" size="70"></td>
		</tr>		
		<tr>						
			<th width="150">Link Text:</th>
			<td colspan="3"><input type="text" name="control" size="70"></td>
		</tr>		
		<tr>						
			<th width="150">Non-link Text:</th>
			<td colspan="3"><input type="text" name="control" size="70"></td>
		</tr>		

				
	</table>
		<p><html:submit styleClass="formButton" value="Back" onclick="javascript:setAction('Back');"/>&nbsp;<html:submit styleClass="formButton" value="Cancel" onclick="javascript:setAction('Cancel');"/>&nbsp;
		<html:submit styleClass="formButton" value="Save" onclick="javascript:setAction('Update');"/></p>

	</div>
	<br>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	
	
			<div class="box">
	<!  Complete Registration: extended warranties available (hard sell)>
		
	<h3 class="headingA">Screen Text</h3>
	<p>Window</p>
	<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>						
			<th width="150">Title:</th>
			<td colspan="3"><input type="text" name="control" size="50"></td>
		</tr>
	</table>
		<p>Heading</p>
		<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>						
			<th width="150">Header:</th>
			<td colspan="3"><input type="text" name="control" size="70"></td>
		</tr>
		<tr>						
			<th width="180">Body:</th>
			<td colspan="3"><textarea rows="2" cols="60" name="control" /></td>
		</tr>
		</table>
		<p>Sub Heading 1</p>
		<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>						
			<th width="150">Header:</th>
			<td colspan="3"><input type="text" name="control" size="70"></td>
		</tr>
		<tr>						
			<th width="180">Body:</th>
			<td colspan="3"><textarea rows="2" cols="60" name="control" /></td>
		</tr>
		</table>
	<p>Recommendation</p>
	<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>						
			<th width="150">Text:</th>
			<td colspan="3"><input type="text" name="control" size="50"></td>
		</tr>		
	</table>
	<p>Other options link</p>	
	<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>						
			<th width="150">Link Text:</th>
			<td colspan="3"><input type="text" name="control" size="50"></td>
		</tr>		
	</table>

	<p>Summary of protection</p>	
	<table width="95%" border="0" cellpadding="2" cellspacing="0">

		<tr>						
			<th width="150">Non-link Text:</th>
			<td colspan="3"><input type="text" name="control" size="70"></td>
		</tr>		
		<tr>						
			<th width="150">Link Text:</th>
			<td colspan="3"><input type="text" name="control" size="70"></td>
		</tr>		
		<tr>						
			<th width="150">Non-link Text:</th>
			<td colspan="3"><input type="text" name="control" size="70"></td>
		</tr>		
	</table>
		<p>Sub Heading 2: Payment</p>
		<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>						
			<th width="150">Header:</th>
			<td colspan="3"><input type="text" name="control" size="50"></td>
		</tr>		
		<tr>						
			<th width="150">Body:</th>
			<td colspan="3"><textarea rows="2" cols="60" name="control" /></td>
		</tr>	
		<tr>						
			<th width="150">Option Text:</th>
			<td colspan="3"><textarea rows="2" cols="60" name="control" /></td>
		</tr>						
	</table>
	<p>D&G insurance provider</p>
	<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>						
			<th width="150">Text:</th>
			<td colspan="3"><textarea rows="2" cols="60" name="control" /></td>
		</tr>		
	</table>
	<p>Finish Registration</p>
	<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>						
			<th width="150">Text:</th>
			<td colspan="3"><textarea rows="2" cols="60" name="control" /></td>
		</tr>		
	</table>	
	
	<p><html:submit styleClass="formButton" value="Back" onclick="javascript:setAction('Back');"/>&nbsp;<html:submit styleClass="formButton" value="Cancel" onclick="javascript:setAction('Cancel');"/>&nbsp;
	<html:submit styleClass="formButton" value="Save" onclick="javascript:setAction('Update');"/></p>

	</div>
	<br>
	
			<br><br><br><br><br><br><br><br><br><br><br><br>
			
		<!-- Complete Registration: Soft Sell -->
	<div class="box">	
	
		<h3 class="headingA">Screen Text</h3>
		<p>Window</p>
		<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>						
			<th width="150">Title:</th>
			<td colspan="3"><input type="text" name="control" size="70"></td>
		</tr>
		</table>
		<p>Heading</p>
		<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>						
			<th width="150">Header:</th>
			<td colspan="3"><input type="text" name="control" size="70"></td>
		</tr>
		<tr>						
			<th width="180">Body:</th>
			<td colspan="3"><textarea rows="2" cols="60" name="control" /></td>
		</tr>
		</table>
		<p>Sub Heading 1</p>
		<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>						
			<th width="150">Header:</th>
			<td colspan="3"><input type="text" name="control" size="70"></td>
		</tr>
		<tr>						
			<th width="180">Body:</th>
			<td colspan="3"><textarea rows="2" cols="60" name="control" /></td>
		</tr>
		</table>
	<p>Soft sell</p>
	<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>						
			<th width="150">Text</th>
			<td colspan="3"><textarea rows="3" cols="60" name="control" /></td>
		</tr>				
	</table>
	<p>Register another appliance</p>
	<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>						
			<th width="150">Non-link Text:</th>
			<td colspan="3"><input type="text" name="control" size="70"></td>
		</tr>		
		<tr>						
			<th width="150">Link Text:</th>
			<td colspan="3"><input type="text" name="control" size="70"></td>
		</tr>		
		<tr>						
			<th width="150">Non-link Text:</th>
			<td colspan="3"><input type="text" name="control" size="70"></td>
		</tr>						
	</table>

		<p><html:submit styleClass="formButton" value="Back" onclick="javascript:setAction('Back');"/>&nbsp;<html:submit styleClass="formButton" value="Cancel" onclick="javascript:setAction('Cancel');"/>&nbsp;
		<html:submit styleClass="formButton" value="Save" onclick="javascript:setAction('Update');"/></p>

	</div>
	<br>
			<br><br><br><br><br><br><br><br><br><br><br><br>
			
			


	
<! Complete Registration: All Options>



	



	
	
	
	
	


	

	
<br><br><br><br><br><br><br><br><br><br><br><br>	

	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	</div>
</div>

</html:form>


<div class="clearBoth">&nbsp;</div>

<div id="footer">
<p>&copy; Domestic & General Group PLC</p>
</div>

</BODY>
</html:html>




