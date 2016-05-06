package com.domgen.marketingbudgets.forms;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.ValidatorForm;

import com.domgen.marketingbudgets.vo.ActionEditAuditVO;
import com.domgen.marketingbudgets.vo.ActionVO;
/**
 * Form bean for a Struts application.
 * Users may access 4 fields on this form:
 * <ul>
 * <li>status - [your comment here]
 * <li>actionChosenType - [your comment here]
 * <li>actionChosen - [your comment here]
 * <li>comments - [your comment here]
 * </ul>
 * @version 	1.0
 * @author
 */
public class ActionEditForm extends ValidatorForm {

	private ArrayList actions; 
	private ArrayList actionsID;
	private ArrayList actionAudits; 
	private ArrayList actionAuditsID;

	private String actionChosenType = null;
	private String status = null;
	private String actionChosen = null;
	private String comments = null;

	/**
	 * 
	 * @param index
	 * @return
	 */
	public ActionVO getActionsID(int index)
	{
		for (int i = actions.size(); i <= index; i++)		
		{
			actions.add(new ActionVO());
		}	
		return (ActionVO) actions.get(index);

	}
	/**
	 * 
	 * @param index
	 */
	public void setActionsID(int index, ActionVO results)
	{
		actions.add(index, results);
	}

	/**
	 * 
	 * @param index
	 * @return
	 */
	public ActionEditAuditVO getActionAuditsID(int index)
	{
		for (int i = actionAudits.size(); i <= index; i++)		
		{
			actionAudits.add(new ActionEditAuditVO());
		}	
		return (ActionEditAuditVO) actionAudits.get(index);

	}
	/**
	 * 
	 * @param index
	 */
	public void setActionAuditssID(int index, ActionEditAuditVO results)
	{
		actionAudits.add(index, results);
	}




	/**
	 * Get actionChosenType
	 * @return String
	 */
	public String getActionChosenType() {
		return actionChosenType;
	}

	/**
	 * Set actionChosenType
	 * @param <code>String</code>
	 */
	public void setActionChosenType(String a) {
		this.actionChosenType = a;
	}

	/**
	 * Get actionChosen
	 * @return String
	 */
	public String getActionChosen() {
		return actionChosen;
	}

	/**
	 * Set actionChosen
	 * @param <code>String</code>
	 */
	public void setActionChosen(String a) {
		this.actionChosen = a;
	}

	/**
	 * Get comments
	 * @return String
	 */
	public String getComments() {
		return comments;
	}

	/**
	 * Set comments
	 * @param <code>String</code>
	 */
	public void setComments(String c) {
		this.comments = c;
	}
		

	public void reset(ActionMapping mapping, HttpServletRequest request) {

		// Reset values are provided as samples only. Change as appropriate.

		actionChosenType = null;
		status = null;
		actionChosen = null;
		comments = null;
		actions = null;; 
		actionsID = null;;
		actionAudits = null;; 
		actionAuditsID = null;;

	}

	public ActionErrors validate(
		ActionMapping mapping,
		HttpServletRequest request) {

			ActionErrors errors = new ActionErrors();
			
			errors = super.validate(mapping, request);
	
				if (errors.isEmpty())
				{
					if (actionChosen.equalsIgnoreCase("confirm"))
					{

						if (status.equals(""))
						{ 
							errors.add(
									"statusError",
										new org.apache.struts.action.ActionError(
											"errors.status.notSelected"));
						}
						if (comments.equals(""))
						{ 
								errors.add(
										"commentsError",
											new org.apache.struts.action.ActionError(
												"errors.comments.notSelected"));
						}
					}

				}
	
				return errors;


	}
	/**
	 * @return
	 */
	public ArrayList getActionAudits() {
		return actionAudits;
	}

	/**
	 * @return
	 */
	public ArrayList getActions() {
		return actions;
	}

	/**
	 * @return
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param list
	 */
	public void setActions(ArrayList list) {
		actions = list;
	}
	
	/**
	 * @param string
	 */
	public void setStatus(String string) {
		status = string;
	}

}