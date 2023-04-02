package com.techgate.query;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.techgate.domain.OrderTransactionShipping;

public class OrderTransactionShippingQueryParameter extends
		AbstractQueryParameter {
	
	private OrderTransactionShipping orderTransactionShipping = null;

	public OrderTransactionShippingQueryParameter(OrderTransactionShipping orderTransactionShipping) {
		this.orderTransactionShipping = orderTransactionShipping;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Class getRequiredClass() {
		return OrderTransactionShipping.class;
	}

	@Override
	protected void setDeleteParameter(PreparedStatement prepare)
			throws SQLException {
	}

	@Override
	protected void setInsertParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setInt(1, orderTransactionShipping.getOrder_id());
		prepare.setString(2, orderTransactionShipping.getFirstName());
		prepare.setString(3, orderTransactionShipping.getLastName());
		prepare.setString(4, orderTransactionShipping.getContactNo1());
		prepare.setString(5, orderTransactionShipping.getContactNo2());
		prepare.setString(6, orderTransactionShipping.getAddress());
		prepare.setString(7, orderTransactionShipping.getCountry());
		prepare.setString(8, orderTransactionShipping.getState());
		prepare.setString(9, orderTransactionShipping.getCity());
		prepare.setString(10, orderTransactionShipping.getPincode());

	}

	@Override
	protected void setUpdateParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setString(1, orderTransactionShipping.getFirstName());
		prepare.setString(2, orderTransactionShipping.getLastName());
		prepare.setString(3, orderTransactionShipping.getContactNo1());
		prepare.setString(4, orderTransactionShipping.getContactNo2());
		prepare.setString(5, orderTransactionShipping.getAddress());
		prepare.setString(6, orderTransactionShipping.getCountry());
		prepare.setString(7, orderTransactionShipping.getState());
		prepare.setString(8, orderTransactionShipping.getCity());
		prepare.setString(9, orderTransactionShipping.getPincode());
		prepare.setInt(10, orderTransactionShipping.getOrder_id());

	}

	@Override
	protected void setUpdateStatusParameter(PreparedStatement prepare)
			throws SQLException {
		// TODO Auto-generated method stub

	}

}
