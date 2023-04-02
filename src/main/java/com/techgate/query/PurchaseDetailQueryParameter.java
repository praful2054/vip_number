package com.techgate.query;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.techgate.domain.PurchaseDetails;

public class PurchaseDetailQueryParameter extends AbstractQueryParameter{

	private PurchaseDetails purchaseDetails = null;
	
	public PurchaseDetailQueryParameter(PurchaseDetails purchaseDetails) {
		this.purchaseDetails = purchaseDetails;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Class getRequiredClass() {
		return PurchaseDetails.class;
	}

	@Override
	protected void setDeleteParameter(PreparedStatement prepare)
			throws SQLException {
	}

	@Override
	protected void setInsertParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setInt(1, purchaseDetails.getOrderId());
		prepare.setInt(2, purchaseDetails.getProduct_id());
		prepare.setInt(3, purchaseDetails.getQty());
		prepare.setDouble(4, purchaseDetails.getProductprice());
		prepare.setDouble(5, purchaseDetails.getNetAmount());
	}

	@Override
	protected void setUpdateParameter(PreparedStatement prepare)
			throws SQLException {
	}

	@Override
	protected void setUpdateStatusParameter(PreparedStatement prepare)
			throws SQLException {
	}

	
}
