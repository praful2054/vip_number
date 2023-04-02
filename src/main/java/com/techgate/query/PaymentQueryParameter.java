package com.techgate.query;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.techgate.domain.OrderPaymentDetail;

public class PaymentQueryParameter extends AbstractQueryParameter {

	private OrderPaymentDetail orderPaymentDetail = null;
	
	public PaymentQueryParameter(OrderPaymentDetail orderPaymentDetail) {
		this.orderPaymentDetail = orderPaymentDetail;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Class getRequiredClass() {
		// TODO Auto-generated method stub
		return OrderPaymentDetail.class;
	}

	@Override
	protected void setDeleteParameter(PreparedStatement prepare)
			throws SQLException {
	}

	@Override
	protected void setInsertParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setString(1, orderPaymentDetail.getTracking_id());
		prepare.setString(2, orderPaymentDetail.getAmount());
		prepare.setString(3, orderPaymentDetail.getOrderid());
		prepare.setString(4, orderPaymentDetail.getEmail());
		prepare.setString(5, orderPaymentDetail.getStatus());
		prepare.setString(6, orderPaymentDetail.getBank_ref_no());
		prepare.setString(7, orderPaymentDetail.getPayment_mode());
		prepare.setString(8, orderPaymentDetail.getCard_name());
		prepare.setString(9, orderPaymentDetail.getStatus_code());
		prepare.setString(10, orderPaymentDetail.getStatus_message());
		prepare.setString(11, orderPaymentDetail.getResponse_code());
		prepare.setString(12, orderPaymentDetail.getFailure_message());
		prepare.setString(13, orderPaymentDetail.getPayment_date());
		prepare.setString(14, orderPaymentDetail.getApprove());
		
	}

	@Override
	protected void setUpdateParameter(PreparedStatement prepare)
			throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	protected void setUpdateStatusParameter(PreparedStatement prepare)
			throws SQLException {
		// TODO Auto-generated method stub

	}

}
