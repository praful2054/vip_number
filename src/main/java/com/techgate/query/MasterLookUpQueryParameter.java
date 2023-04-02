package com.techgate.query;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.techgate.domain.MasterLookUp;



public class MasterLookUpQueryParameter extends AbstractQueryParameter{

	private MasterLookUp masterLookUp = null;
	
	public MasterLookUpQueryParameter(MasterLookUp masterLookUp){
		this.masterLookUp = masterLookUp;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Class getRequiredClass() {
		return MasterLookUpQueryParameter.class;
	}

	@Override
	protected void setDeleteParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setInt(1, masterLookUp.getLookupCode());
	}

	@Override
	protected void setInsertParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setString(1, masterLookUp.getLookupName());
		prepare.setString(2, masterLookUp.getLookupMeaning());
		prepare.setString(3, masterLookUp.getValue1());
		prepare.setString(4, masterLookUp.getValue2());
		prepare.setString(5, masterLookUp.getValue3());
		prepare.setString(6, masterLookUp.getValue4());
	}

	@Override
	protected void setUpdateParameter(PreparedStatement prepare)
			throws SQLException {
		prepare.setString(1, masterLookUp.getLookupName());
		prepare.setString(2, masterLookUp.getLookupMeaning());
		prepare.setString(3, masterLookUp.getValue1());
		prepare.setString(4, masterLookUp.getValue2());
		prepare.setString(5, masterLookUp.getValue3());
		prepare.setString(6, masterLookUp.getValue4());
		prepare.setInt(7, masterLookUp.getLookupCode());
		
	}

	@Override
	protected void setUpdateStatusParameter(PreparedStatement prepare)
			throws SQLException {
	}
}
