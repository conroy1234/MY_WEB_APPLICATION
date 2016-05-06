package com.domgen.marketingbudgets.vo;


import com.domgen.data.common.vo.IBaseVO;

/**
 * Value Object for Adaytum Account Manager
 *  
 * @version	1.0
 * @author 	SIMMR on 11-Jul-05
 */
public class AdaytumAccountManagerVO implements IBaseVO
{
	// entity attributes
	private String initials;
	private String name;
	private String email;
	private String type;
	private String userId;

	/**
	 * @return
	 */
	public String getEmail()
	{
		return email;
	}

	/**
	 * @return
	 */
	public String getInitials()
	{
		return initials;
	}

	/**
	 * @return
	 */
	public String getName()
	{
		return name;
	}

	/**
	 * @param string
	 */
	public void setEmail(String string)
	{
		email = string;
	}

	/**
	 * @param string
	 */
	public void setInitials(String string)
	{
		initials = string;
	}

	/**
	 * @param string
	 */
	public void setName(String string)
	{
		name = string;
	}

	/**
	 * @return
	 */
	public String getType() {
		return type;
	}

	/**
	 * @param string
	 */
	public void setType(String string) {
		type = string;
	}

	/**
	 * @return
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * @param string
	 */
	public void setUserId(String string) {
		userId = string;
	}

}
	