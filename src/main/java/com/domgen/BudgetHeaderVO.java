package com.domgen.marketingbudgets.vo;


import com.domgen.data.common.vo.IBaseVO;

/**
 * Value Object for Budget Header
 *  
 * @version	1.0
 * @author 	SIMMR on 04-Jul-05
 */
public class BudgetHeaderVO implements IBaseVO
{
	// entity attributes
	private String accountName;
	private String currentPeriod;
	private String previousPeriod;
	private String accountManager;
	private String accountHandler;
	private String agreedTotal;
	private String monthlyGenerated;
	private String monthlyPaid;
	private String smaReference;
	private String status;
	private String clientFinYearFromMonth;
	private String clientFinYearFromYear;
	private String clientFinYearToMonth;
	private String clientFinYearToYear;
	private String budgetExpiryDate;
	private String rejectedByOriginal;
	private String accountManagerSetUp;
	private String accountHandlerSetUp;
	private String smaReferenceSetUp;

	/**
	 * @return
	 */
	public String getAccountHandler()
	{
		return accountHandler;
	}

	/**
	 * @return
	 */
	public String getAccountManager()
	{
		return accountManager;
	}

	/**
	 * @return
	 */
	public String getAccountName()
	{
		return accountName;
	}

	/**
	 * @return
	 */
	public String getAgreedTotal()
	{
		return agreedTotal;
	}

	/**
	 * @return
	 */
	public String getMonthlyGenerated()
	{
		return monthlyGenerated;
	}

	/**
	 * @return
	 */
	public String getMonthlyPaid()
	{
		return monthlyPaid;
	}

	/**
	 * @return
	 */
	public String getSmaReference()
	{
		return smaReference;
	}

	/**
	 * @return
	 */
	public String getStatus()
	{
		return status;
	}

	/**
	 * @param string
	 */
	public void setAccountHandler(String string)
	{
		accountHandler = string;
	}

	/**
	 * @param string
	 */
	public void setAccountManager(String string)
	{
		accountManager = string;
	}

	/**
	 * @param string
	 */
	public void setAccountName(String string)
	{
		accountName = string;
	}

	/**
	 * @param string
	 */
	public void setAgreedTotal(String string)
	{
		agreedTotal = string;
	}

	/**
	 * @param string
	 */
	public void setMonthlyGenerated(String string)
	{
		monthlyGenerated = string;
	}

	/**
	 * @param string
	 */
	public void setMonthlyPaid(String string)
	{
		monthlyPaid = string;
	}


	/**
	 * @param string
	 */
	public void setSmaReference(String string)
	{
		smaReference = string;
	}

	/**
	 * @param string
	 */
	public void setStatus(String string)
	{
		status = string;
	}

	/**
	 * @return
	 */
	public String getCurrentPeriod() {
		return currentPeriod;
	}

	/**
	 * @return
	 */
	public String getPreviousPeriod() {
		return previousPeriod;
	}

	/**
	 * @param string
	 */
	public void setCurrentPeriod(String string) {
		currentPeriod = string;
	}

	/**
	 * @param string
	 */
	public void setPreviousPeriod(String string) {
		previousPeriod = string;
	}

	/**
	 * @return
	 */
	public String getBudgetExpiryDate() {
		return budgetExpiryDate;
	}

	/**
	 * @return
	 */
	public String getClientFinYearFromMonth() {
		return clientFinYearFromMonth;
	}

	/**
	 * @return
	 */
	public String getClientFinYearFromYear() {
		return clientFinYearFromYear;
	}

	/**
	 * @return
	 */
	public String getClientFinYearToMonth() {
		return clientFinYearToMonth;
	}

	/**
	 * @return
	 */
	public String getClientFinYearToYear() {
		return clientFinYearToYear;
	}

	/**
	 * @param string
	 */
	public void setBudgetExpiryDate(String string) {
		budgetExpiryDate = string;
	}

	/**
	 * @param string
	 */
	public void setClientFinYearFromMonth(String string) {
		clientFinYearFromMonth = string;
	}

	/**
	 * @param string
	 */
	public void setClientFinYearFromYear(String string) {
		clientFinYearFromYear = string;
	}

	/**
	 * @param string
	 */
	public void setClientFinYearToMonth(String string) {
		clientFinYearToMonth = string;
	}

	/**
	 * @param string
	 */
	public void setClientFinYearToYear(String string) {
		clientFinYearToYear = string;
	}

	/**
	 * @return
	 */
	public String getAccountHandlerSetUp() {
		return accountHandlerSetUp;
	}

	/**
	 * @return
	 */
	public String getAccountManagerSetUp() {
		return accountManagerSetUp;
	}

	/**
	 * @return
	 */
	public String getSmaReferenceSetUp() {
		return smaReferenceSetUp;
	}

	/**
	 * @param string
	 */
	public void setAccountHandlerSetUp(String string) {
		accountHandlerSetUp = string;
	}

	/**
	 * @param string
	 */
	public void setAccountManagerSetUp(String string) {
		accountManagerSetUp = string;
	}

	/**
	 * @param string
	 */
	public void setSmaReferenceSetUp(String string) {
		smaReferenceSetUp = string;
	}

	/**
	 * @return
	 */
	public String getRejectedByOriginal() {
		return rejectedByOriginal;
	}

	/**
	 * @param string
	 */
	public void setRejectedByOriginal(String string) {
		rejectedByOriginal = string;
	}

}
	