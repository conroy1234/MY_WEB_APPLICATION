package com.domgen.marketingbudgets.vo;


import com.domgen.data.common.vo.IBaseVO;

/**
 * Value Object for Unit Maintenance file
 *  
 * @version	1.0
 * @author 	GATLANM on 09-Aug-05
 */
public class UnitVO implements IBaseVO
{
	// entity attributes
	private String unit;
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
	public String getUnit() {
		return unit;
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
	public void setUnit(String string) {
		unit = string;
	}

}