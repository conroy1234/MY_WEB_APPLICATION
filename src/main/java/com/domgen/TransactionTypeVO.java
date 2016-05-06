package com.domgen.marketingbudgets.vo;


import com.domgen.data.common.vo.IBaseVO;

/**
 * Value Object for Transaction Type maintenance file
 *  
 * @version	1.0
 * @author 	GATLANM on 09-Aug-05
 */
public class TransactionTypeVO implements IBaseVO
{
	// entity attributes
	private String transactionType;
	private String description;
	private String displayFlag;

	/**
	 * @return
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @return
	 */
	public String getDisplayFlag() {
		return displayFlag;
	}

	/**
	 * @return
	 */
	public String getTransactionType() {
		return transactionType;
	}

	/**
	 * @param string
	 */
	public void setDescription(String string) {
		description = string;
	}

	/**
	 * @param string
	 */
	public void setDisplayFlag(String string) {
		displayFlag = string;
	}

	/**
	 * @param string
	 */
	public void setTransactionType(String string) {
		transactionType = string;
	}

}
	
