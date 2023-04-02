package com.techgate.query;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.techgate.domain.ShippingDetails;


public class ShippingDetailQueryParameter extends AbstractQueryParameter {

	private ShippingDetails shippingDetails = null;
	
	public ShippingDetailQueryParameter(ShippingDetails shippingotherDetails) {
		this.shippingDetails = shippingotherDetails;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Class getRequiredClass() {
		return ShippingDetails.class;
	}

	@Override
	protected void setDeleteParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setInt(1, shippingDetails.getOrderId());
	}

	@Override
	protected void setInsertParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setInt(1, shippingDetails.getOrderId());
		prepare.setString(2, shippingDetails.getCourierName());
		prepare.setInt(3, shippingDetails.getTrackingNo());	
	}

	@Override
	protected void setUpdateParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setString(1, shippingDetails.getCourierName());
		prepare.setInt(2, shippingDetails.getTrackingNo());
		prepare.setInt(3, shippingDetails.getOrderId());	
	}

	@Override
	protected void setUpdateStatusParameter(PreparedStatement prepare)
			throws SQLException {
		
	}
}
