package com.techgate.query;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.techgate.domain.CustomerAddressDetails;

public class CustomerAddressQueryParameter extends AbstractQueryParameter {

	private CustomerAddressDetails customerAddressDetails = null;
	
	public CustomerAddressQueryParameter(CustomerAddressDetails customerAddressDetails) {
		this.customerAddressDetails = customerAddressDetails;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Class getRequiredClass() {
		return CustomerAddressDetails.class;
	}

	@Override
	protected void setDeleteParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setInt(1, customerAddressDetails.getId());
	}

	@Override
	protected void setInsertParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setInt(1, customerAddressDetails.getCust_id());
		prepare.setString(2, customerAddressDetails.getFirstName());
		prepare.setString(3, customerAddressDetails.getLastName());
		prepare.setString(4, customerAddressDetails.getContactNo1());
		prepare.setString(5, customerAddressDetails.getContactNo2());
		prepare.setString(6, customerAddressDetails.getAddress());
		prepare.setString(7, customerAddressDetails.getCountry());
		prepare.setString(8, customerAddressDetails.getState());
		prepare.setString(9, customerAddressDetails.getCity());
		prepare.setString(10, customerAddressDetails.getPincode());
		prepare.setString(11, customerAddressDetails.getCompanyName());
		prepare.setString(12, customerAddressDetails.getGstinNO());
	}

	@Override
	protected void setUpdateParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setString(1, customerAddressDetails.getFirstName());
		prepare.setString(2, customerAddressDetails.getLastName());
		prepare.setString(3, customerAddressDetails.getContactNo1());
		prepare.setString(4, customerAddressDetails.getContactNo2());
		prepare.setString(5, customerAddressDetails.getAddress());
		prepare.setString(6, customerAddressDetails.getCountry());
		prepare.setString(7, customerAddressDetails.getState());
		prepare.setString(8, customerAddressDetails.getCity());
		prepare.setString(9, customerAddressDetails.getPincode());
		prepare.setString(10, customerAddressDetails.getCompanyName());
		prepare.setString(11, customerAddressDetails.getGstinNO());
		prepare.setInt(12, customerAddressDetails.getCust_id());
	}

	@Override
	protected void setUpdateStatusParameter(PreparedStatement prepare)
			throws SQLException {
	}
}
