package com.domgen.marketingbudgets.vo;


import com.domgen.data.common.vo.IBaseVO;

/**
 * Value Object for Nature Maintenance file
 *  
 * @version	1.0
 * @author 	GATLANM on 09-Aug-05
 */
public class NatureVO implements IBaseVO
{
	// entity attributes
	private String nature;
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
	public String getNature() {
		return nature;
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
	public void setNature(String string) {
		nature = string;
	}

}