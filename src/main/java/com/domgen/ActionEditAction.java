package com.domgen.marketingbudgets.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.domgen.marketingbudgets.as.ActionEditAS;
import com.domgen.marketingbudgets.forms.ActionEditForm;
import com.domgen.marketingbudgets.results.NavResults;
/**
 * @version 	1.0
 * @author
 */
public class ActionEditAction extends Action {

	public ActionForward execute(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response)
		throws Exception {

		ActionErrors errors = new ActionErrors();
		ActionForward forward = new ActionForward(); // return value
		ActionEditForm actionEditForm = (ActionEditForm) form;

		try {
				HttpSession session = request.getSession();
			
				// set up application service
				ActionEditAS actionEditAs = new ActionEditAS();

				if (actionEditForm.getActionChosenType().equals("nav"))
				{		
					actionEditAs.processNav(actionEditForm.getActionChosen(), actionEditForm, request.getSession());
			
				} else {			

					if (actionEditForm.getActionChosen().equals("confirm"))	
					{
						NavResults navResults = actionEditAs.process(actionEditForm.getActionChosen(), actionEditForm, session);
		
							// add view object to session
							session.setAttribute("navResults", navResults);	

					}

				}

			} catch (Exception e) {

				// Report the error using the appropriate name and ID.
				errors.add("name", new ActionError("id"));

			}

			// If a message is required, save the specified key(s)
			// into the request for use by the <struts:errors> tag.

			if (!errors.isEmpty())
			{
				saveErrors(request, errors);
				forward = mapping.findForward("error");
			}
			else
			{
			// Write logic determining how the user should be forwarded.
				forward = mapping.findForward(actionEditForm.getActionChosen());
			}
			// Finish with
			return (forward);

	}
}