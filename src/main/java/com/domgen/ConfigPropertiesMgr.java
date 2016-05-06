package com.domgen.marketingbudgets.beans;

import java.util.Properties;
import java.util.ResourceBundle;

import org.apache.log4j.Logger;


/** 
 * This class stores the Property Values retrieved from file. <br>
 * It will attempt to fetch the file from the local server, failing which<br>
 * it will use the version scoped under the resources folder of this project<br>
 * 
 *
 * @version $Revision: 1.1 $ 
 * @author simmr on 12 Jan 2011 
 **/
public class ConfigPropertiesMgr
{
	private static  Logger logger = Logger.getLogger(ConfigPropertiesMgr.class.getName());
	
	private static ConfigPropertiesMgr instance = null;
	
	// System Properties
	private String system;
	
	/**
	 * Constructor is protected to defeat instantiation.
	 *  
	 */
	protected ConfigPropertiesMgr()
	{
		// Get  Properties
		getConfigPropertiesLocal();
	}
	
	/**
	 * Get properties from Scoped properties File<br>
	 *
	 */
	protected void getConfigPropertiesLocal()
	{
		try
		{
			// This does not seem to work on the AS400.
			ResourceBundle poConfig = ResourceBundle.getBundle("com.domgen.marketingbudgets.resources.mbProperties");
					
			// Set default values retrieved from resource bundle file			
			setDefaultValues(poConfig);
		}
		catch (Exception e)
		{			
			// Set Logger Level to Warning. INFO and DEBUG messages will be ignored
			logger.error(" Failed to load Resource Bundle with Properties File : " ,e);
		}
	}
	
	/**
	 * Get Property Instance
	 * 
	 * @return
	 */
	public static ConfigPropertiesMgr getInstance()
	{
		if (instance == null)
		{
			instance = new ConfigPropertiesMgr();
		}
		return instance;
	}
	
	/**
	 * @return Returns the system.
	 */
	public String getSystem()
	{
		return system;
	}

	/**
	 * @param system The system to set.
	 */
	protected void setSystem(String system)
	{
		this.system = system;
	}
	
	/**
	 * Set Default Values from (attached) Resource Bundle 
	 * 
	 * @param resource
	 */
	protected void setDefaultValues(ResourceBundle resource)
	{
		setSystem(resource.getString("system"));
	}
	
	/**
	 * Set Default Values from (attached) Properties File
	 * 
	 * @param props
	 */
	protected void setDefaultValues(Properties props)
	{
		setSystem(props.getProperty("system"));
	}
}
