/*
 * Created on 27-Sep-05
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.domgen.marketingbudgets.bo;
//import com.domgen.utilities.data.DGDate;
/**
 * @author gatlanm
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class DateTimeBO {

	public String[] getCurrentDateTime()
	{
		String[] results = new String[2];
		
		// get current date & time
		 String currentDate = "";
		 String currentTime = "";
		 try
		 {

			//DGDate date = new DGDate();
			//currentDate =
				//Long.toString(
					//date.convertStringDateToAS400Date(date.getCurrentDate()));	

			//currentTime = date.getCurrentTime().replaceAll(":","");			
		 }
		 catch (Exception e)
		 {
			 e.printStackTrace();
		 }
		 
		 results[0] = currentDate;
		 results[1] = currentTime;
		 
		 return results;
		 }
}
