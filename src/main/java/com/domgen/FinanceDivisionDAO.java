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
import com.domgen.marketingbudgets.vo.FinanceDivisionVO;


/**
 * Data Access Object for the Finance Division
 *  
 * @version	1.0
 * @author 	SIMMR on 04-Jul-05
 */
public class FinanceDivisionDAO extends BaseDAO implements ISelect, IDelete, IInsert, IUpdate
{
	private SelectDAOHelper selectHelper = new SelectDAOHelper (this);
	private InsertDAOHelper insertHelper = new InsertDAOHelper (this);
	private DeleteDAOHelper deleteHelper = new DeleteDAOHelper (this);
	private UpdateDAOHelper updateHelper = new UpdateDAOHelper (this);
	
	private static final String TABLE = "SCHDAYFILF.MBFNCDVN";
	private static final String KEY_FIELDS[] = {"MBFIND"};
	private static final String ATTRIBUTE_FIELDS[] = {"MBDESC", 
														"MBVATR", 														
														"MBDISP"};
	private List keyFieldsList = null;
	private List attributeFieldsList = null;
											  
	/**
	 * Constructor, establishing that the related table lies within the
	 * campaign database 
	 *
	 */
	public FinanceDivisionDAO() 
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
		FinanceDivisionVO theVO = (FinanceDivisionVO)someVO;
		
		try
		{
			// store key fields
			theVO.setFinanceDivision (rs.getString(KEY_FIELDS[0]));
			
			// store attribute fields
			theVO.setDescription (rs.getString(ATTRIBUTE_FIELDS[0]));
			theVO.setVatRate (rs.getString(ATTRIBUTE_FIELDS[1]));
			theVO.setDisplayFlag (rs.getString(ATTRIBUTE_FIELDS[2]));
		}
		catch (SQLException e)
		{
			logger.error("SQL Exception occurred - Project [MarketingBudgets] class [FinanceDivisionDAO] method [storeFields] - theVO: " + theVO + " , ResultSet: " + rs);
			
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
		return new FinanceDivisionVO();
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
		FinanceDivisionVO theVO = (FinanceDivisionVO) someVO;

		try
		{
			ps.setString(1, theVO.getFinanceDivision());
		}
		catch (SQLException e)
		{
			logger.error("SQL Exception occurred - Project [MarketingBudgets] class [FinanceDivisionDAO] method [populateStatementDelete] - theVO: " + theVO + " , PreparedStatement: " + ps);
			
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
		FinanceDivisionVO theVO = (FinanceDivisionVO) someVO;

		try
		{
			ps.setString(1, theVO.getFinanceDivision());
			ps.setString(2, theVO.getDescription());
			ps.setString(3, theVO.getVatRate());
			ps.setString(4, theVO.getDisplayFlag());
		}
		catch (SQLException e)
		{
			logger.error("SQL Exception occurred - Project [MarketingBudgets] class [FinanceDivisionDAO] method [populateStatementInsert] - theVO: " + theVO + " , PreparedStatement: " + ps);
			
			
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
		FinanceDivisionVO theVO = (FinanceDivisionVO) someVO;

		try
		{
			ps.setString(1, theVO.getDescription());
			ps.setString(2, theVO.getVatRate());
			ps.setString(3, theVO.getDisplayFlag());
			
			ps.setString(4, theVO.getFinanceDivision()); // key
		}
		catch (SQLException e)
		{
			logger.error("SQL Exception occurred - Project [MarketingBudgets] class [FinanceDivisionDAO] method [populateStatementUpdate] - theVO: " + theVO + " , PreparedStatement: " + ps);
			
			e.printStackTrace();
		}

		// and populate any attributes from an audit DAO		
		return ps;
	}	
}
