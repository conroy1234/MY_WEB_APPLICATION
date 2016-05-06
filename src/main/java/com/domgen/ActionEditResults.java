/*
 * Created on 27-Sep-05
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.domgen.marketingbudgets.results;
import java.util.List;
/**
 * @author gatlanm
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class ActionEditResults {
		
		private List actions;
		private List actionAudits;
		private String totalActions;
		private String accountName;
		private String userRole;

		/**
		 * @return
		 */
		public String getAccountName() {
			return accountName;
		}

		/**
		 * @return
		 */
		public List getActions() {
			return actions;
		}

		/**
		 * @return
		 */
		public String getTotalActions() {
			return totalActions;
		}

		/**
		 * @param string
		 */
		public void setAccountName(String string) {
			accountName = string;
		}

		/**
		 * @param list
		 */
		public void setActions(List list) {
			actions = list;
		}

		/**
		 * @param string
		 */
		public void setTotalActions(String string) {
			totalActions = string;
		}

		/**
		 * @return
		 */
		public List getActionAudits() {
			return actionAudits;
		}

		/**
		 * @param list
		 */
		public void setActionAudits(List list) {
			actionAudits = list;
		}

		/**
		 * @return
		 */
		public String getUserRole() {
			return userRole;
		}

		/**
		 * @param string
		 */
		public void setUserRole(String string) {
			userRole = string;
		}

}
