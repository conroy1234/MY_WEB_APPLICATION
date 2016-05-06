/*
 * Created on 27-Sep-05
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.domgen.marketingbudgets.vo;
import com.domgen.data.common.vo.IBaseVO;
/**
 * @author gatlanm
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class ActionEditAuditVO implements IBaseVO {
	
	private String accountName;
	private String statusUpdate;
	private String statusUpdateText;
	private String comments;
	private String author;
	private String date;
	private String dateFormatted;
	private String time;
	private String timeFormatted;
		
	private String originator;
	private String originalDate;
	private String originalTime;

	/**
	 * @return
	 */
	public String getAccountName() {
		return accountName;
	}

	/**
	 * @return
	 */
	public String getAuthor() {
		return author;
	}

	/**
	 * @return
	 */
	public String getComments() {
		return comments;
	}

	/**
	 * @return
	 */
	public String getDate() {
		return date;
	}

	/**
	 * @return
	 */
	public String getDateFormatted() {
		return dateFormatted;
	}

	/**
	 * @return
	 */
	public String getOriginalDate() {
		return originalDate;
	}

	/**
	 * @return
	 */
	public String getOriginalTime() {
		return originalTime;
	}

	/**
	 * @return
	 */
	public String getOriginator() {
		return originator;
	}

	/**
	 * @return
	 */
	public String getStatusUpdate() {
		return statusUpdate;
	}

	/**
	 * @return
	 */
	public String getTime() {
		return time;
	}

	/**
	 * @return
	 */
	public String getTimeFormatted() {
		return timeFormatted;
	}

	/**
	 * @param string
	 */
	public void setAccountName(String string) {
		accountName = string;
	}

	/**
	 * @param string
	 */
	public void setAuthor(String string) {
		author = string;
	}

	/**
	 * @param string
	 */
	public void setComments(String string) {
		comments = string;
	}

	/**
	 * @param string
	 */
	public void setDate(String string) {
		date = string;
	}

	/**
	 * @param string
	 */
	public void setDateFormatted(String string) {
		dateFormatted = string;
	}

	/**
	 * @param string
	 */
	public void setOriginalDate(String string) {
		originalDate = string;
	}

	/**
	 * @param string
	 */
	public void setOriginalTime(String string) {
		originalTime = string;
	}

	/**
	 * @param string
	 */
	public void setOriginator(String string) {
		originator = string;
	}

	/**
	 * @param string
	 */
	public void setStatusUpdate(String string) {
		statusUpdate = string;
	}

	/**
	 * @param string
	 */
	public void setTime(String string) {
		time = string;
	}

	/**
	 * @param string
	 */
	public void setTimeFormatted(String string) {
		timeFormatted = string;
	}

	/**
	 * @return
	 */
	public String getStatusUpdateText() {
		return statusUpdateText;
	}

	/**
	 * @param string
	 */
	public void setStatusUpdateText(String string) {
		statusUpdateText = string;
	}

}
