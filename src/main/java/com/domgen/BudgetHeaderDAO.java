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
import com.domgen.marketingbudgets.vo.BudgetHeaderVO;


/**
 * Data Access Object for the Budget Header
 *  
 * @version	1.0
 * @author 	SIMMR on 04-Jul-05
 */
public class BudgetHeaderDAO extends BaseDAO implements ISelect, IDelete, IInsert, IUpdate
{
	private SelectDAOHelper selectHelper = new SelectDAOHelper (this);
	private InsertDAOHelper insertHelper = new InsertDAOHelper (this);
	private DeleteDAOHelper deleteHelper = new DeleteDAOHelper (this);
	private UpdateDAOHelper updateHelper = new UpdateDAOHelper (this);
	
	private static final String TABLE = "SCHDAYFILF.MBBDGTHD";
	private static final String KEY_FIELDS[] = {"MBACCN"};
	private static final String ATTRIBUTE_FIELDS[] = {"MBCPRD", 
														"MBPPRD", 
														"MBACCM", 
														"MBACCH", 
														"MBAGDT", 
														"MBMGEN", 
														"MBMPAD", 
														"MBSMAR", 														
														"MBSTAT",
														"MBCFYF",
														"MBCFMF",
														"MBCFYT",
														"MBCFMT",
														"MBBEDT",};
	private List keyFieldsList = null;
	private List attributeFieldsList = null;
											  
	/**
	 * Constructor, establishing that the related table lies within the
	 * campaign database 
	 *
	 */
	public BudgetHeaderDAO() 
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
		BudgetHeaderVO theVO = (BudgetHeaderVO)someVO;
		
		try
		{
			// store key fields
			theVO.setAccountName (rs.getString(KEY_FIELDS[0]));
			
			// store attribute fields
			theVO.setCurrentPeriod (rs.getString(ATTRIBUTE_FIELDS[0]));
			theVO.setPreviousPeriod (rs.getString(ATTRIBUTE_FIELDS[1]));
			theVO.setAccountManager (rs.getString(ATTRIBUTE_FIELDS[2]));
			theVO.setAccountHandler (rs.getString(ATTRIBUTE_FIELDS[3]));
			theVO.setAgreedTotal (rs.getString(ATTRIBUTE_FIELDS[4]));
			theVO.setMonthlyGenerated (rs.getString(ATTRIBUTE_FIELDS[5]));
			theVO.setMonthlyPaid (rs.getString(ATTRIBUTE_FIELDS[6]));
			theVO.setSmaReference (rs.getString(ATTRIBUTE_FIELDS[7]).trim());
			theVO.setStatus (rs.getString(ATTRIBUTE_FIELDS[8]));
			theVO.setClientFinYearFromYear(rs.getString(ATTRIBUTE_FIELDS[9]));
			theVO.setClientFinYearFromMonth(rs.getString(ATTRIBUTE_FIELDS[10]));
			theVO.setClientFinYearToYear(rs.getString(ATTRIBUTE_FIELDS[11]));
			theVO.setClientFinYearToMonth(rs.getString(ATTRIBUTE_FIELDS[12]));
			theVO.setBudgetExpiryDate(rs.getString(ATTRIBUTE_FIELDS[13]));
		}
		catch (SQLException e)
		{
			logger.error("SQL Exception occurred - Project [MarketingBudgets] class [BudgetHeaderDAO] method [storeFields] - theVO: " + theVO + " , ResultSet: " + rs);
			
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
		return new BudgetHeaderVO();
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
		BudgetHeaderVO theVO = (BudgetHeaderVO) someVO;

		try
		{
			ps.setString(1, theVO.getAccountName());
		}
		catch (SQLException e)
		{
			logger.error("SQL Exception occurred - Project [MarketingBudgets] class [BudgetHeaderDAO] method [populateStatementDelete] - theVO: " + theVO + " , PreparedStatement: " + ps);
			
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
		BudgetHeaderVO theVO = (BudgetHeaderVO) someVO;

		try
		{
			ps.setString(1, theVO.getAccountName());
			ps.setString(2, theVO.getCurrentPeriod());
			ps.setString(3, theVO.getPreviousPeriod());
			ps.setString(4, theVO.getAccountManager());
			ps.setString(5, theVO.getAccountHandler());
			ps.setString(6, theVO.getAgreedTotal());
			ps.setString(7, theVO.getMonthlyGenerated());
			ps.setString(8, theVO.getMonthlyPaid());
			ps.setString(9, theVO.getSmaReference());
			ps.setString(10, theVO.getStatus());
			ps.setString(11, theVO.getClientFinYearFromYear());
			ps.setString(12, theVO.getClientFinYearFromMonth());
			ps.setString(13, theVO.getClientFinYearToYear());
			ps.setString(14, theVO.getClientFinYearToMonth());
			ps.setString(15, theVO.getBudgetExpiryDate());
		}
		catch (SQLException e)
		{
			logger.error("SQL Exception occurred - Project [MarketingBudgets] class [BudgetHeaderDAO] method [populateStatementInsert] - theVO: " + theVO + " , PreparedStatement: " + ps);
			
			
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
		BudgetHeaderVO theVO = (BudgetHeaderVO) someVO;

		try
		{
			ps.setString(1, theVO.getCurrentPeriod());
			ps.setString(2, theVO.getPreviousPeriod());
			ps.setString(3, theVO.getAccountManager());
			ps.setString(4, theVO.getAccountHandler());
			ps.setString(5, theVO.getAgreedTotal());
			ps.setString(6, theVO.getMonthlyGenerated());
			ps.setString(7, theVO.getMonthlyPaid());
			ps.setString(8, theVO.getSmaReference());
			ps.setString(9, theVO.getStatus());
			ps.setString(10, theVO.getClientFinYearFromYear());
			ps.setString(11, theVO.getClientFinYearFromMonth());
			ps.setString(12, theVO.getClientFinYearToYear());
			ps.setString(13, theVO.getClientFinYearToMonth());
			ps.setString(14, theVO.getBudgetExpiryDate());
			
			ps.setString(15, theVO.getAccountName()); // key
		}
		catch (SQLException e)
		{
			logger.error("SQL Exception occurred - Project [MarketingBudgets] class [BudgetHeaderDAO] method [populateStatementUpdate] - theVO: " + theVO + " , PreparedStatement: " + ps);
			
			e.printStackTrace();
		}

		// and populate any attributes from an audit DAO		
		return ps;
	}	
}
