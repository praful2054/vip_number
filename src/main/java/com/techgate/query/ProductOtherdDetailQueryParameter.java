package com.techgate.query;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.techgate.domain.ProductOtherDetail;

public class ProductOtherdDetailQueryParameter extends AbstractQueryParameter {

	private ProductOtherDetail productOtherDetail = null;
	
	public ProductOtherdDetailQueryParameter(ProductOtherDetail productOtherDetail) {
		this.productOtherDetail = productOtherDetail;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Class getRequiredClass() {
		return ProductOtherDetail.class;
	}

	@Override
	protected void setDeleteParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setInt(1, productOtherDetail.getProduct_id());
	}

	@Override
	protected void setInsertParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setInt(1, productOtherDetail.getProduct_id());
		prepare.setDouble(2, productOtherDetail.getRateInRupee());
		prepare.setDouble(3, productOtherDetail.getRateInDollar());
		prepare.setInt(4, productOtherDetail.getDiscount());
		prepare.setInt(5, productOtherDetail.getFlatdiscountedrate());	
		prepare.setDouble(6, productOtherDetail.getRatewhite());	
		prepare.setDouble(7, productOtherDetail.getRateivory());	
		prepare.setDouble(8, productOtherDetail.getRateblack());	
		prepare.setString(9,productOtherDetail.getUpdated_by());
		prepare.setString(10, productOtherDetail.getCreated_by());
		
	}

	@Override
	protected void setUpdateParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setDouble(1, productOtherDetail.getRateInRupee());
		prepare.setDouble(2, productOtherDetail.getRateInDollar());
		prepare.setInt(3, productOtherDetail.getDiscount());
		prepare.setInt(4, productOtherDetail.getFlatdiscountedrate());
		prepare.setDouble(5, productOtherDetail.getRatewhite());	
		prepare.setDouble(6, productOtherDetail.getRateivory());	
		prepare.setDouble(7, productOtherDetail.getRateblack());
		prepare.setString(8, productOtherDetail.getUpdated_by());
		prepare.setInt(9, productOtherDetail.getProduct_id());		
	}

	@Override
	protected void setUpdateStatusParameter(PreparedStatement prepare)
			throws SQLException {
		
	}
}
