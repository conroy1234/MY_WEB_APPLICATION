package com.domgen.marketingbudgets.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import com.domgen.common.utilities.DGDate;
import com.domgen.data.common.dao.BaseDAO;
import com.domgen.data.common.dao.IDelete;
import com.domgen.data.common.dao.IInsert;
import com.domgen.data.common.dao.ISelect;
import com.domgen.data.common.dao.IUpdate;
import com.domgen.data.common.dao.helper.DeleteDAOHelper;
import com.domgen.data.common.dao.helper.InsertDAOHelper;
import com.domgen.data.common.dao.helper.SelectDAOHelper;
import com.domgen.data.common.dao.helper.UpdateDAOHelper;
import com.domgen.data.common.vo.IBaseVO;
import com.domgen.marketingbudgets.helper.StatusCodesText;
import com.domgen.marketingbudgets.vo.ActionVO;
/**
 * Data Access Object for the Finance Division
 *  
 * @version	1.0
 * @author 	SIMMR on 04-Jul-05
 */
public class ActionDAO extends BaseDAO implements ISelect, IDelete, IInsert, IUpdate
{
	private SelectDAOHelper selectHelper = new SelectDAOHelper (this);
	private InsertDAOHelper insertHelper = new InsertDAOHelper (this);
	private DeleteDAOHelper deleteHelper = new DeleteDAOHelper (this);
	private UpdateDAOHelper updateHelper = new UpdateDAOHelper (this);
	
	private static final String TABLE = "SCHDAYFILF.MBACTION";
	private static final String KEY_FIELDS[] = {"MBOWNR",
													"MBORIG",
													"MBDATE",
													"MBTIME"};
	private static final String ATTRIBUTE_FIELDS[] = {"MBACCN",														
														"MBACTN",
														"MBREAD",
														"MBEMAL",
														"MBSTAT"};
	private List keyFieldsList = null;
	private List attributeFieldsList = null;
											  
	/**
	 * Constructor, establishing that the related table lies within the
	 * campaign database 
	 *
	 */
	public ActionDAO() 
	{
		super ();
		
		// initilaise the lists from the static arrays	
		keyFieldsList = initialiseKeyFieldsList();
		attributeFieldsList = initialiseAttributeFieldsList();		
	}
	
	/* (non-Javadoc)
	 * @see com.domgen.common.data.dao.IDatabaseActivity#getTable()
	 */	
	public String getTable()
	{
		return TABLE;
	}
	
	/**
	 * Recursivley initialises the key list from the key fields array
	 * of each DAO in the hierarchy
	 * 
	 * @return 		List of key fields
	 */
	public static List initialiseKeyFieldsList()
	{
		return Arrays.asList (KEY_FIELDS);
	}
	
	/**
	 * Recursivley initialises the attribute list from the attribute fields array
	 * of each DAO in the hierarchy
	 * 
	 * @return 		List of attribute fields
	 */	
	public static List initialiseAttributeFieldsList()
	{
		return Arrays.asList (ATTRIBUTE_FIELDS);
	}
	
	/* (non-Javadoc)
	 * @see com.domgen.common.data.dao.IDatabaseActivity#getKeyFieldsList()
	 */		
	public List getKeyFieldsList()
	{
		return keyFieldsList;
	}
	
	/* (non-Javadoc)
	 * @see com.domgen.common.data.dao.IDatabaseActivity#getAttributeFieldsList()
	 */	
	public List getAttributeFieldsList()
	{
		return attributeFieldsList;
	}
	
	//
	// *** SELECT method implementations ***
	//

	/* (non-Javadoc)
	 * @see com.domgen.common.data.dao.IDatabaseActivity#storeFields(IBaseVO, ResultSet)
	 */	
	public void storeFields (IBaseVO someVO, ResultSet rs)
	{		
		ActionVO theVO = (ActionVO) someVO;
		
		try
		{
			// store key fields
			theVO.setActionOwner(rs.getString(KEY_FIELDS[0]));
			theVO.setActionOriginator(rs.getString(KEY_FIELDS[1]));
			theVO.setDate(rs.getString(KEY_FIELDS[2]));
			theVO.setTime(rs.getString(KEY_FIELDS[3]));
			
			//generate formatted fields
			try {
				DGDate date = new DGDate();
				theVO.setDateFormatted(date.convertAS400DateToStringDate(Long.parseLong(rs.getString(KEY_FIELDS[2]))));
				theVO.setTimeFormatted(date.convertTimeToExternal(Long.parseLong(rs.getString(KEY_FIELDS[3]))));
				}
				catch (Exception e)
				{
					e.printStackTrace();
				}
			
			
			// store attribute fields
			theVO.setAccountName (rs.getString(ATTRIBUTE_FIELDS[0]));
			theVO.setActionText (rs.getString(ATTRIBUTE_FIELDS[1]));
			theVO.setActionFlag (rs.getString(ATTRIBUTE_FIELDS[2]));
			theVO.setEmail (rs.getString(ATTRIBUTE_FIELDS[3]));
			theVO.setStatus (rs.getString(ATTRIBUTE_FIELDS[4]));
			//format
				StatusCodesText statusCodesText = new StatusCodesText();
				theVO.setStatusText(statusCodesText.getActionStatusCodeText(rs.getString(ATTRIBUTE_FIELDS[4])));
				theVO.setActionTextShort (rs.getString(ATTRIBUTE_FIELDS[1]).substring(0,20) + "...");
		}
		catch (SQLException e)
		{
			logger.error("SQL Exception occurred - Project [MarketingBudgets] class [ActionDAO] method [storeFields] - theVO: " + theVO + " , ResultSet: " + rs);
			
			e.printStackTrace();
		}
	}
	

