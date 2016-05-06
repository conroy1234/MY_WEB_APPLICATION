package com.domgen.marketingbudgets.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

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
import com.domgen.marketingbudgets.vo.ActionEditAuditVO;
//import com.domgen.utilities.data.DGDate;

/**
 * @author gatlanm
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class ActionEditAuditDAO extends BaseDAO implements ISelect, IDelete, IInsert, IUpdate
{
	private SelectDAOHelper selectHelper = new SelectDAOHelper (this);
	private InsertDAOHelper insertHelper = new InsertDAOHelper (this);
	private DeleteDAOHelper deleteHelper = new DeleteDAOHelper (this);
	private UpdateDAOHelper updateHelper = new UpdateDAOHelper (this);
	
	private static final String TABLE = "SCHDAYFILF.MBACTAUD";
	private static final String KEY_FIELDS[] = {"MBORIG",
													"MBORDT",
													"MBORTM"};
	private static final String ATTRIBUTE_FIELDS[] = {"MBCOMM",		
														"MBSTAT",												
														"MBDATE",
														"MBTIME",
														"MBAUTH"};
	private List keyFieldsList = null;
	private List attributeFieldsList = null;
											  
	/**
	 * Constructor, establishing that the related table lies within the
	 * campaign database 
	 *
	 */
	public ActionEditAuditDAO() 
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
		ActionEditAuditVO theVO = (ActionEditAuditVO) someVO;
		
		try
		{
			// store key fields
			theVO.setOriginator(rs.getString(KEY_FIELDS[0]));
			theVO.setOriginalDate(rs.getString(KEY_FIELDS[1]));
			theVO.setOriginalTime(rs.getString(KEY_FIELDS[2]));
			
				
			
			// store attribute fields
			theVO.setComments (rs.getString(ATTRIBUTE_FIELDS[0]));
			theVO.setStatusUpdate (rs.getString(ATTRIBUTE_FIELDS[1]));
			theVO.setDate (rs.getString(ATTRIBUTE_FIELDS[2]));
			theVO.setTime (rs.getString(ATTRIBUTE_FIELDS[3]));
			theVO.setAuthor(rs.getString(ATTRIBUTE_FIELDS[4]));

			//format
				StatusCodesText statusCodesText = new StatusCodesText();
				theVO.setStatusUpdateText(statusCodesText.getActionStatusCodeText(rs.getString(ATTRIBUTE_FIELDS[1])));
			//generate formatted fields
				try {
						//DGDate date = new DGDate();
						//theVO.setDateFormatted(date.convertAS400DateToStringDate(Long.parseLong(rs.getString(ATTRIBUTE_FIELDS[2]))));
						//theVO.setTimeFormatted(date.convertTimeToExternal(Long.parseLong(rs.getString(ATTRIBUTE_FIELDS[3]))));
					}
					catch (Exception e)
					{
						e.printStackTrace();
					}
		
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
			return new ActionEditAuditVO();
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
		ActionEditAuditVO theVO = (ActionEditAuditVO) someVO;

		try
		{
			ps.setString(1, theVO.getOriginator());
			ps.setString(2, theVO.getOriginalDate());
			ps.setString(3, theVO.getOriginalTime());
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
		ActionEditAuditVO theVO = (ActionEditAuditVO) someVO;

		try
		{
			ps.setString(1, theVO.getOriginator());		
			ps.setString(2, theVO.getOriginalDate());
			ps.setString(3, theVO.getOriginalTime());
			ps.setString(4, theVO.getComments());
			ps.setString(5, theVO.getStatusUpdate());
			ps.setString(6, theVO.getDate());
			ps.setString(7, theVO.getTime());
			ps.setString(8, theVO.getAuthor());

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
		ActionEditAuditVO theVO = (ActionEditAuditVO) someVO;

		try
		{
			ps.setString(1, theVO.getComments());
			ps.setString(2, theVO.getStatusUpdate());
			ps.setString(3, theVO.getDate());
			ps.setString(4, theVO.getTime());
			ps.setString(5, theVO.getAuthor());
			
			ps.setString(6, theVO.getOriginator()); 		// key
			ps.setString(7, theVO.getOriginalDate());
			ps.setString(8, theVO.getOriginalTime());
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



