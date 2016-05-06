/*
 * Created on 26-Sep-05
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.domgen.marketingbudgets.vo;
import com.domgen.data.common.vo.IBaseVO;
/**
 * @author gatlanm
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class ActionDisplaySeachSortVO implements IBaseVO{
	
		private String accountName;
		private String accountHandler;
		private String accountManager;
		private String createdDateFrom;
		private String createdDateTo;
		private String status;
		private String sortBy;
	
		/**
		 * @return
		 */
		public String getAccountHandler() {
			return accountHandler;
		}

		/**
		 * @return
		 */
		public String getAccountManager() {
			return accountManager;
		}

		/**
		 * @return
		 */
		public String getAccountName() {
			return accountName;
		}

		/**
		 * @return
		 */
		public String getCreatedDateFrom() {
			return createdDateFrom;
		}

		/**
		 * @return
		 */
		public String getCreatedDateTo() {
			return createdDateTo;
		}

		/**
		 * @return
		 */
		public String getStatus() {
			return status;
		}

		/**
		 * @param string
		 */
		public void setAccountHandler(String string) {
			accountHandler = string;
		}

		/**
		 * @param string
		 */
		public void setAccountManager(String string) {
			accountManager = string;
		}

		/**
		 * @param string
		 */
		public void setAccountName(String string) {
			accountName = string;
		}

		/**
		 * @param string
		 */
		public void setCreatedDateFrom(String string) {
			createdDateFrom = string;
		}

		/**
		 * @param string
		 */
		public void setCreatedDateTo(String string) {
			createdDateTo = string;
		}

		/**
		 * @param string
		 */
		public void setStatus(String string) {
			status = string;
		}

		/**
		 * @return
		 */
		public String getSortBy() {
			return sortBy;
		}

		/**
		 * @param string
		 */
		public void setSortBy(String string) {
			sortBy = string;
		}

}
