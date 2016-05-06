package com.domgen.marketingbudgets.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
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
import com.domgen.marketingbudgets.vo.InvoiceBudgetVO;
//import com.domgen.utilities.data.DGDate;

/**
 * Data Access Object for the VIEW Unauthorsed Invoices
 *  
 * @version	1.0
 * @author 	SIMMR on 13-Jul-05
 */
public class InvoiceBudgetUwDAO extends BaseDAO implements ISelect, IDelete, IInsert, IUpdate
{
	private SelectDAOHelper selectHelper = new SelectDAOHelper (this);
	private InsertDAOHelper insertHelper = new InsertDAOHelper (this);
	private DeleteDAOHelper deleteHelper = new DeleteDAOHelper (this);
	private UpdateDAOHelper updateHelper = new UpdateDAOHelper (this);
	
	private static final String TABLE = "SCHDAYFILF.MBUNAUTHUW";
	private static final String KEY_FIELDS[] = {"MBACCN",
												  "MBIVID",
												  "MBIVLN"};
	private static final String ATTRIBUTE_FIELDS[] = {"MBSMAR", 
														"MBACCH",
														"MBACCM",
														"MBAMON",
														"MBSTAT",
														"MBAMED",
														"MBPAYT",														
														"MBIPMM",		
														"MBIPYY",
														"MBNETA",
														"MBVATA",	
														"MBGROS",				
														"MBSTA1", 
														"MBORGL", 
														"MBIVNO",
														"MBIVDT", 
														"MBEDAT", 
														"MBAPPF", 
														"MBSSAP", 	
														"MBUWAP", 
														"MBTERR",
														"MBFNDV",
														"MBRBYO",
														"MBIPYM"};
	private List keyFieldsList = null;
	private List attributeFieldsList = null;
											  
	/**
	 * Constructor, establishing that the related table lies within the
	 * campaign database 
	 *
	 */
	public InvoiceBudgetUwDAO() 
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
		InvoiceBudgetVO theVO = (InvoiceBudgetVO)someVO;
		
