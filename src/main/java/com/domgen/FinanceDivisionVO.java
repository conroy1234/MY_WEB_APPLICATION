package com.domgen.marketingbudgets.vo;


import com.domgen.data.common.vo.IBaseVO;

/**
 * Value Object for Finance Division
 *  
 * @version	1.0
 * @author 	SIMMR on 04-Jul-05
 */
public class FinanceDivisionVO implements IBaseVO
{
	// entity attributes
	private String financeDivision;
	private String description;
	private String vatRate;
	private String displayFlag;
	private String vatRateNew;
	private String comments;

	/**
	 * @return
	 */
	public String getDescription()
	{
		return description;
	}

	/**
	 * @return
	 */
	public String getDisplayFlag()
	{
		return displayFlag;
	}

	/**
	 * @return
	 */
	public String getFinanceDivision()
	{
		return financeDivision;
	}

	/**
	 * @return
	 */
	public String getVatRate()
	{
		return vatRate;
	}

	/**
	 * @param string
	 */
	public void setDescription(String string)
	{
		description = string;
	}

	/**
	 * @param string
	 */
	public void setDisplayFlag(String string)
	{
		displayFlag = string;
	}

	/**
	 * @param string
	 */
	public void setFinanceDivision(String string)
	{
		financeDivision = string;
	}

	/**
	 * @param string
	 */
	public void setVatRate(String string)
	{
		vatRate = string;
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
	public String getVatRateNew() {
		return vatRateNew;
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
	public void setVatRateNew(String string) {
		vatRateNew = string;
	}

}
	