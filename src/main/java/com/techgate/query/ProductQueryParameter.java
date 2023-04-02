package com.techgate.query;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.techgate.domain.Product;

public class ProductQueryParameter extends AbstractQueryParameter {

	private Product product = null;
	
	public ProductQueryParameter(Product product) {
		this.product = product;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Class getRequiredClass() {
		return Product.class;
	}

	@Override
	protected void setDeleteParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setInt(1, product.getProduct_id());
	}

	@Override
	protected void setInsertParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setInt(1, product.getCate_id());
		prepare.setString(2, product.getProductName());
		prepare.setString(3, product.getNatureOfProduct());
		prepare.setString(4, product.getIndication());
		prepare.setString(5, product.getUseDirection());
		prepare.setString(6, product.getPacking());
		prepare.setString(7, product.getDescript());
		prepare.setString(8, product.getVegProduct());
		prepare.setString(9, product.getAdditinalDescription());
		prepare.setString(10, product.getType());
		prepare.setString(11, product.getStatus());
		prepare.setString(12, product.getProductCode());
		prepare.setString(13, product.getProductBrand());
		prepare.setString(14, product.getProductColor());
		prepare.setString(15, product.getSizeheight());
		prepare.setString(16, product.getSizelength());
		prepare.setString(17, product.getLiters());
		prepare.setString(18, product.getTrap());
		prepare.setString(19, product.getUpdated_by());
		prepare.setString(20, product.getCreated_by());
		prepare.setInt(21, product.getVendor_id());
		prepare.setString(22, product.getRecharge_validity());
		prepare.setString(23, product.getNumber_status());
		prepare.setString(24, product.getLastCall());
		prepare.setString(25, product.getNextCall());
		prepare.setString(26, product.getNumber());
		prepare.setString(27, product.getBuyerName());
		prepare.setString(28, product.getCurrentNumber());
		prepare.setString(29, product.getBuyerContact());
		prepare.setString(30, product.getFileID());
		prepare.setString(31, product.getComments());
		
	}

	@Override
	protected void setUpdateParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setInt(1, product.getCate_id());
		prepare.setString(2, product.getProductName());
		prepare.setString(3, product.getNatureOfProduct());
		prepare.setString(4, product.getIndication());
		prepare.setString(5, product.getUseDirection());
		prepare.setString(6, product.getPacking());
		prepare.setString(7, product.getDescript());
		prepare.setString(8, product.getVegProduct());
		prepare.setString(9, product.getAdditinalDescription());
		prepare.setString(10, product.getType());
		prepare.setString(11, product.getProductCode());
		prepare.setString(12, product.getProductBrand());
		prepare.setString(13, product.getProductColor());
		prepare.setString(14, product.getSizeheight());
		prepare.setString(15, product.getSizelength());
		prepare.setString(16, product.getLiters());
		prepare.setString(17, product.getTrap());
		prepare.setString(18, product.getUpdated_by());
		prepare.setString(19, product.getRecharge_validity());
		prepare.setString(20, product.getLastCall());
		prepare.setString(21, product.getNextCall());
		prepare.setString(22, product.getNumber());
		prepare.setString(23, product.getBuyerName());
		prepare.setString(24, product.getCurrentNumber());
		prepare.setString(25, product.getStatus());
		prepare.setString(26, product.getBuyerContact());
		prepare.setString(27, product.getComments());
		prepare.setInt(28, product.getVendor_id());
		prepare.setInt(29, product.getProduct_id());
		
	
	}

	@Override
	protected void setUpdateStatusParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setString(1, product.getStatus());
		prepare.setInt(2, product.getCate_id());
	}
}
