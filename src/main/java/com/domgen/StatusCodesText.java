/*
 * Created on 23-Sep-05
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.domgen.marketingbudgets.helper;

/**
 * @author gatlanm
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class StatusCodesText {

			/**
			 * retrieve text for Invoice Line status code
			 * 
			 * @return
			 */
			public String getInvoiceLineStatusCodeText(String status)
			{
				String statusText = "";
				
				if (status == null || status.equalsIgnoreCase(""))
				{
					statusText = "unknown";
				} 
				else
				{
					int statusInt = Integer.parseInt(status);
					switch(statusInt)
					{
						case 10: return "Early invoice";
						case 20: return "New entry";
						case 32: return "U/W authorised";
						case 34: return "U/W authorised, Agreement Outstanding";
						case 36: return "U/W rejection";
						case 38: return "U/W query";
						case 40: return "S/S authorised";
						case 42: return "S/S rejected";
						case 44: return "S/S query";
						case 50: return "Rejected to accounts";
						case 52: return "Edited by accounts";
						case 56: return "Deleted by accounts";
						case 60: return "Awaiting validation";
						case 62: return "Validation error";
						case 64: return "Validation complete";
						case 65: return "Awaiting transfer";
						case 67: return "Transfer error";
						case 70: return "Transfer complete";
						case 99: return "Add Comments";
						}
				}
				return statusText;
			}
			
			/**
			 * retrieve text for Action status code
			 * 
			 * @return
			 */
			public String getActionStatusCodeText(String status)
				{
				String statusText = "";
				if ( status == null || status.equalsIgnoreCase(""))
				{
					statusText = "unknown";
				} 
				else
				{
				int statusInt = Integer.parseInt(status);
				
					switch(statusInt)
					{
						case 10: return "New";
						case 20: return "Acknowledged";
						case 30: return "WIP";
						case 40: return "Completed";
					}
				}								
				return statusText;
				}

			/**
			 * retrieve text for Budget Line status code
			 * 
			 * @return
			 */
			public String getBudgetLineStatusCodeText(String status)
				{
				String statusText = "";
				if (status == null)
				{
					statusText = "Unsubmitted";
				} 
				else if (status.equalsIgnoreCase(""))
				{
					statusText = "unknown";
				} 
				else
				{					
					int statusInt = Integer.parseInt(status);
					switch(statusInt)
					{
						case 10: return "Unsubmitted";
						case 20: return "Submitted";
						case 30: return "Paid";
					}
				}								
				return statusText;
				}

		/**
		 * retrieve text for Budget Line status code
		 * 
		 * @return
		 */
		public String getBudgetHeaderStatusCodeText(String status)
			{
			String statusText = "";
			if (status == null)
			{
				statusText = "Unsubmitted";
			} 
			else if (status.equalsIgnoreCase(""))
			{
				statusText = "unknown";
			} 
			else
			{
						
				int statusInt = Integer.parseInt(status);
				switch(statusInt)
				{
					case 10: return "Pending";
					case 20: return "Live";
					case 30: return "Rejected";
		
				}
			}								
			return statusText;
			}

}
