<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<HTML>
<HEAD>
<%@ page 
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
%>
<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META name="GENERATOR" content="IBM WebSphere Studio">
<META http-equiv="Content-Style-Type" content="text/css">
<LINK href="theme/DomGen.css" rel="stylesheet"
	type="text/css">
<TITLE>Invoices.jsp</TITLE>
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
<div id="topLogo"><a href="http://"><img
	src="theme/images/domgen_logo.gif"
	alt="Domestic &amp; General Logo, links back to homepage" width="136"
	height="75" border="0" /></a><i class="topStrap">&nbsp;</i></div>
<div id="navMain">

	  <li><a href="about-us.html">Invoice Entry</a></li>
	        <li class="selected">Invoices</li>
            <li><a href="about-us.html">Authorised</a></li>
            <li><a href="about-us.html">Maintenance</a></li>
	<li><A style="border-right: none"></A></li>
	</ul>
</div>
<div id="navTrail">
<ul>
	<!-- InstanceBeginEditable name="trail" -->
			<li><a href="index.jsp">Accounts</a>&nbsp;&gt;</li>
   	 	<li class="sectionSelected">Invoices</li>
	<!-- InstanceEndEditable -->
</ul>
</div>


<div id="content"><form>

<div id="content">
	<div id="subSections">
	<div class="box">
	<h3 class="listHeadingA"><a href="javascript:void(0)" class="dsphead"
		onclick="dsp(this)"><span class="dspchar">+</span></a>Search</h3>
	<div class="dspcont">
	<table width="60%" border="0" cellpadding="2" cellspacing="0">
		<tr>
			<td>Client Name</td>
		</tr>
		<tr>
			<td><input type="text" name="invoiceId" size="10" maxlength="7" /><br>
			<input type="button" name="resetAgent" class="navButton" value="reset" onclick="clearAgent()" /></td>
		</tr>
		<tr>
			<td>Account Manager</td>
		</tr>
		<tr>
			<td><input type="text" name="clientName" size="15" maxlength="15" /><br>
			<input type="button" name="resetAgent" class="navButton" value="reset" onclick="clearAgent()" /></td>
		</tr>
		<tr>
			<td>Account Handler</td>
		</tr>
		<tr>
			<td><input type="text" name="clientName" size="15" maxlength="15" /><br>
			<input type="button" name="resetAgent" class="navButton" value="reset" onclick="clearAgent()" /></td>
		</tr>
			<tr>
			<td>Invoice Period</td>
		</tr>
		<tr>
			<td><select name="InvPeriod" class="formText">
				<option value="0"></option>
				<option value="1" >Current Month</option>
				<option value="1" >Last 12 Months</option>
				<option value="1" >Current Budget Year</option>
				<option value="1" >Previous Budget Year</option>
				<option value="2">01/2005</option>
				<option value="3" >02/2005</option>
				<option value="4">03/2005</option>
				<option value="2">04/2005</option>
				<option value="3" >05/2005</option>
				<option value="4">06/2005</option>
			</select>
			<input type="button" name="resetAgent" class="navButton" value="reset" onclick="clearAgent()" /></td>
		</tr>
		<tr>
			<td>Status</td>
		</tr>
		<tr>
			<td><select>
				<option>Please Select...</option>
				<option>Unsubmitted</option>
				<option>Early</option>
				<option>Awaiting Authorisation</option>
				<option>New Invoice Entry</option>
				<option>U/W Authorised</option>
				<option>U/W AUthorised, agreement o/s</option>
				<option>U/W Rejection</option>
				<option>Under Query</option>
				<option>S/S Authorisation</option>
				<option>S/S Rejection</option>
				<option>Transferred for Payment</option>
			    </select><br>
			<input type="button" name="resetAgent" class="navButton" value="reset" onclick="clearAgent()" /></td>
		</tr>
		<tr>
			<td>Invoice Id</td>
		</tr>
		<tr>
			<td><input type="text" name="clientName" size="15" maxlength="15" /><br>
			<input type="button" name="resetAgent" class="navButton" value="reset" onclick="clearAgent()" /></td>
		</tr>
		<tr>
			<td><input type="submit" class="formButton" value="search" onclick="setAction('search')"/></td>
		</tr>
	
		<tr>
			<td><input type="submit" class="formButton" value="display all" onclick="setAction('displayAll')" /></td>
		
	</table>
	</div>
	<h3 class="listHeadingA"><a href="javascript:void(0)" class="dsphead"
		onclick="dsp(this)"><span class="dspchar">+</span></a>Sort</h3>
	<div class="dspcont">
	<table width="60%" border="0" cellpadding="2" cellspacing="0">
		<tr>
			<td>Sort By</td>
		</tr>
		<tr>
			<td><select name="sortBy" class="formText">
				<option value="0">Please Select...</option>
				<option value="1" >Client Name</option>
				<option value="1" >Account Manager</option>
				<option value="2">Account Handler</option>
				<option value="3" >Status</option>
				<option value="4">Invoice Id</option>
			</select></td>
		</tr>
		<tr>
			<td><input type="submit" class="formButton" value="sort" onclick="setAction('sortBy')"/></td>
		</tr>
	</table>
	</div>
	
	</div>
	</div>
	
	<div id="mainContent">

	<div class="box">

	<h3 class="headingB">Invoices: Current Month</h3>

	<br>

	<div class="tableContainer" id="data">
	<table border="0" cellpadding="2" cellspacing="0">
		<thead>
			<tr>
				<td colspan="8">Total:&nbsp;3</td>
			</tr>
			<TR>
				<TD width="150">Client Name</TD>
				<TD width="150">Account Manager</TD>
				<TD width="150">Account Handler</TD>
				<TD width="150">Invoice ID</TD>
				<TD width="150">Invoice Period</TD>
				<TD width="150">Agreed<br>Invoice Amount</TD>
				<TD width="150">Actual<br> Invoice Amount</TD>
				<TD width="150">Status</TD>
			</TR>
		</thead>
		<TBODY>
			<TR>
				<TD width="150"><a href="about-us.html">Dyson</a></TD>
				<TD width="150">Rachel Sankey</TD>
				<TD width="150">Bruno Le Huec</TD>
				<TD width="150"><a href="about-us.html">0000029</a></TD>
				<TD width="150">03/2005</TD>
				<TD width="150">100.00</TD>
				<TD width="150">100.00</TD>
				<TD width="150">New Invoice Entry</TD>
			</TR>
			<TR>
				<TD width="150"><a href="about-us.html">Hoover</a></TD>
				<TD width="150">Rachel Sankey</TD>
				<TD width="150">John Smith</TD>
				<TD width="150"><a href="about-us.html">0003186</a></TD>
				<TD width="150">03/2005</TD>
				<TD width="150"><a href="about-us.html">175.00</a></TD>
				<TD width="150">175.00</TD>
				<TD width="150">U/W Authorised</TD>
				</TR>
			<TR>
				<TD width="150"><a href="about-us.html">Sony</a></TD>
				<TD width="150">Bruno Le Huec</TD>
				<TD width="150">Fred Bloggs</TD>
				<TD width="150"><a href="about-us.html">0000008</a></TD>
				<TD width="150">03/2005</TD>
				<TD width="150">300.00</TD>
				<TD width="150">300.00</TD>
				<TD width="150">Transferred for Payment</TD>
			</TR>
	</tbody>
	</table>

	</div>

	<br>


	</div>
<br>
	</div>
	</div>

</form></div>
<!-- InstanceEndEditable -->
<div class="clearBoth">&nbsp;</div>
<div id="footer">
<p>&copy;&nbsp;Domestic &amp; General Group PLC</p>
</div>
</BODY>
</HTML>
