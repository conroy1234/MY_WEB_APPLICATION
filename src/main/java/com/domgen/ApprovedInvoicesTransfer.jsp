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
<TITLE>ApprovedInvoicesTransfer.jsp</TITLE>
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
	height="75" border="0" /></a><i class="topStrap" style="text-indent: 15px">&nbsp;Marketing Budgets</i></div>
<div id="navMain">
<ul>
	  <li><a href="about-us.html">Invoice Entry</a></li>
	   <li><a href="about-us.html">Invoices</a></li>
       <li class="selected">Authorised</li>
       <li><a href="about-us.html">Maintenance</a></li>
	<li><A style="border-right: none"></A></li>
	</ul>
</div>
<div id="navTrail">
<ul>
	<!-- InstanceBeginEditable name="trail" -->
		<li><a href="index.jsp">Accounts</a>&nbsp;&gt;</li>
		<li><a href="index.jsp">Authorised</a>&nbsp;&gt;</li>
   	 	<li class="sectionSelected">Payment Transferral</li>
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
			<td>Invoice Id</td>
		</tr>
		<tr>
			<td><input type="text" name="invoiceId" size="10" maxlength="7" /><br>
			<input type="button" name="resetAgent" class="navButton" value="reset" onclick="clearAgent()" /></td>
		</tr>
		<tr>
			<td>Invoice Entry Date</td>
		</tr>
		<tr>
			<td><input type="text" name="invoiceId" size="10" maxlength="7" /><br>
			<input type="button" name="resetAgent" class="navButton" value="reset" onclick="clearAgent()" /></td>
		</tr>
		<tr>
			<td>Invoice Date</td>
		</tr>
		<tr>
			<td><input type="text" name="invoiceId" size="10" maxlength="7" /><br>
			<input type="button" name="resetAgent" class="navButton" value="reset" onclick="clearAgent()" /></td>
		</tr>
		<tr>
			<td>Invoice No</td>
		</tr>
		<tr>
			<td><input type="text" name="invoiceId" size="10" maxlength="7" /><br>
			<input type="button" name="resetAgent" class="navButton" value="reset" onclick="clearAgent()" /></td>
		</tr>
		<tr>
			<td>Client Name</td>
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
		</tr>
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
				<option value="3" >Invoice Id (asc)</option>
				<option value="4">Invoice Id (desc)</option>
				<option value="1" >Invoice Entry Date (asc)</option>
				<option value="2">Invoice Entry Date (desc)</option>
				<option value="1" >Invoice Date (asc)</option>
				<option value="2">Invoice Date (desc)</option>
				<option value="3" >Invoice No (asc)</option>
				<option value="4">Invoice No (desc)</option>
				<option value="5" >Client Name (asc)</option>
				<option value="6">Client Name (desc)</option>
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

	<h3 class="headingB">Authorised Invoices:</h3>

	<br>

	<div class="tableContainer" id="data">
	<table border="0" cellpadding="2" cellspacing="0">
		<thead>
			<tr>
				<td colspan="10">Total:&nbsp;15</td>
			</tr>
			<TR>
				<TD width="30">Select</TD>
				<TD width="150">Invoice<BR>Line ID</TD>
				<TD width="150">Invoice<BR>Entry Date</TD>
				<TD width="150">Invoice<BR>Date</TD>
				<TD width="150">Invoice<BR>No</TD>
				<TD width="150">Client<BR>Name</TD>
				<TD width="150">Invoice<BR>Amount</TD>
				<TD width="150">U/W<BR>Authoriser</TD>
				<TD width="150">S/S<BR>Authoriser</TD>
				<TD width="150">Action</TD>
			</TR>
		</thead>
		<TBODY>
			<TR>
				<TD width="30"><input type="checkbox" name="select1" /></TD>
				<TD width="150"><font color="blue">0000001</font></TD>
				<TD width="150">05/2005</TD>
				<TD width="150">01/2005</TD>
				<TD width="150">AB000456*5</TD>
				<TD width="150">Hoover</TD>
				<TD width="150">100.00</TD>
				<TD width="150">SANKEYR</TD>
				<TD width="150">LEHUECB</TD>
				<TD width="150"><input type="submit" class="formButton" value="transfer" onclick=""/></TD>
			</TR>
			<TR>
				<TD width="30"><input type="checkbox" name="select1" /></TD>
				<TD width="150">0000002</TD>
				<TD width="150">05/2005</TD>
				<TD width="150">02/2005</TD>
				<TD width="150">AB000456*5</TD>
				<TD width="150">Hoover</TD>
				<TD width="150">100.00</TD>
				<TD width="150">SANKEYR</TD>
				<TD width="150">LEHUECB</TD>
				<TD width="150"><input type="submit" class="formButton" value="transfer" onclick=""/></TD>
			</TR>			
			<TR>
				<TD width="30"><input type="checkbox" name="select1" /></TD>
				<TD width="150">0000003</TD>
				<TD width="150">05/2005</TD>
				<TD width="150">03/2005</TD>
				<TD width="150">AB000456*5</TD>
				<TD width="150">Hoover</TD>
				<TD width="150">100.00</TD>
				<TD width="150">SANKEYR</TD>
				<TD width="150">LEHUECB</TD>
				<TD width="150"><input type="submit" class="formButton" value="transfer" onclick=""/></TD>
			</TR>
			<TR>
				<TD width="30"><input type="checkbox" name="select1" /></TD>
				<TD width="150"><font color="blue">0000004</font></TD>
				<TD width="150">05/2005</TD>
				<TD width="150">04/2005</TD>
				<TD width="150">AB000456*5</TD>
				<TD width="150">Hoover</TD>
				<TD width="150">100.00</TD>
				<TD width="150">SANKEYR</TD>
				<TD width="150">LEHUECB</TD>
				<TD width="150"><input type="submit" class="formButton" value="transfer" onclick=""/></TD>
			</TR>
			<TR>
				<TD width="30"><input type="checkbox" name="select1" /></TD>
				<TD width="150">0000005</TD>
				<TD width="150">05/2005</TD>
				<TD width="150">05/2005</TD>
				<TD width="150">AB000456*5</TD>
				<TD width="150">Hoover</TD>
				<TD width="150">100.00</TD>
				<TD width="150">SANKEYR</TD>
				<TD width="150">LEHUECB</TD>
				<TD width="150"><input type="submit" class="formButton" value="transfer" onclick=""/></TD>
			</TR>
			<TR>
				<TD width="30"><input type="checkbox" name="select1" /></TD>
				<TD width="150">0000009</TD>
				<TD width="150">05/2005</TD>
				<TD width="150">05/2005</TD>
				<TD width="150">SY000999</TD>
				<TD width="150">Sony</TD>
				<TD width="150">100.00</TD>
				<TD width="150">SANKEYR</TD>
				<TD width="150">LEHUECB</TD>
				<TD width="150"><input type="submit" class="formButton" value="transfer" onclick=""/></TD>
			</TR>
			<TR>
				<TD width="30"><input type="checkbox" name="select1" /></TD>
				<TD width="150">0000010</TD>
				<TD width="150">05/2005</TD>
				<TD width="150">05/2005</TD>
				<TD width="150">IN000547</TD>
				<TD width="150">Indesit</TD>
				<TD width="150">100.00</TD>
				<TD width="150">SANKEYR</TD>
				<TD width="150">LEHUECB</TD>
				<TD width="150"><input type="submit" class="formButton" value="transfer" onclick=""/></TD>
			</TR>
			<TR>
				<TD width="30"><input type="checkbox" name="select1" /></TD>
				<TD width="150">0000011</TD>
				<TD width="150">05/2005</TD>
				<TD width="150">05/2005</TD>
				<TD width="150">DY00687</TD>
				<TD width="150">Dyson</TD>
				<TD width="150">100.00</TD>
				<TD width="150">SANKEYR</TD>
				<TD width="150">LEHUECB</TD>
				<TD width="150"><input type="submit" class="formButton" value="transfer"/></TD>
			</TR>
	</tbody>
	</table>

	</div>
	<br>