	/* (non-Javadoc)
	 * @see com.domgen.common.data.dao.ISelect#findByCriteria(String)
	 */	
	public List findByCriteria (HashMap search, HashMap sort)
	{
		return selectHelper.findByCriteria (search, sort);
	}

	/**
	 * Convenience method
	 * 
	 * @return
	 */
	public List findByCriteria ()
	{
		return selectHelper.findByCriteria (null, null);
	}
	
	/* (non-Javadoc)
	 * @see com.domgen.common.data.dao.ISelect#createVO()
	 */	
	public IBaseVO createVO()
		{
			return new ActionVO();
		}


	//
	// *** DELETE method implementations
	//

	/* (non-Javadoc)
	 * @see com.domgen.data.common.dao.IDelete#delete(com.domgen.data.common.vo.IBaseVO)
	 */
	public int delete(IBaseVO theVO)
	{
		return deleteHelper.delete (theVO);
		
	}

	/* (non-Javadoc)
	 * @see com.domgen.data.common.dao.IDelete#populateStatementDelete(com.domgen.data.common.vo.IBaseVO, java.sql.PreparedStatement)
	 */
	public PreparedStatement populateStatementDelete(IBaseVO someVO, PreparedStatement ps)
	{
		ActionVO theVO = (ActionVO) someVO;

		try
		{
			ps.setString(1, theVO.getActionOwner());
			ps.setString(2, theVO.getActionOriginator());
			ps.setString(3, theVO.getDate());
			ps.setString(4, theVO.getTime());
		}
		catch (SQLException e)
		{
			logger.error("SQL Exception occurred - Project [MarketingBudgets] class [ActionDAO] method [populateStatementDelete] - theVO: " + theVO + " , PreparedStatement: " + ps);
			
			e.printStackTrace();
		}

		// and populate any attributes from an audit DAO		
		return ps;
	}

	//
	// *** INSERT method implementations ***
	//
	
	/* (non-Javadoc)
	 * @see com.domgen.data.common.dao.IInsert#insert(com.domgen.data.common.vo.IBaseVO)
	 */
	public int insert(IBaseVO theVO)
	{
		return insertHelper.insert(theVO);
	}

	/* (non-Javadoc)
	 * @see com.domgen.data.common.dao.IInsert#populateStatementInsert(java.sql.PreparedStatement)
	 */
	public PreparedStatement populateStatementInsert(IBaseVO someVO, PreparedStatement ps)
	{
		ActionVO theVO = (ActionVO) someVO;

		try
		{
			logger.debug(theVO.getActionOwner() + ".");			
			logger.debug(theVO.getActionOriginator() + ".");	
			logger.debug(theVO.getDate() + ".");	
			logger.debug(theVO.getTime() + ".");	
			logger.debug(theVO.getAccountName() + ".");	
			logger.debug(theVO.getActionText() + ".");	
			logger.debug(theVO.getActionFlag() + ".");	
			logger.debug(theVO.getEmail() + ".");	
			logger.debug(theVO.getStatus() + ".");
			
			ps.setString(1, theVO.getActionOriginator());		
			ps.setString(2, theVO.getActionOwner());
			ps.setString(3, theVO.getAccountName());
			ps.setString(4, theVO.getActionText());
			ps.setString(5, theVO.getActionFlag());
			ps.setString(6, theVO.getEmail());
			ps.setString(7, theVO.getDate());
			ps.setString(8, theVO.getTime());	
			ps.setString(9, theVO.getStatus());
		}
		catch (SQLException e)
		{
			logger.error("SQL Exception occurred - Project [MarketingBudgets] class [ActionDAO] method [populateStatementInsert] - theVO: " + theVO + " , PreparedStatement: " + ps);
			
			
			e.printStackTrace();
		}

		// and populate any attributes from an audit DAO		
		return ps;
	}
	
	//
	// *** UPDATE method implementations ***
	//

	/* (non-Javadoc)
	 * @see com.domgen.data.common.dao.IUpdate#update(com.domgen.data.common.vo.IBaseVO)
	 */
	public int update(IBaseVO theVO)
	{
		return updateHelper.update (theVO);
	}

	/* (non-Javadoc)
	 * @see com.domgen.data.common.dao.IUpdate#populateStatementUpdate(com.domgen.data.common.vo.IBaseVO, java.sql.PreparedStatement)
	 */
	public PreparedStatement populateStatementUpdate(IBaseVO someVO, PreparedStatement ps)
	{
		ActionVO theVO = (ActionVO) someVO;

		try
		{
			ps.setString(1, theVO.getAccountName());
			ps.setString(2, theVO.getActionText());
			ps.setString(3, theVO.getActionFlag());
			ps.setString(4, theVO.getEmail());
			ps.setString(5, theVO.getStatus());
					
			ps.setString(6, theVO.getActionOwner()); 		// key
			ps.setString(7, theVO.getActionOriginator());
			ps.setString(8, theVO.getDate());
			ps.setString(9, theVO.getTime());

		}
		catch (SQLException e)
		{
			logger.error("SQL Exception occurred - Project [MarketingBudgets] class [ActionDAO] method [populateStatementUpdate] - theVO: " + theVO + " , PreparedStatement: " + ps);
			
			e.printStackTrace();
		}

		// and populate any attributes from an audit DAO		
		return ps;
	}	
}

