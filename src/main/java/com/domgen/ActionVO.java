/*
 * Created on 16-Sep-05
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
public class ActionVO implements IBaseVO {
	
	private String actionOriginator;
	private String actionOwner;
	private String accountName;
	private String actionText;
	private String actionTextShort;
	private String actionFlag;
	private String email;
	private String date;
	private String time;
	private String dateFormatted;
	private String timeFormatted;
	private String status;
	private String statusText;

	/**
	 * @return
	 */
	public String getAccountName() {
		return accountName;
	}

	/**
	 * @return
	 */
	public String getActionFlag() {
		return actionFlag;
	}

	/**
	 * @return
	 */
	public String getActionOriginator() {
		return actionOriginator;
	}

	/**
	 * @return
	 */
	public String getActionOwner() {
		return actionOwner;
	}

	/**
	 * @return
	 */
	public String getActionText() {
		return actionText;
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
	public String getEmail() {
		return email;
	}

	/**
	 * @return
	 */
	public String getTime() {
		return time;
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
	public void setActionFlag(String string) {
		actionFlag = string;
	}

	/**
	 * @param string
	 */
	public void setActionOriginator(String string) {
		actionOriginator = string;
	}

	/**
	 * @param string
	 */
	public void setActionOwner(String string) {
		actionOwner = string;
	}

	/**
	 * @param string
	 */
	public void setActionText(String string) {
		actionText = string;
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
	public void setEmail(String string) {
		email = string;
	}

	/**
	 * @param string
	 */
	public void setTime(String string) {
		time = string;
	}

	/**
	 * @return
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param string
	 */
	public void setStatus(String string) {
		status = string;
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
	public String getTimeFormatted() {
		return timeFormatted;
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
	public void setTimeFormatted(String string) {
		timeFormatted = string;
	}

	/**
	 * @return
	 */
	public String getStatusText() {
		return statusText;
	}

	/**
	 * @param string
	 */
	public void setStatusText(String string) {
		statusText = string;
	}

	/**
	 * @return
	 */
	public String getActionTextShort() {
		return actionTextShort;
	}

	/**
	 * @param string
	 */
	public void setActionTextShort(String string) {
		actionTextShort = string;
	}

}