<input type="submit" class="formButton" value="multiple transfer"/>
	


	</div>
<br>
<div class="box">

	<h3 class="headingB">Transfer In Progress:</h3>

	<br>
	<table border="0" cellpadding="2" cellspacing="0">
		<thead>
			<tr>
				<td colspan="8">Total:&nbsp;2</td>
			</tr>
			<TR>
				
				<TD width="150">Invoice<BR>ID</TD>
				<TD width="150">Invoice<BR>Entry Date</TD>
				<TD width="150">Invoice<BR>Date</TD>
				<TD width="150">Invoice<BR>No</TD>
				<TD width="150">Client<BR>Name</TD>
				<TD width="150">Invoice<BR>Amount</TD>
				<TD width="150">U/W<BR>Authoriser</TD>
				<TD width="150">S/S<BR>Authoriser</TD>
							
			</TR>
		</thead>
		<TBODY>
			<TR>
			
				<TD width="150"><font color="blue">0000101</font></TD>
				<TD width="150">05/2005</TD>
				<TD width="150">05/2005</TD>
				<TD width="150">AB000456</TD>
				<TD width="150">Hoover</TD>
				<TD width="150">100.00</TD>
				<TD width="150">SANKEYR</TD>
				<TD width="150">LEHUECB</TD>
								
			</TR>
			<TR>
				
				<TD width="150">0000102</TD>
				<TD width="150">05/2005</TD>
				<TD width="150">05/2005</TD>
				<TD width="150">AB000456</TD>
				<TD width="150">Hoover</TD>
				<TD width="150">100.00</TD>
				<TD width="150">SANKEYR</TD>
				<TD width="150">LEHUECB</TD>
								
			</TR>			
		
	</tbody>
	</table>
	<br>