		try
		{
			// store key fields
			theVO.setAccountName (rs.getString(KEY_FIELDS[0]).trim());
			theVO.setInvoiceId (rs.getString(KEY_FIELDS[1]));
			theVO.setInvoiceLineNo (rs.getString(KEY_FIELDS[2]));
			
			// store attribute fields
			theVO.setSmaReference (rs.getString(ATTRIBUTE_FIELDS[0]));
			theVO.setAccountHandler (rs.getString(ATTRIBUTE_FIELDS[1]));
			theVO.setAccountManager (rs.getString(ATTRIBUTE_FIELDS[2]));
			theVO.setMonthlyAgreed (rs.getString(ATTRIBUTE_FIELDS[3]));
			theVO.setBudgetLineStatus (rs.getString(ATTRIBUTE_FIELDS[4]));
			theVO.setAmendmentFlag (rs.getString(ATTRIBUTE_FIELDS[5]));
			theVO.setPaymentType (rs.getString(ATTRIBUTE_FIELDS[6]));
			theVO.setInvoiceMonth (rs.getString(ATTRIBUTE_FIELDS[7]));
			theVO.setInvoiceYear (rs.getString(ATTRIBUTE_FIELDS[8]).trim());
			theVO.setAmountNet (rs.getString(ATTRIBUTE_FIELDS[9]));
			theVO.setAmountVat (rs.getString(ATTRIBUTE_FIELDS[10]));
			theVO.setAmountGross (rs.getString(ATTRIBUTE_FIELDS[11]));
			theVO.setInvoiceLineStatus (rs.getString(ATTRIBUTE_FIELDS[12]));	
			theVO.setNumberOfLines (rs.getString(ATTRIBUTE_FIELDS[13]));
			theVO.setInvoiceNo(rs.getString(ATTRIBUTE_FIELDS[14]));
			theVO.setInvoiceDate (rs.getString(ATTRIBUTE_FIELDS[15]));
			theVO.setEntryDate (rs.getString(ATTRIBUTE_FIELDS[16]));
			theVO.setApprovalFlag (rs.getString(ATTRIBUTE_FIELDS[17]));
			theVO.setApproverSalesSupport (rs.getString(ATTRIBUTE_FIELDS[18]));
			theVO.setApproverUnderwriting (rs.getString(ATTRIBUTE_FIELDS[19]));
			theVO.setTransferError (rs.getString(ATTRIBUTE_FIELDS[20]));
			theVO.setFinanceDivision (rs.getString(ATTRIBUTE_FIELDS[21]));
			theVO.setRejectedByOriginal(rs.getString(ATTRIBUTE_FIELDS[22]));
			theVO.setInvoicePeriodYearMonth(rs.getString(ATTRIBUTE_FIELDS[23]));
			//format
			StatusCodesText statusCodesText = new StatusCodesText();
			if (rs.getString(ATTRIBUTE_FIELDS[4]) != null)
			{
			theVO.setBudgetLineStatusText(statusCodesText.getBudgetLineStatusCodeText(rs.getString(ATTRIBUTE_FIELDS[4])));
			}
			else
			{
				theVO.setBudgetLineStatusText("");
			}
			theVO.setInvoiceLineStatusText (statusCodesText.getInvoiceLineStatusCodeText(rs.getString(ATTRIBUTE_FIELDS[12])));	
			theVO.setInvoiceIdLineNo(rs.getString(KEY_FIELDS[1]) + rs.getString(KEY_FIELDS[2]));	
			try {
					//DGDate date = new DGDate();
					//theVO.setEntryDateFormatted(date.convertAS400DateToStringDate(Long.parseLong(rs.getString(ATTRIBUTE_FIELDS[16]))));			
				}
				catch (Exception e)
				{
					e.printStackTrace();
				}
			double invoiceGross = 0;
			double invoiceNet = 0;
			double agreed = 0;
			if (rs.getString(ATTRIBUTE_FIELDS[11]) != null)
			{
				invoiceGross = Double.valueOf(rs.getString(ATTRIBUTE_FIELDS[11])).doubleValue();
			}
			if (rs.getString(ATTRIBUTE_FIELDS[9]) != null)
			{
				invoiceNet = Double.valueOf(rs.getString(ATTRIBUTE_FIELDS[9])).doubleValue();
			}
			if (rs.getString(ATTRIBUTE_FIELDS[3]) != null)
			{
				agreed = Double.valueOf(rs.getString(ATTRIBUTE_FIELDS[3])).doubleValue();
			}
			double invoiceNetMinusAgreed = invoiceNet - agreed;
			double invoiceGrossMinusAgreed = invoiceGross - agreed;
			if (invoiceNetMinusAgreed == 0)
			{
				theVO.setInvoiceNetMinusAgreed("0.00");
			}
			else
			{				
				DecimalFormat form = new DecimalFormat ("#0.00");
				String formattedValue = form.format (invoiceNetMinusAgreed);
				theVO.setInvoiceNetMinusAgreed(formattedValue);
			}
			if (invoiceGrossMinusAgreed == 0)
			{
				theVO.setInvoiceGrossMinusAgreed("0.00");
			}
			else
			{				
				DecimalFormat form = new DecimalFormat ("#0.00");
				String formattedValue = form.format (invoiceGrossMinusAgreed);
				theVO.setInvoiceGrossMinusAgreed(formattedValue);
			}

		}
		catch (SQLException e)
		{
			logger.error("SQL Exception occurred - Project [MarketingBudgets] class [UnauthorisedInvoicesDAO] method [storeFields] - theVO: " + theVO + " , ResultSet: " + rs);
			
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
		return new InvoiceBudgetVO();
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
		InvoiceBudgetVO theVO = (InvoiceBudgetVO) someVO;

		try
		{
			ps.setString(1, theVO.getAccountName());
			ps.setString(2, theVO.getInvoiceId());
			ps.setString(3, theVO.getInvoiceLineNo());
		}
		catch (SQLException e)
		{
			logger.error("SQL Exception occurred - Project [MarketingBudgets] class [UnauthorisedInvoicesDAO] method [populateStatementDelete] - theVO: " + theVO + " , PreparedStatement: " + ps);
			
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
		InvoiceBudgetVO theVO = (InvoiceBudgetVO) someVO;

		try
		{
			ps.setString(1, theVO.getAccountName());
			ps.setString(2, theVO.getSmaReference());
			ps.setString(3, theVO.getAccountHandler());
			ps.setString(4, theVO.getAccountManager());
			ps.setString(5, theVO.getMonthlyAgreed());
			ps.setString(6, theVO.getBudgetLineStatus());
			ps.setString(7, theVO.getAmendmentFlag());
			ps.setString(8, theVO.getInvoiceId());
			ps.setString(9, theVO.getInvoiceLineNo());
			ps.setString(10, theVO.getPaymentType());
			ps.setString(11, theVO.getInvoiceMonth());
			ps.setString(12, theVO.getInvoiceYear());
			ps.setString(13, theVO.getAmountNet());
			ps.setString(14, theVO.getAmountVat());
			ps.setString(15, theVO.getAmountGross());
			ps.setString(16, theVO.getInvoiceLineStatus());			
			ps.setString(17, theVO.getNumberOfLines());
			ps.setString(18, theVO.getInvoiceNo());
			ps.setString(19, theVO.getInvoiceDate());
			ps.setString(20, theVO.getEntryDate());	
			ps.setString(21, theVO.getApprovalFlag());
			ps.setString(22, theVO.getApproverSalesSupport());
			ps.setString(23, theVO.getApproverUnderwriting());	
			ps.setString(24, theVO.getTransferError());
			ps.setString(25, theVO.getFinanceDivision());
			ps.setString(26, theVO.getRejectedByOriginal());
			ps.setString(27, theVO.getInvoicePeriodYearMonth());
		}
		catch (SQLException e)
		{
			logger.error("SQL Exception occurred - Project [MarketingBudgets] class [UnauthorisedInvoicesDAO] method [populateStatementInsert] - theVO: " + theVO + " , PreparedStatement: " + ps);
			
			
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
		InvoiceBudgetVO theVO = (InvoiceBudgetVO) someVO;

		try
		{
			ps.setString(1, theVO.getSmaReference());
			ps.setString(2, theVO.getAccountHandler());
			ps.setString(3, theVO.getAccountManager());
			ps.setString(4, theVO.getMonthlyAgreed());
			ps.setString(5, theVO.getBudgetLineStatus());
			ps.setString(6, theVO.getAmendmentFlag());
			ps.setString(7, theVO.getPaymentType());
			ps.setString(8, theVO.getInvoiceMonth());
			ps.setString(9, theVO.getInvoiceYear());
			ps.setString(10, theVO.getAmountNet());
			ps.setString(11, theVO.getAmountVat());
			ps.setString(12, theVO.getAmountGross());
			ps.setString(13, theVO.getInvoiceLineStatus());			
			ps.setString(14, theVO.getNumberOfLines());
			ps.setString(15, theVO.getInvoiceNo());
			ps.setString(16, theVO.getInvoiceDate());
			ps.setString(17, theVO.getEntryDate());	
			ps.setString(18, theVO.getApprovalFlag());
			ps.setString(19, theVO.getApproverSalesSupport());
			ps.setString(20, theVO.getApproverUnderwriting());	
			ps.setString(21, theVO.getTransferError());
			ps.setString(22, theVO.getFinanceDivision());
			ps.setString(23, theVO.getRejectedByOriginal());
			ps.setString(24, theVO.getInvoicePeriodYearMonth());
				
			ps.setString(25, theVO.getAccountName()); // key
			ps.setString(26, theVO.getInvoiceId());
			ps.setString(27, theVO.getInvoiceLineNo());
		}
		catch (SQLException e)
		{
			logger.error("SQL Exception occurred - Project [MarketingBudgets] class [UnauthorisedInvoicesDAO] method [populateStatementUpdate] - theVO: " + theVO + " , PreparedStatement: " + ps);
			
			e.printStackTrace();
		}

		// and populate any attributes from an audit DAO		
		return ps;
	}	
}
