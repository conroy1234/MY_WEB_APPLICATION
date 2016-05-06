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
	height: 500px; /* must be greater than tbody*/
	/*width: 500px; /* must be greater than tbody*/
	overflow: auto;
}

table > tbody {
	overflow: auto;
	height: 480px;
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
	invoiceAuthoriseForm.actionChosen.value= goTo;
	invoiceAuthoriseForm.actionChosenType.value= "nav";
	invoiceAuthoriseForm.submit();
}
function secondBarNavigation(goTo)
{
	invoiceAuthoriseForm.actionChosen.value= goTo;
	invoiceAuthoriseForm.actionChosenType.value= "func";
	invoiceAuthoriseForm.submit();
}
function setActionConfirm(invoiceIdLineNo)
{
	invoiceAuthoriseForm.actionChosen.value= "confirm";
	invoiceAuthoriseForm.actionChosenType.value= "func";
	invoiceAuthoriseForm.invoiceIdLineNo.value = invoiceIdLineNo
	invoiceAuthoriseForm.submit();
}
function setAction(action)
{
	invoiceAuthoriseForm.actionChosen.value= action;
	invoiceAuthoriseForm.actionChosenType.value= "func";
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
	<li><a href="#" onClick="secondBarNavigation('goToInvoiceAuthoriseSelection');return false;"><bean:message key="invoiceAuthoriseSelection.text" /></a>&nbsp;&gt;</li>	
	<li class="sectionSelected"><bean:message key="invoiceAuthorise.navBar.text" /></li>
	<!-- InstanceEndEditable -->
</ul>
</div>

<div id="content"><html:form action="/invoiceAuthorise.do" >

	<html:hidden property="actionChosen" value=""></html:hidden>
	<html:hidden property="actionChosenType" value=""></html:hidden>
	<html:hidden property="invoiceIdLineNo" value=""></html:hidden>
	<bean:define id="invoiceAuthoriseStatusCol" name="invoiceAuthoriseResults" property="invoiceAuthoriseStatusCol" />

  <div id="mainContentFull"><!-- InstanceBeginEditable name="Page content" --> 
    <div class="quoteBox">
 
      <h3 class="headingB"><bean:message key="invoiceAuthorise.invoiceDetails.text" /></h3> 
      <table width="90%" height="140" border="0" cellpadding="2" cellspacing="0">
        <tr>
          <td width="40%"><bean:message key="invoiceId.text" /></td>
	  <td width="60%" valign="top"><bean:write name="invoiceAuthoriseResults" property="invoiceId"/></td>
        </tr>
        <tr>
          <td width="40%"><bean:message key="clientName.text" /></td>
	  <td width="60%" valign="top"><bean:write name="invoiceAuthoriseResults" property="accountName"/></td>
        </tr>
        <tr>
          <td width="40%"><bean:message key="invoiceEntryDate.text" /></td>
	  <td width="60%" valign="top"><bean:write name="invoiceAuthoriseResults" property="entryDate"/></td>
        </tr>
        <tr>
          <td width="40%"><bean:message key="invoiceNumber.text" /></td>
	  <td width="60%" valign="top"><bean:write name="invoiceAuthoriseResults" property="invoiceNo"/></td>
        </tr>
        <tr>
          <td width="40%"><bean:message key="paymentType.text" /></td>
	  <td width="60%" valign="top"><bean:write name="invoiceAuthoriseResults" property="paymentType"/></td>
        </tr>
        <tr>
          <td width="40%"><bean:message key="status.text" /></td>
	  <td width="60%" valign="top"><bean:write name="invoiceAuthoriseResults" property="statusText"/></td>
        </tr>
	</table>
</div>


   <div class="quoteBox">
      <h3 class="headingB"><bean:message key="invoiceAmounts.text" /></h3> 
      <table width="99%" height="140" border="0" cellpadding="2" cellspacing="0">
        <tr>
          <td width="16%">&nbsp;</td>
          <td width="16%"><bean:message key="grossAmount.col.text" /></td>
          <td width="16%"><bean:message key="netAmount.col.text" /></td>
          <td width="16%"><bean:message key="vatAmount.col.text" /></td>
          <td width="16%"><bean:message key="month.text" /></td>
          <td width="16%"><bean:message key="year.text" /></td>
        </tr>
        <tr>
          <td width="16%"><bean:message key="invoice.text" /></td>
          <td width="16%"><bean:write name="invoiceAuthoriseResults" property="invoiceAmountGross"/></td>
          <td width="16%"><bean:write name="invoiceAuthoriseResults" property="invoiceAmountNet"/></td>
          <td width="16%"><bean:write name="invoiceAuthoriseResults" property="invoiceAmountVat"/></td>
          <td width="16%"><bean:write name="invoiceAuthoriseResults" property="invoiceMonth"/></td>
          <td width="16%"><bean:write name="invoiceAuthoriseResults" property="invoiceYear"/></td>
        </tr>
        <tr>
          <td width="16%"><bean:message key="agreed.text" /></td>
          <td width="16%">
   			<logic:equal name="invoiceAuthoriseResults" property="financeDivision" value="DOM">
   		   	    <bean:write name="invoiceAuthoriseResults" property="agreedAmountGross"/>
   		    </logic:equal>
   		    <logic:notEqual name="invoiceAuthoriseResults" property="financeDivision" value="DOM">&nbsp;</logic:notEqual>
          </td>
          <td width="16%">
   			<logic:notEqual name="invoiceAuthoriseResults" property="financeDivision" value="DOM">
	        	<bean:write name="invoiceAuthoriseResults" property="agreedAmountNet"/>
        	</logic:notEqual>
        	<logic:equal name="invoiceAuthoriseResults" property="financeDivision" value="DOM">&nbsp;</logic:equal>          
          </td>
          <td width="16%">&nbsp;</td>
          <td width="16%"><bean:write name="invoiceAuthoriseResults" property="agreedMonth"/></td>
          <td width="16%"><bean:write name="invoiceAuthoriseResults" property="agreedYear"/></td>
        </tr>
        <tr>
          <td width="16%"><bean:message key="difference.text" /></td>
          <td width="16%">
   			<logic:equal name="invoiceAuthoriseResults" property="financeDivision" value="DOM">
				<logic:equal name="invoiceAuthoriseResults" property="differenceAmountGross" value="0.00">
    		      <bean:write name="invoiceAuthoriseResults" property="differenceAmountGross"/>
    		    </logic:equal>
				<logic:notEqual name="invoiceAuthoriseResults" property="differenceAmountGross" value="0.00">
      	 	      <font color="red"><bean:write name="invoiceAuthoriseResults" property="differenceAmountGross"/></font>
      	      	</logic:notEqual>
   			</logic:equal>
      	  	<logic:notEqual name="invoiceAuthoriseResults" property="financeDivision" value="DOM">&nbsp;</logic:notEqual>
          </td>
          <td width="16%">
          	<logic:notEqual name="invoiceAuthoriseResults" property="financeDivision" value="DOM">
				<logic:equal name="invoiceAuthoriseResults" property="differenceAmountNet" value="0.00">
    		      <bean:write name="invoiceAuthoriseResults" property="differenceAmountNet"/>
    		    </logic:equal>
				<logic:notEqual name="invoiceAuthoriseResults" property="differenceAmountNet" value="0.00">
      	 	      <font color="red"><bean:write name="invoiceAuthoriseResults" property="differenceAmountNet"/></font>
      	      	</logic:notEqual>
          	</logic:notEqual>
          	<logic:equal name="invoiceAuthoriseResults" property="financeDivision" value="DOM">&nbsp;</logic:equal>
          </td>
          <td width="16%">&nbsp;</td>
          <td width="16%">&nbsp;</td>
          <td width="16%">&nbsp; </td>
        </tr>
        <tr><td colspan="6" />&nbsp;</tr>
		<logic:equal name="invoiceAuthoriseResults" property="displayReg" value="Y">
        <tr>
          <td width="16%"><bean:message key="regular.text" /></td>
          <td width="16%"><bean:write name="invoiceAuthoriseResults" property="regAmountGross"/></td>
          <td width="16%"><bean:write name="invoiceAuthoriseResults" property="regAmountNet"/></td>
          <td width="16%"><bean:write name="invoiceAuthoriseResults" property="regAmountVat"/></td>
          <td width="16%">&nbsp;</td>
          <td width="16%">&nbsp; </td>
        </tr>
        </logic:equal>
   		<logic:equal name="invoiceAuthoriseResults" property="displayOtherAdj" value="Y">
        <tr>
          <td width="16%"><bean:message key="otherAdjustments.text" />(<bean:write name="invoiceAuthoriseResults" property="adjCount"/>)</td>
          <td width="16%"><bean:write name="invoiceAuthoriseResults" property="adjAmountGross"/></td>
          <td width="16%"><bean:write name="invoiceAuthoriseResults" property="adjAmountNet"/></td>
          <td width="16%"><bean:write name="invoiceAuthoriseResults" property="adjAmountVat"/></td>
          <td width="16%">&nbsp;</td>
          <td width="16%">&nbsp; </td>
        </tr>
		</logic:equal>
        <logic:equal name="invoiceAuthoriseResults" property="displayDiff2" value="Y">
    	<tr>
          <td width="16%"><bean:message key="difference.text" /></td>
          <td width="16%">
          	<logic:equal name="invoiceAuthoriseResults" property="differenceAmountGross2" value="0.00">
    	      <bean:write name="invoiceAuthoriseResults" property="differenceAmountGross2"/>
    	    </logic:equal>
			<logic:notEqual name="invoiceAuthoriseResults" property="differenceAmountGross2" value="0.00">
       	      <font color="red"><bean:write name="invoiceAuthoriseResults" property="differenceAmountGross2"/></font>
            </logic:notEqual>
          </td>
          <td width="16%">&nbsp;</td>
          <td width="16%">&nbsp;</td>
          <td width="16%">&nbsp;</td>
          <td width="16%">&nbsp; </td>
        </tr>
        </logic:equal>        
</table>
</div>

<div class="quoteBox">
      	<h3 class="headingB"><bean:message key="authoriseInvoice.text" /></h3> 
	<table width="90%" border="0" cellpadding="2" cellspacing="0">
        <tr>
          <td width="40%" valign="top"><bean:message key="status.text" /></td>
          <td width="60%" valign="top">
          	<html:select name="invoiceAuthoriseResults" property="statusUpdate">
          	<html:option value="select">Please select...</html:option>
				<html:options collection="invoiceAuthoriseStatusCol" property="selectValue" labelProperty="selectLabel"/>
			</html:select>&nbsp;<font color="red"><html:errors property="statusUpdateError" /></font>
         </td>
        </tr>
        <tr>
          <td width="40%" valign="top"><bean:message key="comments.text" /></td>
          <td width="60%" valign="top"><html:textarea property="statusComments" rows="5" cols="30"></html:textarea>&nbsp;<font color="red"><html:errors property="statusCommentsError" /></font></td>
        </tr>
      </table>
<p>
<input type="submit" class="formButton" value="Confirm" onClick="javascript:setActionConfirm('<bean:write name="invoiceAuthoriseResults" property="invoiceId"/>');">&nbsp;<input type="submit" class="formButton" value="Back" onclick="javascript:setAction('back')">
</p>
<br>
</div>    
   
    <div class="quoteBox">
      	<h3 class="headingB"><bean:message key="comments.text" /></h3> 
	<table width="99%" border="0" cellpadding="2" cellspacing="0">
	  	<logic:iterate name="invoiceAuthoriseResults" property="invoiceAudits" id="invoiceAuditsID">
     		<tr>
 	        	<td width="50%" valign="top"><b><bean:write name="invoiceAuditsID" property="statusUpdateFormatted"/></b></td>
 	        	<td width="20%" valign="top"><bean:write name="invoiceAuditsID" property="author"/></td>
  	        	<td width="29%" valign="top"><bean:write name="invoiceAuditsID" property="dateFormatted"/></td>
        	</tr>
        	<logic:notEqual name="invoiceAuditsID" property="comments" value="">
          		<tr>
    	    		<td colspan="3"><bean:write name="invoiceAuditsID" property="comments"/></td>
        		</tr>
        	</logic:notEqual>
		</logic:iterate>
	</table>
<br>
</div> 

<div class="clearBoth">&nbsp;</div> 
</div>
</div>
</html:form>
<div class="clearBoth">&nbsp;</div>

<div id="footer">
<p>&copy; <bean:message key="domesticAndGeneral.text" /></p>
</div>

</BODY>
</html:html>





