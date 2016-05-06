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
	<li><a href="#" onClick="topBarNavigation('goToInvoiceEntry');return false;">Application Configuration</a></li>
	<li><a href="#" onClick="topBarNavigation('goToInvoiceEditSelection');return false;">Screen Content</a></li>
	<li><a href="#" onClick="topBarNavigation('goToLogOut');return false;"><bean:message key="logOut.text" /></a></li>
</div>
<div id="navTrail">
<ul>
	<!-- InstanceBeginEditable name="trail" -->
	<li>Screen Content Edit Selection&nbsp;&gt;</li>
	<li class="sectionSelected">Screen Content Edit</li>
	<!-- InstanceEndEditable -->
</ul>
</div>

<div id="content"><html:form action="/invoiceAuthoriseSelection.do" >


<div id="content">
	<div id="mainContent">
	<div class="box">
	<h3 class="listHeadingA"><a href="javascript:void(0)" class="dsphead"
		onclick="dsp(this)"><span class="dspchar">+</span></a>Maker</h3>
		<div class="dspcont">
		</div>
		<h3 class="listHeadingA"><a href="javascript:void(0)" class="dsphead"
		onclick="dsp(this)"><span class="dspchar">+</span></a>Appliance</h3>
		<div class="dspcont">
		</div>
		<h3 class="listHeadingA"><a href="javascript:void(0)" class="dsphead"
		onclick="dsp(this)"><span class="dspchar">+</span></a>Model</h3>
		<div class="dspcont">
		</div>
		<h3 class="listHeadingA"><a href="javascript:void(0)" class="dsphead"
		onclick="dsp(this)"><span class="dspchar">+</span></a>Other Model</h3>
		<div class="dspcont">
		</div>
		<h3 class="listHeadingA"><a href="javascript:void(0)" class="dsphead"
		onclick="dsp(this)"><span class="dspchar">+</span></a>Serial Number</h3>
		<div class="dspcont">
		</div>
		<h3 class="listHeadingA"><a href="javascript:void(0)" class="dsphead"
		onclick="dsp(this)"><span class="dspchar">+</span></a>Purchase Date</h3>
		<div class="dspcont">
		</div>
		
	<h3 class="listHeadingA"><a href="javascript:void(0)" class="dsphead"
		onclick="dsp(this)"><span class="dspchar">+</span></a>Purchase Price</h3>
	<div class="dspcont">
	<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr>
			<th>Field:</th>
			<td>Purchase Price</td>	
			<th>Required:</th>
			<td>Yes</td>
		</tr>
		<tr>	
			<th>Mandatory:</th>
			<td><input type="radio" name="control" value="001" checked="checked">Yes
			<input type="radio" name="control" value="002">No</td>	
			<th>Hidden:</th>
			<td><input type="radio" name="control" value="001" checked="checked">Yes
			<input type="radio" name="control" value="002">No</td>	
		</tr>	
		<tr>						
			<th>Value:</th>
			<td colspan="3"><input type="text" name="control"></td>
		</tr>
		<tr>						
			<th>Help Text</th>
			<td colspan="3"><textarea rows="2" cols="70" name="control" /></td>
		</tr>
		<tr>	
			<th>Help Graphic:</th>
			<td colspan="3"><input type="radio" name="control" value="001" checked="checked">Yes
			<input type="radio" name="control" value="002">No</td>	
		</tr>
		<tr>						
			<th>Alt Text</th>
			<td colspan="3"><textarea rows="2" cols="70" name="control" /></td>
		</tr>
		<tr>						
			<th>Graphic Help Text</th>
			<td colspan="3"><textarea rows="2" cols="70" name="control" /></td>
		</tr>				
	</table>
	<h3 class="listHeadingA">Multiple Values</h3>
	<table width="95%" border="0" cellpadding="2" cellspacing="0">
		<tr><th colspan="2">Display Type:</th>
			<td colspan="3">
			<input type="radio" name="control" value="001" checked="checked">Radio
			<input type="radio" name="control" value="002">Drop Down List</td>
		</tr>
		<tr>
			<th>Sequence</th>
			<th>Value</th>
			<th>Text</th>
			<th>HelpText</th>
			<th>Action</th>
		<tr>
			<td><html:select name="navResults" property="invoicePeriodMMSel" tabindex="9">
					<html:option value="01" selected="yes">1</html:option>
					<html:option value="02">2</html:option>
					<html:option value="03">3</html:option>
					<html:option value="04">4</html:option>
					<html:option value="05">5</html:option>
				</html:select></td>
			<td><input type="text" name="control" value="49"></td>
			<td><input type="text" name="control" value="£0 to £49"></td>
			<td><input type="text" name="control" value="(up to £49)"></td>
			<td><html:submit styleClass="formButton" value="Update" onclick="javascript:setAction('Update');"/>
			&nbsp;<html:submit styleClass="formButton" value="Delete" onclick="javascript:setAction('Delete');"/></td>
		</tr>
		<tr>
			<td><html:select name="navResults" property="invoicePeriodMMSel" tabindex="9">
					<html:option value="01">1</html:option>
					<html:option value="02" selected="yes">2</html:option>
					<html:option value="03">3</html:option>
					<html:option value="04">4</html:option>
					<html:option value="05">5</html:option>
				</html:select></td>
			<td><input type="text" name="control" value="99"></td>
			<td><input type="text" name="control" value="£49 to £99"></td>
			<td><input type="text" name="control" value="(up to £99)"></td>
			<td><html:submit styleClass="formButton" value="Update" onclick="javascript:setAction('Update');"/>
			&nbsp;<html:submit styleClass="formButton" value="Delete" onclick="javascript:setAction('Delete');"/></td>
		</tr>
		<tr>
			<td><html:select name="navResults" property="invoicePeriodMMSel" tabindex="9">
					<html:option value="01">1</html:option>
					<html:option value="02">2</html:option>
					<html:option value="03" selected="yes">3</html:option>
					<html:option value="04">4</html:option>
					<html:option value="05">5</html:option>
				</html:select></td>
			<td><input type="text" name="control" value="149"></td>
			<td><input type="text" name="control" value="£99 to £149"></td>
			<td><input type="text" name="control" value="(up to £149)"></td>
			<td><html:submit styleClass="formButton" value="Update" onclick="javascript:setAction('Update');"/>
			&nbsp;<html:submit styleClass="formButton" value="Delete" onclick="javascript:setAction('Delete');"/></td>
		</tr>		
		<tr>
			<td><html:select name="navResults" property="invoicePeriodMMSel" tabindex="9">
					<html:option value="01">1</html:option>
					<html:option value="02">2</html:option>
					<html:option value="03">3</html:option>
					<html:option value="04" selected="yes">4</html:option>
					<html:option value="05">5</html:option>
				</html:select></td>
			<td><input type="text" name="control" value="199"></td>
			<td><input type="text" name="control" value="£150 to £199"></td>
			<td><input type="text" name="control" value="(up to £199)"></td>
			<td><html:submit styleClass="formButton" value="Update" onclick="javascript:setAction('Update');"/>
			&nbsp;<html:submit styleClass="formButton" value="Delete" onclick="javascript:setAction('Delete');"/></td>
		</tr>
		<tr>
			<td><html:select name="navResults" property="invoicePeriodMMSel" tabindex="9">
					<html:option value="01">1</html:option>
					<html:option value="02">2</html:option>
					<html:option value="03">3</html:option>
					<html:option value="04">4</html:option>
					<html:option value="05" selected="yes">5</html:option>
				</html:select>
			</td>
			<td><input type="text" name="control"></td>
			<td><input type="text" name="control"></td>
			<td><input type="text" name="control"></td>
			<td><html:submit styleClass="formButton" value="Insert" onclick="javascript:setAction('Insert');"/>
			</td>
		</tr>
	</table>		
	</div>
	

		<h3 class="listHeadingA"><a href="javascript:void(0)" class="dsphead"
		onclick="dsp(this)"><span class="dspchar">+</span></a>Place of Purchase</h3>
		<div class="dspcont">
		</div>
		<h3 class="listHeadingA"><a href="javascript:void(0)" class="dsphead"
		onclick="dsp(this)"><span class="dspchar">+</span></a>Extended Gurantee already bought</h3>
		<div class="dspcont">
		</div>
	</div>
	</div>	
	<div id="mainContentFullWidth">
	<div class="box">
	</div>
	</div>

	</div>

</html:form>


<div class="clearBoth">&nbsp;</div>

<div id="footer">
<p>&copy; <bean:message key="domesticAndGeneral.text" /></p>
</div>

</BODY>
</html:html>