<p></p>
	</div>
<div class="box">

	<h3 class="headingB">Transfer Error:</h3>

	<br>

	<div class="tableContainer" id="data">
	<table border="0" cellpadding="2" cellspacing="0">
		<thead>
			<tr>
				<td colspan="11">Total:&nbsp;3</td>
			</tr>
			<TR>
				<TD width="30">Select</TD>
				<TD width="150">Invoice<BR>ID</TD>
				<TD width="150">Invoice<BR>Entry Date</TD>
				<TD width="150">Invoice<BR>Date</TD>
				<TD width="150">Invoice<BR>No</TD>
				<TD width="150">Client<BR>Name</TD>
				<TD width="150">Invoice<BR>Amount</TD>
				<TD width="150">U/W<BR>Authoriser</TD>
				<TD width="150">S/S<BR>Authoriser</TD>
				<TD width="150">Error</TD>
				<TD width="150">Action</TD>
			</TR>
		</thead>
		<TBODY>
			<TR>
				<TD width="30"><input type="checkbox" name="select1" /></TD>
				<TD width="150"><font color="blue">0000101</font></TD>
				<TD width="150">05/2005</TD>
				<TD width="150">05/2005</TD>
				<TD width="150">AB000456</TD>
				<TD width="150">Hoover</TD>
				<TD width="150">100.00</TD>
				<TD width="150">SANKEYR</TD>
				<TD width="150">LEHUECB</TD>
				<TD width="150">incorrect</TD>
				<TD width="150"><input type="submit" class="formButton" value="transfer" onclick=""/></TD>
			</TR>
			<TR>
				<TD width="30"><input type="checkbox" name="select1" /></TD>
				<TD width="150">0000102</TD>
				<TD width="150">05/2005</TD>
				<TD width="150">05/2005</TD>
				<TD width="150">AB000456</TD>
				<TD width="150">Hoover</TD>
				<TD width="150">100.00</TD>
				<TD width="150">SANKEYR</TD>
				<TD width="150">LEHUECB</TD>
				<TD width="150">incorrect</TD>
				<TD width="150"><input type="submit" class="formButton" value="transfer" onclick=""/></TD>
			</TR>			
			<TR>
				<TD width="30"><input type="checkbox" name="select1" /></TD>
				<TD width="150">0000103</TD>
				<TD width="150">05/2005</TD>
				<TD width="150">05/2005</TD>
				<TD width="150">AB000456</TD>
				<TD width="150">Hoover</TD>
				<TD width="150">100.00</TD>
				<TD width="150">SANKEYR</TD>
				<TD width="150">LEHUECB</TD>
				<TD width="150">incorrect</TD>
				<TD width="150"><input type="submit" class="formButton" value="transfer" onclick=""/></TD>
			</TR>			
	</tbody>
	</table>

	</div>
	<br>
<input type="submit" class="formButton" value="multiple transfer"/>
	


	</div>
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
