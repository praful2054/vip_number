package com.techgate.query;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.techgate.domain.ProductImage;

public class ProductImageQueryParameter extends AbstractQueryParameter {
	
	private ProductImage productImage = null;
	
	public ProductImageQueryParameter(ProductImage productImage) {
		this.productImage = productImage;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Class getRequiredClass() {
		// TODO Auto-generated method stub
		return ProductImage.class;
	}

	@Override
	protected void setDeleteParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setInt(1, productImage.getProduct_img_id());

	}

	@Override
	protected void setInsertParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setInt(1, productImage.getProduct_id());
		prepare.setString(2, productImage.getImg_loc());
		prepare.setString(3, productImage.getImg_seq_no());
		prepare.setString(4, productImage.getImg_comment());
	}

	@Override
	protected void setUpdateParameter(PreparedStatement prepare)
			throws SQLException {
		
		prepare.setString(1, productImage.getImg_seq_no());
		prepare.setString(2, productImage.getImg_comment());
		prepare.setInt(3, productImage.getProduct_img_id());
	}

	@Override
	protected void setUpdateStatusParameter(PreparedStatement prepare)
			throws SQLException {
	}

}
