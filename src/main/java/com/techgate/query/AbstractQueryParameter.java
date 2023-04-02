package com.techgate.query;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import org.springframework.jdbc.core.PreparedStatementCreator;
import com.techgate.util.GeneralConstants;

public abstract class AbstractQueryParameter implements PreparedStatementCreator {

	private String sql = null;
	private int action = 0;

	
	@Override
	public PreparedStatement createPreparedStatement(Connection con)
			throws SQLException {
		PreparedStatement prepare = con.prepareStatement(sql);
		setParameter(action,prepare);
		return prepare;
	}
	
	private void setParameter(final int ACTION,PreparedStatement prepare) throws SQLException{
		if(ACTION == GeneralConstants.INSERT)
			setInsertParameter(prepare);
		else if(ACTION == GeneralConstants.UPDATE)
			setUpdateParameter(prepare);
		else if(ACTION == GeneralConstants.DELETE)
			setDeleteParameter(prepare);
		else if(ACTION == GeneralConstants.STATUS_UPDATE)
			setUpdateStatusParameter(prepare);
	}

	protected abstract void setInsertParameter(PreparedStatement prepare) throws SQLException;
	protected abstract void setUpdateParameter(PreparedStatement prepare) throws SQLException;
	protected abstract void setDeleteParameter(PreparedStatement prepare) throws SQLException;
	protected abstract void setUpdateStatusParameter(PreparedStatement prepare) throws SQLException;
	
	public int getAction() {
		return action;
	}

	public void setAction(int action) {
		this.action = action;
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}
	
	
	@SuppressWarnings("unchecked")
	public abstract Class getRequiredClass();
	
}
