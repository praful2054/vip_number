package com.techgate.query;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.techgate.domain.OrderTransaction;

public class OrderTransactionQueryParameter extends AbstractQueryParameter{

	private OrderTransaction orderTransaction = null;
	
	public OrderTransactionQueryParameter(OrderTransaction orderTransaction) {
		this.orderTransaction = orderTransaction;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Class getRequiredClass() {
		return OrderTransaction.class;
	}

	@Override
	protected void setDeleteParameter(PreparedStatement prepare)
			throws SQLException {
	}

	@Override
	protected void setInsertParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setInt(1, orderTransaction.getCust_id());
		prepare.setString(2, orderTransaction.getOrderPlacedDate());
		prepare.setDouble(3, orderTransaction.getOrderTotal());
		prepare.setDouble(4, orderTransaction.getShippingCharge());
		prepare.setString(5, orderTransaction.getCurrency());
		prepare.setString(6, orderTransaction.getPaymentStatus());
		prepare.setString(7, orderTransaction.getEmp_id());
		prepare.setString(8, orderTransaction.getChannel());
		prepare.setString(9, orderTransaction.getGstin());
	}

	@Override
	protected void setUpdateParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setInt(1, orderTransaction.getOrderId());
	}

	@Override
	protected void setUpdateStatusParameter(PreparedStatement prepare)
			throws SQLException {		
	}

	
}
