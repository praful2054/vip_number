package com.techgate.query;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.techgate.domain.CustomerLoginDetail;

public class CustomerLoginQueryParameter extends AbstractQueryParameter {

	private CustomerLoginDetail customerLoginDetail = null;
	
	public CustomerLoginQueryParameter(CustomerLoginDetail customerLoginDetail) {
		this.customerLoginDetail = customerLoginDetail;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Class getRequiredClass() {
		return CustomerLoginDetail.class;
	}

	@Override
	protected void setDeleteParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setInt(1, customerLoginDetail.getCust_id());
	}

	@Override
	protected void setInsertParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setString(1, customerLoginDetail.getEmailid());
		prepare.setString(2, customerLoginDetail.getPassword());
		prepare.setString(3, customerLoginDetail.getForgetpasswordquestion());
		prepare.setString(4, customerLoginDetail.getAnswer());
	}

	@Override
	protected void setUpdateParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setString(1, customerLoginDetail.getEmailid());
		prepare.setString(2, customerLoginDetail.getPassword());
		prepare.setString(3, customerLoginDetail.getForgetpasswordquestion());
		prepare.setString(4, customerLoginDetail.getAnswer());
		prepare.setInt(5, customerLoginDetail.getCust_id());

	}

	@Override
	protected void setUpdateStatusParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setString(1, customerLoginDetail.getStatus());
		prepare.setInt(2, customerLoginDetail.getCust_id());
	}

}
