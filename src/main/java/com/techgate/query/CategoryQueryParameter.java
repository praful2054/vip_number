package com.techgate.query;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.techgate.domain.Category;
import com.techgate.query.AbstractQueryParameter;

public class CategoryQueryParameter extends AbstractQueryParameter {

	private Category categories = null;

	public CategoryQueryParameter(Category categories) {
		this.categories = categories;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Class getRequiredClass() {
		return Category.class;
	}

	@Override
	protected void setDeleteParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setInt(1, categories.getCate_id());
		
	}

	@Override
	protected void setInsertParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setInt(1, categories.getCate_parent_id());
		prepare.setString(2, categories.getCate_name());
		prepare.setString(3, categories.getCate_descript());
		prepare.setString(4, categories.getCate_img_loc());		
	}

	@Override
	protected void setUpdateParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setInt(1, categories.getCate_parent_id());
		prepare.setString(2, categories.getCate_name());
		prepare.setString(3, categories.getCate_descript());
		prepare.setString(4, categories.getCate_img_loc());
		prepare.setInt(5, categories.getCate_id());
		
	}

	@Override
	protected void setUpdateStatusParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setString(1, categories.getStatus());
		prepare.setInt(2, categories.getCate_id());
	}
}
