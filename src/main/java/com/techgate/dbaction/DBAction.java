package com.techgate.dbaction;

import java.util.List;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;


public class DBAction extends JdbcDaoSupport{

	public int executeDML(PreparedStatementCreator psc){
		return getJdbcTemplate().update(psc);
	}
	
	public Number executeDMLToGetId(PreparedStatementCreator psc){
		KeyHolder keyHolder = new GeneratedKeyHolder();		
		int verify = getJdbcTemplate().update(psc, keyHolder);
		Number id = null;
		if(verify == 1)
			id = keyHolder.getKey();
		return id;
	}
	
	public int[] executeBatchUpdate(String sql, List<Object[]> parameters) {
		return getJdbcTemplate().batchUpdate(sql, parameters);
	}
	
	@SuppressWarnings("unchecked")
	public <T> T getSingleData(String sql,Class clazz,Object id){
		try {
			return (T) getJdbcTemplate().queryForObject(sql,ParameterizedBeanPropertyRowMapper.newInstance(clazz),id);
		} catch (Exception e) {
			return null;
		}	
	}
	
	@SuppressWarnings("unchecked")
	public <T> List<T> getDataList(String sql,Class clazz){
		List<T> list = getJdbcTemplate().query(
			    sql,new BeanPropertyRowMapper(clazz));	
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public <T> List<T> getDataList(String sql,Class clazz,Object... queryParameter){
		List<T> list = getJdbcTemplate().query(
			    sql,new BeanPropertyRowMapper(clazz),queryParameter);	
		return list;
	}
	
	public int delete(String sql, Object ...parameters) {
		return getJdbcTemplate().update(sql, parameters);
	}
	
	public int update(String sql, Object ...parameters) {
		return getJdbcTemplate().update(sql, parameters);
	}
	
	public static void main(String[] args) {
		
	}
}
