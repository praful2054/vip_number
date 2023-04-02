package com.techgate.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.util.StringUtils;

import com.techgate.domain.Category;
import com.techgate.domain.CustomProduct;
import com.techgate.domain.CustomerAddressDetails;
import com.techgate.domain.CustomerLoginDetail;
import com.techgate.domain.EmployeeDetails;
import com.techgate.domain.MasterLookUp;
import com.techgate.domain.blog;
import com.techgate.domain.vendorDetails;



public class GeneralFunction extends JdbcDaoSupport {


	@SuppressWarnings("unchecked")
	public List<Category> getParentCategoryList(){
		List<Category> categoryList = getJdbcTemplate().query(
			    QueryConstants.PARENT_CATEGORY_ALL_DATE_QUERY,new BeanPropertyRowMapper(Category.class));
		return categoryList;
	}


	@SuppressWarnings("unchecked")
	public List<Category> getParentCategoryList(String parentId){
		List<Category> categoriesList = getJdbcTemplate().query(
			    "select cate_id,cate_name,cate_img_loc from categories where cate_id='"+parentId+"' and status='Y'",new BeanPropertyRowMapper(Category.class));
		return categoriesList;
	}


	public String getParentCategoryId(String id){
        String value = getJdbcTemplate().queryForObject(
                QueryConstants.CATEGORY_PARAENT_ID_QUERY,String.class, id);
        return value;
    }

	@SuppressWarnings("unchecked")
	public List<EmployeeDetails> getEmployeeDetailsList(String loginId, String password){
		return getJdbcTemplate().query(
			    "select loginId, firstname, lastname, profile from employee where loginId='"+loginId+"' and password='"+password+"'",new BeanPropertyRowMapper(EmployeeDetails.class));
	}

	@SuppressWarnings("unchecked")
	public List<vendorDetails> getVendorDetailsList(String loginId, String password){
		return getJdbcTemplate().query(
			    "select * from vendorDetails where loginId='"+loginId+"' and password='"+password+"' and status='Y'",new BeanPropertyRowMapper(vendorDetails.class));
	}

	@SuppressWarnings("unchecked")
	public List<Category> getSubCategoryList(){
		List<Category> categoryList = getJdbcTemplate().query(
			    QueryConstants.SUB_CATEGORY_ALL_DATE_QUERY,new BeanPropertyRowMapper(Category.class));
		return categoryList;
	}

	@SuppressWarnings("unchecked")
	public List<Category> getSubCategoriesList(String parentId){
		List<Category> categoriesList = getJdbcTemplate().query(
			    "select cate_id,cate_name,cate_img_loc from categories where status='Y' and cate_parent_id="+parentId+" order by cate_name asc",new BeanPropertyRowMapper(Category.class));
		return categoriesList;
	}

	@SuppressWarnings("unchecked")
	public List<Category> getSubCategoriesFromChildList(String childId){
		List<Category> categoriesList = getJdbcTemplate().query(
			    "select cate_parent_id,cate_id,cate_name from categories where cate_parent_id = (select cate_parent_id from categories where cate_id ="+childId+" and status='Y')",new BeanPropertyRowMapper(Category.class));
		return categoriesList;
	}

	@SuppressWarnings("unchecked")
	public List<blog> getBlogList(){
		return getJdbcTemplate().query(
			    "select * from Blog",new BeanPropertyRowMapper(blog.class));
	}

	@SuppressWarnings("unchecked")
	public List<CustomProduct> getProductList(){
		return getJdbcTemplate().query(
			    "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  pd.product_id = pod.product_id and pd.number_status='Available'  and pd.status='Y' ORDER BY RAND()",new BeanPropertyRowMapper(CustomProduct.class));
	}

	public List<CustomProduct> getProductListNumSorted(String orderBy){
		return getJdbcTemplate().query(
				"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  pd.product_id = pod.product_id and pd.number_status='Available'  and pd.status='Y' ORDER BY pd.number " + orderBy,new BeanPropertyRowMapper(CustomProduct.class));
	}

	@SuppressWarnings("unchecked")
	public List<CustomProduct> getSoldProductList(){
		return getJdbcTemplate().query(
			    "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  pd.product_id = pod.product_id and pd.number_status='Sold'  and pd.status='Y' ORDER BY pd.updated_date desc limit 400",new BeanPropertyRowMapper(CustomProduct.class));
	}

	@SuppressWarnings("unchecked")
	public List<CustomProduct> getofferProductList(){
		return getJdbcTemplate().query(
			    "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  pd.product_id = pod.product_id and pd.number_status='Available'  and pd.status='Y' and pod.discount >0  ORDER BY RAND()",new BeanPropertyRowMapper(CustomProduct.class));
	}

	@SuppressWarnings("unchecked")
	public List<CustomProduct> getloadProductList(String limit){
		return getJdbcTemplate().query(
			    "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  pd.product_id = pod.product_id and pd.number_status='Available'  and pd.status='Y' ORDER BY RAND()  LIMIT "+limit+" ",new BeanPropertyRowMapper(CustomProduct.class));
	}

	@SuppressWarnings("unchecked")
	public List<CustomProduct> getloadofferProductList(String limit){
		return getJdbcTemplate().query(
			    "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  pd.product_id = pod.product_id and pd.number_status='Available'  and pd.status='Y' and pod.discount >0 ORDER BY RAND()  LIMIT "+limit+" ",new BeanPropertyRowMapper(CustomProduct.class));
	}

	@SuppressWarnings("unchecked")
	public List<CustomProduct> getProductPricefilterList(String price){
		return getJdbcTemplate().query(
			    "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  pd.product_id = pod.product_id and pd.number_status='Available'  and pd.status='Y' order by pod.rateInRupee "+price+" ",new BeanPropertyRowMapper(CustomProduct.class));
	}

	@SuppressWarnings("unchecked")
	public List<CustomProduct> getProductFilterList(String orderBy){
		return getJdbcTemplate().query(
				"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  pd.product_id = pod.product_id and pd.number_status='Available'  and pd.status='Y' order by pd.number "+orderBy+" ",new BeanPropertyRowMapper(CustomProduct.class));
	}

	@SuppressWarnings("unchecked")
	public List<CustomProduct> getofferProductPricefilterList(String price){
		return getJdbcTemplate().query(
			    "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  pd.product_id = pod.product_id and pd.number_status='Available'  and pd.status='Y' and pod.discount >0 order by pod.rateInRupee "+price+" ",new BeanPropertyRowMapper(CustomProduct.class));
	}

	@SuppressWarnings("unchecked")
	public List<CustomProduct> getProductPricelimitfilterList(String price, String limit){
		return getJdbcTemplate().query(
			    "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  pd.product_id = pod.product_id and pd.number_status='Available'  and pd.status='Y' order by pod.rateInRupee "+price+" LIMIT "+limit+" ",new BeanPropertyRowMapper(CustomProduct.class));
	}

	@SuppressWarnings("unchecked")
	public List<CustomProduct> getofferProductPricelimitfilterList(String price, String limit){
		return getJdbcTemplate().query(
			    "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  pd.product_id = pod.product_id and pd.number_status='Available'  and pd.status='Y' and pod.discount >0 order by pod.rateInRupee "+price+" LIMIT "+limit+" ",new BeanPropertyRowMapper(CustomProduct.class));
	}

	@SuppressWarnings("unchecked")
	public List<CustomProduct> getProductListSearch(String product, String saerchCriteria, String orderBy){

		if(orderBy == null || orderBy == ""){
			orderBy = "asc";
		}
		/*if(orderBy == null || orderBy == ""){
			if("notEvenNumber".equalsIgnoreCase(product)){
				return getJdbcTemplate().query(
						"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar," +
								"pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  " +
								"pd.product_id = pod.product_id and pd.number not like '%2%' and  pd.number not like '%4%' " +
								"and pd.number not like '%8%' and pd.number_status='Available'  and " +
								"pd.status='Y' order by pod.rateInRupee " + orderBy,new BeanPropertyRowMapper(CustomProduct.class));

			}
			if("startwith".equalsIgnoreCase(saerchCriteria)){
				switch (product.length()){
					case 2:
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and pd.number like '" + product + "%' " +
										"and  pd.number_status='Available'  and pd.status='Y' ",
								new BeanPropertyRowMapper(CustomProduct.class));
					case 3:
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap," +
										"from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and " +
										"(pd.number like '" + product + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-1) + "%' ) " +
										"and  pd.number_status='Available'  and pd.status='Y', " +
										"order by " +
										"case pd.number when  pd.number like '" + product + "%' then 0 " +
										"when  pd.number like '" + product.substring(0,product.length()-1) + "%' then 1 " +
										"else 2 end " +
										"",

								new BeanPropertyRowMapper(CustomProduct.class));
					case 4:
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap," +
										"case pd.number when  pd.number like '" + product + "%' then 0 " +
										"when  pd.number like '" + product.substring(0,product.length()-1) + "%' then 1 " +
										"when  pd.number like '" + product.substring(0,product.length()-2) + "%' then 2 " +
										"else 3 end" +
										"from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and " +
										"(pd.number like '" + product + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-1) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-2) + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y'",
								new BeanPropertyRowMapper(CustomProduct.class));

					case 5:
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap, "  +
										"case pd.number when  pd.number like '" + product + "%' then 0 " +
										"when  pd.number like '" + product.substring(0,product.length()-1) + "%' then 1 " +
										"when  pd.number like '" + product.substring(0,product.length()-2) + "%' then 2 " +
										"when  pd.number like '" + product.substring(0,product.length()-3) + "%' then 3 " +
										"else 4 end " +
										"from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and " +
										"(pd.number like '" + product + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-1) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-2) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-3) + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' ",
								new BeanPropertyRowMapper(CustomProduct.class));
					case 6:
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap, "+
										"case when  pd.number like '" + product + "%' then 0 " +
										"when  pd.number like '" + product.substring(0,product.length()-1) + "%' then 1 " +
										"when  pd.number like '" + product.substring(0,product.length()-2) + "%' then 2 " +
										"when  pd.number like '" + product.substring(0,product.length()-3) + "%' then 3 " +
										"when  pd.number like '" + product.substring(0,product.length()-4) + "%' then 4 " +
										"else 5 end " +
										"from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and " +
										"(pd.number like '" + product + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-1) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-2) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-3) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-4) + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' ",
					new BeanPropertyRowMapper(CustomProduct.class));
					case 7:
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap, " +
										"case when  pd.number like '" + product + "%' then 0 " +
										"when  pd.number like '" + product.substring(0,product.length()-1) + "%' then 1 " +
										"when  pd.number like '" + product.substring(0,product.length()-2) + "%' then 2 " +
										"when  pd.number like '" + product.substring(0,product.length()-3) + "%' then 3 " +
										"when  pd.number like '" + product.substring(0,product.length()-4) + "%' then 4 " +
										"when  pd.number like '" + product.substring(0,product.length()-5) + "%' then 5 " +
										"else 6 end "+
										"from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and " +
										"(pd.number like '" + product + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-1) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-2) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-3) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-4) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-5) + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' ",
								new BeanPropertyRowMapper(CustomProduct.class));
					case 8:
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap, "+
										"case when  pd.number like '" + product + "%' then 0 " +
										"when  pd.number like '" + product.substring(0,product.length()-1) + "%' then 1 " +
										"when  pd.number like '" + product.substring(0,product.length()-2) + "%' then 2 " +
										"when  pd.number like '" + product.substring(0,product.length()-3) + "%' then 3 " +
										"when  pd.number like '" + product.substring(0,product.length()-4) + "%' then 4 " +
										"when  pd.number like '" + product.substring(0,product.length()-5) + "%' then 5 " +
										"when  pd.number like '" + product.substring(0,product.length()-6) + "%' then 6 " +
										"else 7 end "+
										"from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and " +
										"(pd.number like '" + product + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-1) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-2) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-3) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-4) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-5) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-6) + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' ",
					new BeanPropertyRowMapper(CustomProduct.class));

					case 9:
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap, "+
										"case when  pd.number like '" + product + "%' then 0 " +
										"when  pd.number like '" + product.substring(0,product.length()-1) + "%' then 1 " +
										"when  pd.number like '" + product.substring(0,product.length()-2) + "%' then 2 " +
										"when  pd.number like '" + product.substring(0,product.length()-3) + "%' then 3 " +
										"when  pd.number like '" + product.substring(0,product.length()-4) + "%' then 4 " +
										"when  pd.number like '" + product.substring(0,product.length()-5) + "%' then 5 " +
										"when  pd.number like '" + product.substring(0,product.length()-6) + "%' then 6 " +
										"when  pd.number like '" + product.substring(0,product.length()-7) + "%' then 7 " +
										"else 8 end " +
										"from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and " +
										"(pd.number like '" + product + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-1) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-2) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-3) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-4) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-5) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-6) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-7) + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' ",
					new BeanPropertyRowMapper(CustomProduct.class));

				}

				return getJdbcTemplate().query(
						"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  pd.product_id = pod.product_id and pd.number like '"+product+"%' and  pd.number_status='Available'  and pd.status='Y' order by pod.rateInRupee desc",new BeanPropertyRowMapper(CustomProduct.class));

			}
			else if("endwith".equalsIgnoreCase(saerchCriteria)){
				switch (product.length()) {
					case 2:
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and pd.number like '%" + product + "' " +
										"or pd.product_id = pod.product_id and pd.number like '%" + product.substring(product.length() - 1) + "' " +
										"and  pd.number_status='Available'  and pd.status='Y' ",
								new BeanPropertyRowMapper(CustomProduct.class));
					case 3:
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and " +
										"pd.number like '%" + product + "' " +
										"and  pd.number_status='Available'  and pd.status='Y' ",
								new BeanPropertyRowMapper(CustomProduct.class));
					case 4:
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap, " +
										"case pd.number when  pd.number like '%" + product + "' then 0 " +
										"when  pd.number like '%" + product.substring( 1, product.length() ) + "' then 1 " +
										"else 2 end "+
										"from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and " +
										"(pd.number like '%" + product + "' " +
										"or pd.number like '%" + product.substring( 1, product.length() ) + "') " +
										"and  pd.number_status='Available'  and pd.status='Y' ",
								new BeanPropertyRowMapper(CustomProduct.class));

					case 5:
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap, " +
										"case pd.number when  pd.number like '%" + product + "' then 0 " +
										"when  pd.number like '%" + product.substring( 1,product.length() ) + "' then 1 " +
										"when  pd.number like '%" + product.substring( 2, product.length()) + "' then 2 " +
										"else 3 end "+
										"from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and " +
										"(pd.number like '%" + product + "' " +
										"or pd.number like '%" + product.substring( 1,product.length()) + "' " +
										"or pd.number like '%" + product.substring(2,product.length()) + "' )" +
										"and  pd.number_status='Available'  and pd.status='Y' ",
								new BeanPropertyRowMapper(CustomProduct.class));
					case 6:
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap, " +
										"case pd.number when  pd.number like '%" + product + "' then 0 " +
										"when  pd.number like '%" + product.substring(1,product.length() ) + "' then 1 " +
										"when  pd.number like '%" + product.substring(2, product.length()) + "' then 2 " +
										"when  pd.number like '%" + product.substring( 3,product.length() ) + "' then 3 " +
										"else 4 end "+
										"from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and " +
										"(pd.number like '%" + product + "' " +
										"or pd.number like '%" + product.substring(1,product.length() ) + "' " +
										"or pd.number like '%" + product.substring(2, product.length() ) + "' " +
										"or pd.number like '%" + product.substring(3,product.length() ) + "' )" +
										"and  pd.number_status='Available'  and pd.status='Y' ",
								new BeanPropertyRowMapper(CustomProduct.class));
					case 7:
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap, " +
										"case pd.number when  pd.number like '%" + product + "' then 0 " +
										"when  pd.number like '%" + product.substring(1,product.length() ) + "' then 1 " +
										"when  pd.number like '%" + product.substring( 2,product.length() ) + "' then 2 " +
										"when  pd.number like '%" + product.substring( 3,product.length() ) + "' then 3 " +
										"when  pd.number like '%" + product.substring( 4,product.length() ) + "' then 4 " +
										"else 5 end "+
										"from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and " +
										"(pd.number like '%" + product + "' " +
										"or pd.number like '%" + product.substring( 1, product.length() ) + "' " +
										"or pd.number like '%" + product.substring( 2, product.length() ) + "' " +
										"or pd.number like '%" + product.substring( 3,product.length() ) + "' " +
										"or pd.number like '%" + product.substring(4,product.length() ) + "' )" +
										"and  pd.number_status='Available'  and pd.status='Y' ",
								new BeanPropertyRowMapper(CustomProduct.class));
					case 8:
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap, "  +
										"case pd.number when  pd.number like '%" + product + "' then 0 " +
										"when  pd.number like '%" + product.substring( 1, product.length() ) + "' then 1 " +
										"when  pd.number like '%" + product.substring( 2,product.length() ) + "' then 2 " +
										"when  pd.number like '%" + product.substring( 3,product.length() ) + "' then 3 " +
										"when  pd.number like '%" + product.substring( 4,product.length() ) + "' then 4 " +
										"when  pd.number like '%" + product.substring( 5,product.length() ) + "' then 5 " +
										"else 6 end " +
										"from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and " +
										"(pd.number like '%" + product + "' " +
										"or pd.number like '%" + product.substring( 1,product.length() ) + "' " +
										"or pd.number like '%" + product.substring(2,product.length()) + "' " +
										"or pd.number like '%" + product.substring( 3,product.length()) + "' " +
										"or pd.number like '%" + product.substring( 4,product.length() ) + "' " +
										"or pd.number like '%" + product.substring(5,product.length() ) + "' )" +
										"and  pd.number_status='Available'  and pd.status='Y' ",
								new BeanPropertyRowMapper(CustomProduct.class));

					case 9:
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap, "  +
										"case pd.number when  pd.number like '%" + product + "' then 0 " +
										"when  pd.number like '%" + product.substring(1, product.length() ) + "' then 1 " +
										"when  pd.number like '%" + product.substring(2, product.length() ) + "' then 2 " +
										"when  pd.number like '%" + product.substring(3, product.length() ) + "' then 3 " +
										"when  pd.number like '%" + product.substring(4, product.length() ) + "' then 4 " +
										"when  pd.number like '%" + product.substring(5, product.length() ) + "' then 5 " +
										"when  pd.number like '%" + product.substring(6, product.length() ) + "' then 6 " +
										"else 7 end "+
										"from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and " +
										"(pd.number like '%" + product + "' " +
										"or pd.number like '%" + product.substring(1,product.length() ) + "' " +
										"or pd.number like '%" + product.substring(2,product.length() ) + "' " +
										"or pd.number like '%" + product.substring( 3,product.length() ) + "' " +
										"or pd.number like '%" + product.substring( 4, product.length() ) + "' " +
										"or pd.number like '%" + product.substring(5,product.length() ) + "' " +
										"or pd.number like '%" + product.substring( 6,product.length() ) + "' )" +
										"and  pd.number_status='Available'  and pd.status='Y' ",
								new BeanPropertyRowMapper(CustomProduct.class));
				}

				return getJdbcTemplate().query(
						"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  pd.product_id = pod.product_id and pd.number like '%"+product+"' and  pd.number_status='Available'  and pd.status='Y' order by pod.rateInRupee desc",new BeanPropertyRowMapper(CustomProduct.class));

			}
			switch (product.length()) {
				case 1:
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									"where  pd.product_id = pod.product_id and " +
									"pd.number like '%" + product + "%' " +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				case 2:
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									"where  pd.product_id = pod.product_id and " +
									"pd.number like '%" + product + "%' " +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				case 3:
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									"where  pd.product_id = pod.product_id and " +
									"pd.number like '%" + product + "%' " +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				case 4:
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap, "+
									"case pd.number when  pd.number like '%" + product + "%' then 0 " +
									"when  pd.number like '%" + product.substring(1, product.length()) + "%' then 1 " +
									"else 2 end "+
									"from ProductDetails pd, ProductOtherDetails pod " +
									"where  pd.product_id = pod.product_id and " +
									"(pd.number like '%" + product + "%' " +
									"or pd.number like '%" + product.substring(1, product.length()) + "%' ) " +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));

				case 5:
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap, " +
									"case pd.number when  pd.number like '%" + product + "%' then 0 " +
									"when  pd.number like '%" + product.substring(1, product.length()) + "%' then 1 " +
									"when  pd.number like '%" + product.substring(2, product.length()) + "%' then 2 " +
									"else 3 end "+
									"from ProductDetails pd, ProductOtherDetails pod " +
									"where  pd.product_id = pod.product_id and " +
									"(pd.number like '%" + product + "%' " +
									"or pd.number like '%" + product.substring(1, product.length()) + "%' " +
									"or pd.number like '%" + product.substring(2, product.length()) + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				case 6:
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap, " +
									"case pd.number when  pd.number like '%" + product + "%' then 0 " +
									"when  pd.number like '%" + product.substring(1, product.length()) + "%' then 1 " +
									"when  pd.number like '%" + product.substring(2, product.length()) + "%' then 2 " +
									"when  pd.number like '%" + product.substring(3, product.length()) + "%' then 3 " +
									"else 4 end "+
									"from ProductDetails pd, ProductOtherDetails pod " +
									"where  pd.product_id = pod.product_id and " +
									"(pd.number like '%" + product + "%' " +
									"or pd.number like '%" + product.substring(1, product.length()) + "%' " +
									"or pd.number like '%" + product.substring(2, product.length()) + "%' " +
									"or pd.number like '%" + product.substring(3, product.length()) + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				case 7:
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap, " +
									"case pd.number when  pd.number like '%" + product + "%' then 0 " +
									"when  pd.number like '%" + product.substring(1, product.length() ) + "%' then 1 " +
									"when  pd.number like '%" + product.substring(2, product.length() ) + "%' then 2 " +
									"when  pd.number like '%" + product.substring(3, product.length() ) + "%' then 3 " +
									"when  pd.number like '%" + product.substring(4, product.length() ) + "%' then 4 " +
									"else 5 end "+
									"from ProductDetails pd, ProductOtherDetails pod " +
									"where  pd.product_id = pod.product_id and " +
									"(pd.number like '%" + product + "%' " +
									"or pd.number like '%" + product.substring(1, product.length()) + "%' " +
									"or pd.number like '%" + product.substring(2, product.length() ) + "%' " +
									"or pd.number like '%" + product.substring(3, product.length() ) + "%' " +
									"or pd.number like '%" + product.substring(4, product.length() ) + "%' ) " +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				case 8:
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap, " +
									"case pd.number when  pd.number like '%" + product + "%' then 0 " +
									"when  pd.number like '%" + product.substring(1, product.length() ) + "%' then 1 " +
									"when  pd.number like '%" + product.substring(2, product.length()) + "%' then 2 " +
									"when  pd.number like '%" + product.substring(3, product.length() ) + "%' then 3 " +
									"when  pd.number like '%" + product.substring(4, product.length() ) + "%' then 4 " +
									"when  pd.number like '%" + product.substring(5, product.length() ) + "%' then 5 " +
									"else 6 end "+
									"from ProductDetails pd, ProductOtherDetails pod " +
									"where  pd.product_id = pod.product_id and " +
									"(pd.number like '%" + product + "%' " +
									"or pd.number like '%" + product.substring(1, product.length() ) + "%' " +
									"or pd.number like '%" + product.substring(2, product.length() ) + "%' " +
									"or pd.number like '%" + product.substring(3, product.length() ) + "%' " +
									"or pd.number like '%" + product.substring(4, product.length() ) + "%' " +
									"or pd.number like '%" + product.substring(5, product.length() ) + "%' ) " +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));

				case 9:
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap, " +
									"case pd.number when  pd.number like '%" + product + "%' then 0 " +
									"when  pd.number like '%" + product.substring(1, product.length() ) + "%' then 1 " +
									"when  pd.number like '%" + product.substring(2, product.length() ) + "%' then 2 " +
									"when  pd.number like '%" + product.substring(3, product.length() ) + "%' then 3 " +
									"when  pd.number like '%" + product.substring(4, product.length() ) + "%' then 4 " +
									"when  pd.number like '%" + product.substring(5, product.length() ) + "%' then 5 " +
									"when  pd.number like '%" + product.substring(6, product.length() ) + "%' then 6 " +
									"else 7 end "+
									"from ProductDetails pd, ProductOtherDetails pod " +
									"where  pd.product_id = pod.product_id and " +
									"(pd.number like '%" + product + "%' " +
									"or pd.number like '%" + product.substring(1, product.length() ) + "%' " +
									"or pd.number like '%" + product.substring(2, product.length() ) + "%' " +
									"or pd.number like '%" + product.substring(3, product.length() ) + "%' " +
									"or pd.number like '%" + product.substring(4, product.length() ) + "%' " +
									"or pd.number like '%" + product.substring(5, product.length() ) + "%' " +
									"or pd.number like '%" + product.substring(6, product.length() ) + "%' ) " +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
			}
			return getJdbcTemplate().query(
					"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  pd.product_id = pod.product_id and pd.number like '%"+product+"%' and  pd.number_status='Available'  and pd.status='Y' order by pod.rateInRupee desc",new BeanPropertyRowMapper(CustomProduct.class));

		}*/
		if("notEvenNumber".equalsIgnoreCase(product)){
			return getJdbcTemplate().query(
					"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar," +
							"pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  " +
							"pd.product_id = pod.product_id and pd.number not like '%2%' and  pd.number not like '%4%' " +
							"and pd.number not like '%8%' and pd.number_status='Available'  and " +
							"pd.status='Y' order by pod.rateInRupee " + orderBy,new BeanPropertyRowMapper(CustomProduct.class));

		}
		if("startwith".equalsIgnoreCase(saerchCriteria)){
				switch (product.length()){
					case 2:
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and pd.number like '" + product + "%' " +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										"case pd.number when  pd.number like '" + product + "%' then 0 " +
										"else 1 end, " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					case 3:
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and " +
										"(pd.number like '" + product + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-1) + "%' ) " +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										"case when  pd.number like '" + product + "%' then 0 " +
										"when  pd.number like '" + product.substring(0,product.length()-1) + "%' then 1 " +
										"else 2 end, "+
										"pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					case 4:
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and " +
										"(pd.number like '" + product + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-1) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-2) + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										"case when  pd.number like '" + product + "%' then 0 " +
										"when  pd.number like '" + product.substring(0,product.length()-1) + "%' then 1 " +
										"when  pd.number like '" + product.substring(0,product.length()-2) + "%' then 2 " +
										"else 4 end, "+
										"pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));

					case 5:
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and " +
										"(pd.number like '" + product + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-1) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-2) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-3) + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										"case when  pd.number like '" + product + "%' then 0 " +
										"when  pd.number like '" + product.substring(0,product.length()-1) + "%' then 1 " +
										"when  pd.number like '" + product.substring(0,product.length()-2) + "%' then 2 " +
										"when  pd.number like '" + product.substring(0,product.length()-3) + "%' then 3 " +
										"else 4 end, "+
										"pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					case 6:
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and " +
										"(pd.number like '" + product + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-1) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-2) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-3) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-4) + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										"case when  pd.number like '" + product + "%' then 0 " +
										"when  pd.number like '" + product.substring(0,product.length()-1) + "%' then 1 " +
										"when  pd.number like '" + product.substring(0,product.length()-2) + "%' then 2 " +
										"when  pd.number like '" + product.substring(0,product.length()-3) + "%' then 3 " +
										"when  pd.number like '" + product.substring(0,product.length()-4) + "%' then 4 " +
										"else 5 end, "+
										"pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					case 7:
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and " +
										"(pd.number like '" + product + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-1) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-2) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-3) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-4) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-5) + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										"case when  pd.number like '" + product + "%' then 0 " +
										"when  pd.number like '" + product.substring(0,product.length()-1) + "%' then 1 " +
										"when  pd.number like '" + product.substring(0,product.length()-2) + "%' then 2 " +
										"when  pd.number like '" + product.substring(0,product.length()-3) + "%' then 3 " +
										"when  pd.number like '" + product.substring(0,product.length()-4) + "%' then 4 " +
										"when  pd.number like '" + product.substring(0,product.length()-5) + "%' then 5 " +
										"else 6 end, "+
										"pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					case 8:
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and " +
										"(pd.number like '" + product + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-1) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-2) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-3) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-4) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-5) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-6) + "%' )" +

										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										"case when  pd.number like '" + product + "%' then 0 " +
										"when  pd.number like '" + product.substring(0,product.length()-1) + "%' then 1 " +
										"when  pd.number like '" + product.substring(0,product.length()-2) + "%' then 2 " +
										"when  pd.number like '" + product.substring(0,product.length()-3) + "%' then 3 " +
										"when  pd.number like '" + product.substring(0,product.length()-4) + "%' then 4 " +
										"when  pd.number like '" + product.substring(0,product.length()-5) + "%' then 5 " +
										"when  pd.number like '" + product.substring(0,product.length()-6) + "%' then 6 " +
										"else 7 end, "+
										"pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));

					case 9:
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and " +
										"(pd.number like '" + product + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-1) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-2) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-3) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-4) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-5) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-6) + "%' " +
										"or pd.number like '" + product.substring(0,product.length()-7) + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										"case when  pd.number like '" + product + "%' then 0 " +
										"when  pd.number like '" + product.substring(0,product.length()-1) + "%' then 1 " +
										"when  pd.number like '" + product.substring(0,product.length()-2) + "%' then 2 " +
										"when  pd.number like '" + product.substring(0,product.length()-3) + "%' then 3 " +
										"when  pd.number like '" + product.substring(0,product.length()-4) + "%' then 4 " +
										"when  pd.number like '" + product.substring(0,product.length()-5) + "%' then 5 " +
										"when  pd.number like '" + product.substring(0,product.length()-6) + "%' then 6 " +
										"when  pd.number like '" + product.substring(0,product.length()-7) + "%' then 7 " +
										"else 8 end, "+
										"pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));

				}

			return getJdbcTemplate().query(
					"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  pd.product_id = pod.product_id and pd.number like '"+product+"%' and  pd.number_status='Available'  and pd.status='Y' order by pod.rateInRupee desc",new BeanPropertyRowMapper(CustomProduct.class));

		}
		else if("endwith".equalsIgnoreCase(saerchCriteria)){
			switch (product.length()) {
				case 2:
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and pd.number like '%" + product + "' " +
									"or pd.product_id = pod.product_id and pd.number like '%" + product.substring(product.length() - 1) + "' " +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				case 3:
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									"where  pd.product_id = pod.product_id and " +
									"pd.number like '%" + product + "' " +
									"and  pd.number_status='Available'  and pd.status='Y' " +
									"order by " +
									"pod.rateInRupee " + orderBy,
							new BeanPropertyRowMapper(CustomProduct.class));
				case 4:
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									"where  pd.product_id = pod.product_id and " +
									"(pd.number like '%" + product + "' " +
									"or pd.number like '%" + product.substring( 1, product.length() ) + "') " +
									"and  pd.number_status='Available'  and pd.status='Y' " +
									"order by " +
									"case when  pd.number like '%" + product + "' then 0 " +
									"when  pd.number like '%" + product.substring( 1, product.length() ) + "' then 1 " +
									"else 2 end, " +
									"pod.rateInRupee " + orderBy,
							new BeanPropertyRowMapper(CustomProduct.class));

				case 5:
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									"where  pd.product_id = pod.product_id and " +
									"(pd.number like '%" + product + "' " +
									"or pd.number like '%" + product.substring( 1,product.length()) + "' " +
									"or pd.number like '%" + product.substring(2,product.length()) + "' )" +
									"and  pd.number_status='Available'  and pd.status='Y' " +
									"order by " +
									"case when  pd.number like '%" + product + "' then 0 " +
									"when  pd.number like '%" + product.substring( 1,product.length() ) + "' then 1 " +
									"when  pd.number like '%" + product.substring( 2, product.length()) + "' then 2 " +
									"else 3 end, " +
									"pod.rateInRupee " + orderBy,
							new BeanPropertyRowMapper(CustomProduct.class));
				case 6:
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									"where  pd.product_id = pod.product_id and " +
									"(pd.number like '%" + product + "' " +
									"or pd.number like '%" + product.substring(1,product.length() ) + "' " +
									"or pd.number like '%" + product.substring(2, product.length() ) + "' " +
									"or pd.number like '%" + product.substring(3,product.length() ) + "' )" +
									"and  pd.number_status='Available'  and pd.status='Y' " +
									"order by " +
									"case when  pd.number like '%" + product + "' then 0 " +
									"when  pd.number like '%" + product.substring(1,product.length() ) + "' then 1 " +
									"when  pd.number like '%" + product.substring(2, product.length()) + "' then 2 " +
									"when  pd.number like '%" + product.substring( 3,product.length() ) + "' then 3 " +
									"else 4 end, " +
									"pod.rateInRupee " + orderBy,
							new BeanPropertyRowMapper(CustomProduct.class));
				case 7:
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									"where  pd.product_id = pod.product_id and " +
									"(pd.number like '%" + product + "' " +
									"or pd.number like '%" + product.substring( 1, product.length() ) + "' " +
									"or pd.number like '%" + product.substring( 2, product.length() ) + "' " +
									"or pd.number like '%" + product.substring( 3,product.length() ) + "' " +
									"or pd.number like '%" + product.substring(4,product.length() ) + "' )" +
									"and  pd.number_status='Available'  and pd.status='Y' " +
									"order by " +
									"case when  pd.number like '%" + product + "' then 0 " +
									"when  pd.number like '%" + product.substring(1,product.length() ) + "' then 1 " +
									"when  pd.number like '%" + product.substring( 2,product.length() ) + "' then 2 " +
									"when  pd.number like '%" + product.substring( 3,product.length() ) + "' then 3 " +
									"when  pd.number like '%" + product.substring( 4,product.length() ) + "' then 4 " +
									"else 5 end, " +
									"pod.rateInRupee " + orderBy,
							new BeanPropertyRowMapper(CustomProduct.class));
				case 8:
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									"where  pd.product_id = pod.product_id and " +
									"(pd.number like '%" + product + "' " +
									"or pd.number like '%" + product.substring( 1,product.length() ) + "' " +
									"or pd.number like '%" + product.substring(2,product.length()) + "' " +
									"or pd.number like '%" + product.substring( 3,product.length()) + "' " +
									"or pd.number like '%" + product.substring( 4,product.length() ) + "' " +
									"or pd.number like '%" + product.substring(5,product.length() ) + "' )" +
									"and  pd.number_status='Available'  and pd.status='Y' " +
									"order by " +
									"case when pd.number like '%" + product + "' then 0 " +
									"when  pd.number like '%" + product.substring( 1, product.length() ) + "' then 1 " +
									"when  pd.number like '%" + product.substring( 2,product.length() ) + "' then 2 " +
									"when  pd.number like '%" + product.substring( 3,product.length() ) + "' then 3 " +
									"when  pd.number like '%" + product.substring( 4,product.length() ) + "' then 4 " +
									"when  pd.number like '%" + product.substring( 5,product.length() ) + "' then 5 " +
									"else 6 end, " +
									"pod.rateInRupee " + orderBy,
							new BeanPropertyRowMapper(CustomProduct.class));

				case 9:
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									"where  pd.product_id = pod.product_id and " +
									"(pd.number like '%" + product + "' " +
									"or pd.number like '%" + product.substring(1,product.length() ) + "' " +
									"or pd.number like '%" + product.substring(2,product.length() ) + "' " +
									"or pd.number like '%" + product.substring( 3,product.length() ) + "' " +
									"or pd.number like '%" + product.substring( 4, product.length() ) + "' " +
									"or pd.number like '%" + product.substring(5,product.length() ) + "' " +
									"or pd.number like '%" + product.substring( 6,product.length() ) + "' )" +
									"and  pd.number_status='Available'  and pd.status='Y' " +
									"order by " +
									"case when pd.number like '%" + product + "' then 0 " +
									"when  pd.number like '%" + product.substring(1, product.length() ) + "' then 1 " +
									"when  pd.number like '%" + product.substring(2, product.length() ) + "' then 2 " +
									"when  pd.number like '%" + product.substring(3, product.length() ) + "' then 3 " +
									"when  pd.number like '%" + product.substring(4, product.length() ) + "' then 4 " +
									"when  pd.number like '%" + product.substring(5, product.length() ) + "' then 5 " +
									"when  pd.number like '%" + product.substring(6, product.length() ) + "' then 6 " +
									"else 7 end, " +
									"pod.rateInRupee " + orderBy,
							new BeanPropertyRowMapper(CustomProduct.class));
			}

				return getJdbcTemplate().query(
					"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  pd.product_id = pod.product_id and pd.number like '%"+product+"' and  pd.number_status='Available'  and pd.status='Y' order by pod.rateInRupee desc",new BeanPropertyRowMapper(CustomProduct.class));

		}
		switch (product.length()) {
			case 1:
				return getJdbcTemplate().query(
						"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
								"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
								"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
								"where  pd.product_id = pod.product_id and " +
								"pd.number like '%" + product + "%' " +
								"and  pd.number_status='Available'  and pd.status='Y' " +
								"order by " +
								"case when pd.number like '%"+product+"' then 0 "+
								"when pd.number like '"+product+"%' then 1 "+
								"when pd.number like '%"+product+"%' then 2 else 3 end, "+
								"pod.rateInRupee " + orderBy,
						new BeanPropertyRowMapper(CustomProduct.class));
			case 2:
				return getJdbcTemplate().query(
						"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
								"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
								"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
								"where  pd.product_id = pod.product_id and " +
								"pd.number like '%" + product + "%' " +
								"and  pd.number_status='Available'  and pd.status='Y' " +
								"order by " +
								"case when pd.number like '%"+product+"' then 0 "+
								"when pd.number like '"+product+"%' then 1 "+
								"when pd.number like '%"+product+"%' then 2 else 3 end, "+
								"pod.rateInRupee " + orderBy,
						new BeanPropertyRowMapper(CustomProduct.class));
			case 3:
				return getJdbcTemplate().query(
						"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
								"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
								"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
								"where  pd.product_id = pod.product_id and " +
								"pd.number like '%" + product + "%' " +
								"and  pd.number_status='Available'  and pd.status='Y' " +
								"order by " +
								"case when pd.number like '%"+product+"' then 0 "+
								"when pd.number like '"+product+"%' then 1 "+
								"when pd.number like '%"+product+"%' then 2 else 3 end, "+
								"pod.rateInRupee " + orderBy,
						new BeanPropertyRowMapper(CustomProduct.class));
			case 4:
				return getJdbcTemplate().query(
						"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
								"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
								"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
								"where  pd.product_id = pod.product_id and " +
								"(pd.number like '%" + product + "%' " +
								"or pd.number like '%" + product.substring(1, product.length()) + "%' ) " +
								"and  pd.number_status='Available'  and pd.status='Y' " +
								"order by " +
								"case when pd.number like '%"+product+"' then 0 "+
								"when pd.number like '"+product+"%' then 1 "+
								"when pd.number like '%"+product+"%' then 2 "+
								"when pd.number like '"+product.substring(1, product.length())+"%' then 3 else 4 end, "+
								"pod.rateInRupee " + orderBy,
						new BeanPropertyRowMapper(CustomProduct.class));

			case 5:
				return getJdbcTemplate().query(
						"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
								"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
								"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
								"where  pd.product_id = pod.product_id and " +
								"(pd.number like '%" + product + "%' " +
								"or pd.number like '%" + product.substring(1, product.length()) + "%' " +
								"or pd.number like '%" + product.substring(2, product.length()) + "%' )" +
								"and  pd.number_status='Available'  and pd.status='Y' " +
								"order by " +
								"case when  pd.number like '%" + product + "' then 0 " +
								"when  pd.number like '" + product + "%' then 1 " +
								"when  pd.number like '%" + product + "%' then 2 " +
								"when  pd.number like '%" + product.substring(1, product.length()) + "%' then 3 " +
								"when  pd.number like '%" + product.substring(2, product.length()) + "%' then 4 " +
								"else 5 end, " +
								"pod.rateInRupee " + orderBy,
						new BeanPropertyRowMapper(CustomProduct.class));
			case 6:
				return getJdbcTemplate().query(
						"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
								"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
								"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
								"where  pd.product_id = pod.product_id and " +
								"(pd.number like '%" + product + "%' " +
								"or pd.number like '%" + product.substring(1, product.length()) + "%' " +
								"or pd.number like '%" + product.substring(2, product.length()) + "%' " +
								"or pd.number like '%" + product.substring(3, product.length()) + "%' )" +
								"and  pd.number_status='Available'  and pd.status='Y' " +
								"order by " +
								"case when  pd.number like '%" + product + "' then 0 " +
								"when  pd.number like '" + product + "%' then 1 " +
								"when  pd.number like '%" + product + "%' then 2 " +
								"when  pd.number like '%" + product.substring(1, product.length()) + "%' then 3 " +
								"when  pd.number like '%" + product.substring(2, product.length()) + "%' then 4 " +
								"when  pd.number like '%" + product.substring(3, product.length()) + "%' then 5 " +
								"else 6 end, " +
								"pod.rateInRupee " + orderBy,
						new BeanPropertyRowMapper(CustomProduct.class));
			case 7:
				return getJdbcTemplate().query(
						"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
								"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
								"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
								"where  pd.product_id = pod.product_id and " +
								"(pd.number like '%" + product + "%' " +
								"or pd.number like '%" + product.substring(1, product.length()) + "%' " +
								"or pd.number like '%" + product.substring(2, product.length() ) + "%' " +
								"or pd.number like '%" + product.substring(3, product.length() ) + "%' " +
								"or pd.number like '%" + product.substring(4, product.length() ) + "%' ) " +
								"and  pd.number_status='Available'  and pd.status='Y' " +
								"order by " +
								"case when  pd.number like '%" + product + "' then 0 " +
								"when  pd.number like '" + product + "%' then 1 " +
								"when  pd.number like '%" + product + "%' then 2 " +
								"when  pd.number like '%" + product.substring(1, product.length() ) + "%' then 3 " +
								"when  pd.number like '%" + product.substring(2, product.length() ) + "%' then 4 " +
								"when  pd.number like '%" + product.substring(3, product.length() ) + "%' then 5 " +
								"when  pd.number like '%" + product.substring(4, product.length() ) + "%' then 6 " +
								"else 7 end, " +
								"pod.rateInRupee " + orderBy,
						new BeanPropertyRowMapper(CustomProduct.class));
			case 8:
				return getJdbcTemplate().query(
						"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
								"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
								"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
								"where  pd.product_id = pod.product_id and " +
								"(pd.number like '%" + product + "%' " +
								"or pd.number like '%" + product.substring(1, product.length() ) + "%' " +
								"or pd.number like '%" + product.substring(2, product.length() ) + "%' " +
								"or pd.number like '%" + product.substring(3, product.length() ) + "%' " +
								"or pd.number like '%" + product.substring(4, product.length() ) + "%' " +
								"or pd.number like '%" + product.substring(5, product.length() ) + "%' ) " +
								"and  pd.number_status='Available'  and pd.status='Y' " +
								"order by " +
								"case when  pd.number like '%" + product + "' then 0 " +
								"when  pd.number like '" + product + "%' then 1 " +
								"when  pd.number like '%" + product + "%' then 2 " +
								"when  pd.number like '%" + product.substring(1, product.length() ) + "%' then 3 " +
								"when  pd.number like '%" + product.substring(2, product.length()) + "%' then 4 " +
								"when  pd.number like '%" + product.substring(3, product.length() ) + "%' then 5 " +
								"when  pd.number like '%" + product.substring(4, product.length() ) + "%' then 6 " +
								"when  pd.number like '%" + product.substring(5, product.length() ) + "%' then 7 " +
								"else 8 end, " +
								"pod.rateInRupee " + orderBy,
						new BeanPropertyRowMapper(CustomProduct.class));

			case 9:
				return getJdbcTemplate().query(
						"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
								"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
								"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
								"where  pd.product_id = pod.product_id and " +
								"(pd.number like '%" + product + "%' " +
								"or pd.number like '%" + product.substring(1, product.length() ) + "%' " +
								"or pd.number like '%" + product.substring(2, product.length() ) + "%' " +
								"or pd.number like '%" + product.substring(3, product.length() ) + "%' " +
								"or pd.number like '%" + product.substring(4, product.length() ) + "%' " +
								"or pd.number like '%" + product.substring(5, product.length() ) + "%' " +
								"or pd.number like '%" + product.substring(6, product.length() ) + "%' ) " +
								"and  pd.number_status='Available'  and pd.status='Y' " +
								"order by " +
								"case when  pd.number like '%" + product + "' then 0 " +
								"when  pd.number like '" + product + "%' then 1 " +
								"when  pd.number like '%" + product + "%' then 2 " +
								"when  pd.number like '%" + product.substring(1, product.length() ) + "%' then 3 " +
								"when  pd.number like '%" + product.substring(2, product.length() ) + "%' then 4 " +
								"when  pd.number like '%" + product.substring(3, product.length() ) + "%' then 5 " +
								"when  pd.number like '%" + product.substring(4, product.length() ) + "%' then 6 " +
								"when  pd.number like '%" + product.substring(5, product.length() ) + "%' then 7 " +
								"when  pd.number like '%" + product.substring(6, product.length() ) + "%' then 8 " +
								"else 9 end, " +
								"pod.rateInRupee " + orderBy,
						new BeanPropertyRowMapper(CustomProduct.class));
		}
		return getJdbcTemplate().query(
			    "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  pd.product_id = pod.product_id and pd.number like '%"+product+"%' and  pd.number_status='Available'  and pd.status='Y' order by pod.rateInRupee desc",new BeanPropertyRowMapper(CustomProduct.class));
	}
	public List<CustomProduct> productListSearchFilter(String priceRange,String [] startWithNumber,String [] notContainNumber){
		String []parts=priceRange.split("-");
		String priceLow=parts[0];
		String priceHigh=parts[1];
		String startWith= String.join("",startWithNumber);
		switch (notContainNumber.length) {
			case 1:
				if(startWith != null && startWith.length() == 1){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									"where  pd.product_id = pod.product_id and" +
									" pd.number like '" + startWithNumber[0] + "%' and " +
									" pd.number not like '%" + notContainNumber[0] + "%' " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				else if(startWith != null && startWith.length() == 2){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									"where  pd.product_id = pod.product_id and" +
									" ( pd.number like '" + startWithNumber[0] + "%' or " +
									" pd.number like '" + startWithNumber[1] + "%' ) and " +
									" pd.number not like '%" + notContainNumber[0] + "%' " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				else if(startWith != null && startWith.length() == 3){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									"where  pd.product_id = pod.product_id and" +
									" ( pd.number like '" + startWithNumber[0] + "%' or " +
									" pd.number like '" + startWithNumber[1] + "%' or " +
									" pd.number like '" + startWithNumber[2] + "%' ) and " +
									" pd.number not like '%" + notContainNumber[0] + "%' " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				else if(startWith != null && startWith.length() == 4){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									"where  pd.product_id = pod.product_id and" +
									" ( pd.number like '" + startWithNumber[0] + "%' or " +
									" pd.number like '" + startWithNumber[1] + "%' or " +
									" pd.number like '" + startWithNumber[2] + "%' or " +
									" pd.number like '" + startWithNumber[3] + "%' ) and " +
									" pd.number not like '%" + notContainNumber[0] + "%' " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}

			case 2:
				if(startWith != null && startWith.length() == 1){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" pd.number like '" + startWithNumber[0] + "%' " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' and " +
									"(pd.number not like '%" + notContainNumber[0] + "%' and " +
									"pd.number not like '%" + notContainNumber[1] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				else if(startWith != null && startWith.length() == 2){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" ( pd.number like '" + startWithNumber[0] + "%' or" +
									" pd.number like '" + startWithNumber[1] + "%' ) " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' and " +
									"(pd.number not like '%" + notContainNumber[0] + "%' and " +
									"pd.number not like '%" + notContainNumber[1] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				else if(startWith != null && startWith.length() == 3){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" ( pd.number like '" + startWithNumber[0] + "%' or" +
									" pd.number like '" + startWithNumber[1] + "%' or" +
									" pd.number like '" + startWithNumber[2] + "%' ) " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' and " +
									"(pd.number not like '%" + notContainNumber[0] + "%' and " +
									"pd.number not like '%" + notContainNumber[1] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				else if(startWith != null && startWith.length() == 4){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" ( pd.number like '" + startWithNumber[0] + "%' or" +
									"  pd.number like '" + startWithNumber[1] + "%' or" +
									"  pd.number like '" + startWithNumber[2] + "%' or" +
									" pd.number like '" + startWithNumber[3] + "%' ) " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' and " +
									"(pd.number not like '%" + notContainNumber[0] + "%' and " +
									"pd.number not like '%" + notContainNumber[1] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}

			case 3:
				if(startWith != null && startWith.length() == 1){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" pd.number like '" + startWithNumber[0] + "%' " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and pd.number not like '%" + notContainNumber[0] + "%' " +
									"and pd.number not like '%" + notContainNumber[1] + "%' " +
									"and pd.number not like '%" + notContainNumber[2] + "%' " +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				else if(startWith != null && startWith.length() == 2){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" (pd.number like '" + startWithNumber[0] + "%' or " +
									" pd.number like '" + startWithNumber[1] + "%' ) " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and pd.number not like '%" + notContainNumber[0] + "%' and " +
									"and pd.number not like '%" + notContainNumber[1] + "%' and " +
									"and pd.number not like '%" + notContainNumber[2] + "%' and " +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				else if(startWith != null && startWith.length() == 3){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" (pd.number like '" + startWithNumber[0] + "%' or " +
									" pd.number like '" + startWithNumber[1] + "%' or " +
									" pd.number like '" + startWithNumber[2] + "%' ) " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and pd.number not like '%" + notContainNumber[0] + "%' and " +
									"and pd.number not like '%" + notContainNumber[1] + "%' and " +
									"and pd.number not like '%" + notContainNumber[2] + "%' and " +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				else if(startWith != null && startWith.length() == 4){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" (pd.number like '" + startWithNumber[0] + "%' or " +
									" pd.number like '" + startWithNumber[1] + "%' or " +
									" pd.number like '" + startWithNumber[2] + "%' or " +
									" pd.number like '" + startWithNumber[3] + "%' ) " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and pd.number not like '%" + notContainNumber[0] + "%' " +
									"and pd.number not like '%" + notContainNumber[1] + "%' " +
									"and pd.number not like '%" + notContainNumber[2] + "%' " +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}

			case 4:
				if(startWith != null && startWith.length() == 1){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" pd.number like '" + startWithNumber[0] + "%' " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
									"pd.number not like '%" + notContainNumber[1] + "%' and " +
									"pd.number not like '%" + notContainNumber[2] + "%' and " +
									"pd.number not like '%" + notContainNumber[3] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				else if(startWith != null && startWith.length() == 2){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" ( pd.number like '" + startWithNumber[0] + "%' or " +
									" pd.number like '" + startWithNumber[1] + "%' ) " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
									"pd.number not like '%" + notContainNumber[1] + "%' and " +
									"pd.number not like '%" + notContainNumber[2] + "%' and " +
									"pd.number not like '%" + notContainNumber[3] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				else if(startWith != null && startWith.length() == 3){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" ( pd.number like '" + startWithNumber[0] + "%' or " +
									"  pd.number like '" + startWithNumber[1] + "%' or " +
									" pd.number like '" + startWithNumber[2] + "%' ) " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
									"pd.number not like '%" + notContainNumber[1] + "%' and " +
									"pd.number not like '%" + notContainNumber[2] + "%' and " +
									"pd.number not like '%" + notContainNumber[3] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				else if(startWith != null && startWith.length() == 4){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" ( pd.number like '" + startWithNumber[0] + "%' or " +
									"  pd.number like '" + startWithNumber[1] + "%' or " +
									"  pd.number like '" + startWithNumber[2] + "%' or " +
									" pd.number like '" + startWithNumber[3] + "%' ) " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
									"pd.number not like '%" + notContainNumber[1] + "%' and " +
									"pd.number not like '%" + notContainNumber[2] + "%' and " +
									"pd.number not like '%" + notContainNumber[3] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}

			case 5:
				if(startWith != null && startWith.length() == 1){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" pd.number like '" + startWithNumber[0] + "%' " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and (pd.number not like '%" + notContainNumber[0] + "%' and  " +
									"pd.number not like '%" + notContainNumber[1] + "%' and " +
									"pd.number not like '%" + notContainNumber[2] + "%' and " +
									"pd.number not like '%" + notContainNumber[3] + "%' and " +
									"pd.number not like '%" + notContainNumber[4] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				else if(startWith != null && startWith.length() == 2){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" ( pd.number like '" + startWithNumber[0] + "%' or " +
									" pd.number like '" + startWithNumber[1] + "%' )" +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and (pd.number not like '%" + notContainNumber[0] + "%' and  " +
									"pd.number not like '%" + notContainNumber[1] + "%' and " +
									"pd.number not like '%" + notContainNumber[2] + "%' and " +
									"pd.number not like '%" + notContainNumber[3] + "%' and " +
									"pd.number not like '%" + notContainNumber[4] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				else if(startWith != null && startWith.length() == 3){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" ( pd.number like '" + startWithNumber[0] + "%' or " +
									" pd.number like '" + startWithNumber[1] + "%' or " +
									" pd.number like '" + startWithNumber[2] + "%' )" +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and (pd.number not like '%" + notContainNumber[0] + "%' and  " +
									"pd.number not like '%" + notContainNumber[1] + "%' and " +
									"pd.number not like '%" + notContainNumber[2] + "%' and " +
									"pd.number not like '%" + notContainNumber[3] + "%' and " +
									"pd.number not like '%" + notContainNumber[4] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				else if(startWith != null && startWith.length() == 4){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" ( pd.number like '" + startWithNumber[0] + "%' or " +
									" pd.number like '" + startWithNumber[1] + "%' or " +
									" pd.number like '" + startWithNumber[2] + "%' or " +
									" pd.number like '" + startWithNumber[3] + "%' )" +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and (pd.number not like '%" + notContainNumber[0] + "%' and  " +
									"pd.number not like '%" + notContainNumber[1] + "%' and " +
									"pd.number not like '%" + notContainNumber[2] + "%' and " +
									"pd.number not like '%" + notContainNumber[3] + "%' and " +
									"pd.number not like '%" + notContainNumber[4] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}

			case 6:
				if(startWith != null && startWith.length() == 1){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" pd.number like '" + startWithNumber[0] + "%' " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
									"pd.number not like '%" + notContainNumber[1] + "%' and " +
									"pd.number not like '%" + notContainNumber[2] + "%' and " +
									"pd.number not like '%" + notContainNumber[3] + "%' and " +
									"pd.number not like '%" + notContainNumber[4] + "%' and " +
									"pd.number not like '%" + notContainNumber[5] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				else if(startWith != null && startWith.length() == 2){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" ( pd.number like '" + startWithNumber[0] + "%' or" +
									" pd.number like '" + startWithNumber[1] + "%' ) " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
									"pd.number not like '%" + notContainNumber[1] + "%' and " +
									"pd.number not like '%" + notContainNumber[2] + "%' and " +
									"pd.number not like '%" + notContainNumber[3] + "%' and " +
									"pd.number not like '%" + notContainNumber[4] + "%' and " +
									"pd.number not like '%" + notContainNumber[5] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				else if(startWith != null && startWith.length() == 3){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" ( pd.number like '" + startWithNumber[0] + "%' or" +
									" pd.number like '" + startWithNumber[1] + "%'  or" +
									" pd.number like '" + startWithNumber[2] + "%' ) " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
									"pd.number not like '%" + notContainNumber[1] + "%' and " +
									"pd.number not like '%" + notContainNumber[2] + "%' and " +
									"pd.number not like '%" + notContainNumber[3] + "%' and " +
									"pd.number not like '%" + notContainNumber[4] + "%' and " +
									"pd.number not like '%" + notContainNumber[5] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				else if(startWith != null && startWith.length() == 4){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" ( pd.number like '" + startWithNumber[0] + "%' or" +
									" pd.number like '" + startWithNumber[1] + "%'  or" +
									" pd.number like '" + startWithNumber[2] + "%'  or" +
									" pd.number like '" + startWithNumber[3] + "%' ) " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
									"pd.number not like '%" + notContainNumber[1] + "%' and " +
									"pd.number not like '%" + notContainNumber[2] + "%' and " +
									"pd.number not like '%" + notContainNumber[3] + "%' and " +
									"pd.number not like '%" + notContainNumber[4] + "%' and " +
									"pd.number not like '%" + notContainNumber[5] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}

			case 7:
				if(startWith != null && startWith.length() == 1){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" pd.number like '" + startWithNumber[0] + "%' " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
									"pd.number not like '%" + notContainNumber[1] + "%' and " +
									"pd.number not like '%" + notContainNumber[2] + "%' and " +
									"pd.number not like '%" + notContainNumber[3] + "%' and " +
									"pd.number not like '%" + notContainNumber[4] + "%' and " +
									"pd.number not like '%" + notContainNumber[5] + "%' and " +
									"pd.number not like '%" + notContainNumber[6] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				else if(startWith != null && startWith.length() == 2){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" ( pd.number like '" + startWithNumber[0] + "%' or " +
									" pd.number like '" + startWithNumber[1] + "%' ) " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
									"pd.number not like '%" + notContainNumber[1] + "%' and " +
									"pd.number not like '%" + notContainNumber[2] + "%' and " +
									"pd.number not like '%" + notContainNumber[3] + "%' and " +
									"pd.number not like '%" + notContainNumber[4] + "%' and " +
									"pd.number not like '%" + notContainNumber[5] + "%' and " +
									"pd.number not like '%" + notContainNumber[6] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				else if(startWith != null && startWith.length() == 3){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" ( pd.number like '" + startWithNumber[0] + "%' or " +
									" pd.number like '" + startWithNumber[1] + "%' or " +
									" pd.number like '" + startWithNumber[2] + "%' ) " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
									"pd.number not like '%" + notContainNumber[1] + "%' and " +
									"pd.number not like '%" + notContainNumber[2] + "%' and " +
									"pd.number not like '%" + notContainNumber[3] + "%' and " +
									"pd.number not like '%" + notContainNumber[4] + "%' and " +
									"pd.number not like '%" + notContainNumber[5] + "%' and " +
									"pd.number not like '%" + notContainNumber[6] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				else if(startWith != null && startWith.length() == 4){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" ( pd.number like '" + startWithNumber[0] + "%' or " +
									" pd.number like '" + startWithNumber[1] + "%' or " +
									" pd.number like '" + startWithNumber[2] + "%' or " +
									" pd.number like '" + startWithNumber[3] + "%' ) " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
									"pd.number not like '%" + notContainNumber[1] + "%' and " +
									"pd.number not like '%" + notContainNumber[2] + "%' and " +
									"pd.number not like '%" + notContainNumber[3] + "%' and " +
									"pd.number not like '%" + notContainNumber[4] + "%' and " +
									"pd.number not like '%" + notContainNumber[5] + "%' and " +
									"pd.number not like '%" + notContainNumber[6] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}

			case 8:
				if(startWith != null && startWith.length() == 1){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" pd.number like '" + startWithNumber[0] + "%' " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
									"pd.number not like '%" + notContainNumber[1] + "%' and " +
									"pd.number not like '%" + notContainNumber[2] + "%' and " +
									"pd.number not like '%" + notContainNumber[3] + "%' and " +
									"pd.number not like '%" + notContainNumber[4] + "%' and " +
									"pd.number not like '%" + notContainNumber[5] + "%' and " +
									"pd.number not like '%" + notContainNumber[6] + "%' and " +
									"pd.number not like '%" + notContainNumber[7] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				else if(startWith != null && startWith.length() == 2){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" ( pd.number like '" + startWithNumber[0] + "%' or " +
									" pd.number like '" + startWithNumber[1] + "%' ) " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
									"pd.number not like '%" + notContainNumber[1] + "%' and " +
									"pd.number not like '%" + notContainNumber[2] + "%' and " +
									"pd.number not like '%" + notContainNumber[3] + "%' and " +
									"pd.number not like '%" + notContainNumber[4] + "%' and " +
									"pd.number not like '%" + notContainNumber[5] + "%' and " +
									"pd.number not like '%" + notContainNumber[6] + "%' and " +
									"pd.number not like '%" + notContainNumber[7] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				else if(startWith != null && startWith.length() == 3){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" ( pd.number like '" + startWithNumber[0] + "%' or " +
									" pd.number like '" + startWithNumber[1] + "%' or " +
									" pd.number like '" + startWithNumber[2] + "%' ) " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
									"pd.number not like '%" + notContainNumber[1] + "%' and " +
									"pd.number not like '%" + notContainNumber[2] + "%' and " +
									"pd.number not like '%" + notContainNumber[3] + "%' and " +
									"pd.number not like '%" + notContainNumber[4] + "%' and " +
									"pd.number not like '%" + notContainNumber[5] + "%' and " +
									"pd.number not like '%" + notContainNumber[6] + "%' and " +
									"pd.number not like '%" + notContainNumber[7] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				else if(startWith != null && startWith.length() == 4){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" ( pd.number like '" + startWithNumber[0] + "%' or " +
									" pd.number like '" + startWithNumber[1] + "%' or " +
									" pd.number like '" + startWithNumber[2] + "%' or " +
									" pd.number like '" + startWithNumber[3] + "%' ) " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
									"pd.number not like '%" + notContainNumber[1] + "%' and " +
									"pd.number not like '%" + notContainNumber[2] + "%' and " +
									"pd.number not like '%" + notContainNumber[3] + "%' and " +
									"pd.number not like '%" + notContainNumber[4] + "%' and " +
									"pd.number not like '%" + notContainNumber[5] + "%' and " +
									"pd.number not like '%" + notContainNumber[6] + "%' and " +
									"pd.number not like '%" + notContainNumber[7] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}

			case 9:
				if(startWith != null && startWith.length() == 1){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" pd.number like '" + startWithNumber[0] + "%' " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and (pd.number not like '%" +notContainNumber[0] + "%' and " +
									"pd.number not like '%" + notContainNumber[1] + "%' and " +
									"pd.number not like '%" + notContainNumber[2] + "%' and " +
									"pd.number not like '%" + notContainNumber[3] + "%' and " +
									"pd.number not like '%" + notContainNumber[4] + "%' and " +
									"pd.number not like '%" + notContainNumber[5] + "%' and " +
									"pd.number not like '%" + notContainNumber[6] + "%' and " +
									"pd.number not like '%" + notContainNumber[7] + "%' and " +
									"pd.number not like '%" + notContainNumber[8] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				if(startWith != null && startWith.length() == 2){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" ( pd.number like '" + startWithNumber[0] + "%' or " +
									" pd.number like '" + startWithNumber[1] + "%' ) " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and (pd.number not like '%" +notContainNumber[0] + "%' and " +
									"pd.number not like '%" + notContainNumber[1] + "%' and " +
									"pd.number not like '%" + notContainNumber[2] + "%' and " +
									"pd.number not like '%" + notContainNumber[3] + "%' and " +
									"pd.number not like '%" + notContainNumber[4] + "%' and " +
									"pd.number not like '%" + notContainNumber[5] + "%' and " +
									"pd.number not like '%" + notContainNumber[6] + "%' and " +
									"pd.number not like '%" + notContainNumber[7] + "%' and " +
									"pd.number not like '%" + notContainNumber[8] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				if(startWith != null && startWith.length() == 3){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" ( pd.number like '" + startWithNumber[0] + "%' or " +
									" pd.number like '" + startWithNumber[1] + "%' or " +
									" pd.number like '" + startWithNumber[2] + "%' ) " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and (pd.number not like '%" +notContainNumber[0] + "%' and " +
									"pd.number not like '%" + notContainNumber[1] + "%' and " +
									"pd.number not like '%" + notContainNumber[2] + "%' and " +
									"pd.number not like '%" + notContainNumber[3] + "%' and " +
									"pd.number not like '%" + notContainNumber[4] + "%' and " +
									"pd.number not like '%" + notContainNumber[5] + "%' and " +
									"pd.number not like '%" + notContainNumber[6] + "%' and " +
									"pd.number not like '%" + notContainNumber[7] + "%' and " +
									"pd.number not like '%" + notContainNumber[8] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
				if(startWith != null && startWith.length() == 4){
					return getJdbcTemplate().query(
							"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
									"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
									"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
									" where  pd.product_id = pod.product_id and " +
									" ( pd.number like '" + startWithNumber[0] + "%' or " +
									" pd.number like '" + startWithNumber[1] + "%' or " +
									" pd.number like '" + startWithNumber[2] + "%' or " +
									" pd.number like '" + startWithNumber[3] + "%' ) " +
									"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
									"and (pd.number not like '%" +notContainNumber[0] + "%' and " +
									"pd.number not like '%" + notContainNumber[1] + "%' and " +
									"pd.number not like '%" + notContainNumber[2] + "%' and " +
									"pd.number not like '%" + notContainNumber[3] + "%' and " +
									"pd.number not like '%" + notContainNumber[4] + "%' and " +
									"pd.number not like '%" + notContainNumber[5] + "%' and " +
									"pd.number not like '%" + notContainNumber[6] + "%' and " +
									"pd.number not like '%" + notContainNumber[7] + "%' and " +
									"pd.number not like '%" + notContainNumber[8] + "%' )" +
									"and  pd.number_status='Available'  and pd.status='Y' ",
							new BeanPropertyRowMapper(CustomProduct.class));
				}
		}

		return getJdbcTemplate().query(
				"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
						"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
						"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
						"where  pd.product_id = pod.product_id and" +
						" pd.number like '" + startWith + "%' and " +
						" pd.number not like '%" + notContainNumber[0] + "%' " +
						"and pod.rateInRupee between '"+priceLow+"' and '"+priceHigh+"' "+
						"and  pd.number_status='Available'  and pd.status='Y' ",
				new BeanPropertyRowMapper(CustomProduct.class));
	}

	public List<CustomProduct> productListSearchFilter(String priceRange,String [] startWithNumber,String [] notContainNumber, String orderBy){
		String []parts=priceRange.split("-");
		String priceLow=parts[0];
		String priceHigh=parts[1];
		String startWith= String.join("",startWithNumber);
			switch (notContainNumber.length) {
				case 1:
					if(startWith != null && startWith.length() == 1){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and" +
										" pd.number like '" + startWithNumber[0] + "%' and " +
										" pd.number not like '%" + notContainNumber[0] + "%' " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
					else if(startWith != null && startWith.length() == 2){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and" +
										" ( pd.number like '" + startWithNumber[0] + "%' or " +
										" pd.number like '" + startWithNumber[1] + "%' ) and " +
										" pd.number not like '%" + notContainNumber[0] + "%' " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
					else if(startWith != null && startWith.length() == 3){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and" +
										" ( pd.number like '" + startWithNumber[0] + "%' or " +
										" pd.number like '" + startWithNumber[1] + "%' or " +
										" pd.number like '" + startWithNumber[2] + "%' ) and " +
										" pd.number not like '%" + notContainNumber[0] + "%' " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
					else if(startWith != null && startWith.length() == 4){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										"where  pd.product_id = pod.product_id and" +
										" ( pd.number like '" + startWithNumber[0] + "%' or " +
										" pd.number like '" + startWithNumber[1] + "%' or " +
										" pd.number like '" + startWithNumber[2] + "%' or " +
										" pd.number like '" + startWithNumber[3] + "%' ) and " +
										" pd.number not like '%" + notContainNumber[0] + "%' " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}

				case 2:
					if(startWith != null && startWith.length() == 1){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" pd.number like '" + startWithNumber[0] + "%' " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' and " +
										"(pd.number not like '%" + notContainNumber[0] + "%' and " +
										"pd.number not like '%" + notContainNumber[1] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
					else if(startWith != null && startWith.length() == 2){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" ( pd.number like '" + startWithNumber[0] + "%' or" +
										" pd.number like '" + startWithNumber[1] + "%' ) " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' and " +
										"(pd.number not like '%" + notContainNumber[0] + "%' and " +
										"pd.number not like '%" + notContainNumber[1] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
					else if(startWith != null && startWith.length() == 3){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" ( pd.number like '" + startWithNumber[0] + "%' or" +
										" ( pd.number like '" + startWithNumber[1] + "%' or" +
										" pd.number like '" + startWithNumber[2] + "%' ) " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' and " +
										"(pd.number not like '%" + notContainNumber[0] + "%' and " +
										"pd.number not like '%" + notContainNumber[1] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
					else if(startWith != null && startWith.length() == 4){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" ( pd.number like '" + startWithNumber[0] + "%' or" +
										" ( pd.number like '" + startWithNumber[1] + "%' or" +
										" ( pd.number like '" + startWithNumber[2] + "%' or" +
										" pd.number like '" + startWithNumber[3] + "%' ) " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' and " +
										"(pd.number not like '%" + notContainNumber[0] + "%' and " +
										"pd.number not like '%" + notContainNumber[1] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}

				case 3:
					 if(startWith != null && startWith.length() == 1){
						 return getJdbcTemplate().query(
								 "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										 "pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										 "pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										 " where  pd.product_id = pod.product_id and " +
										 " pd.number like '" + startWithNumber[0] + "%' " +
										 "and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										 "and pd.number not like '%" + notContainNumber[0] + "%' " +
										 "and pd.number not like '%" + notContainNumber[1] + "%' " +
										 "and pd.number not like '%" + notContainNumber[2] + "%' " +
										 "and  pd.number_status='Available'  and pd.status='Y' " +
										 "order by " +
										 " pod.rateInRupee " + orderBy,
								 new BeanPropertyRowMapper(CustomProduct.class));
					}
					 else if(startWith != null && startWith.length() == 2){
						 return getJdbcTemplate().query(
								 "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										 "pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										 "pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										 " where  pd.product_id = pod.product_id and " +
										 " (pd.number like '" + startWithNumber[0] + "%' or " +
										 " (pd.number like '" + startWithNumber[1] + "%' ) " +
										 "and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										 "and pd.number not like '%" + notContainNumber[0] + "%' and " +
										 "and pd.number not like '%" + notContainNumber[1] + "%' and " +
										 "and pd.number not like '%" + notContainNumber[2] + "%' and " +
										 "and  pd.number_status='Available'  and pd.status='Y' " +
										 "order by " +
										 " pod.rateInRupee " + orderBy,
								 new BeanPropertyRowMapper(CustomProduct.class));
					 }
					 else if(startWith != null && startWith.length() == 3){
						 return getJdbcTemplate().query(
								 "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										 "pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										 "pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										 " where  pd.product_id = pod.product_id and " +
										 " (pd.number like '" + startWithNumber[0] + "%' or " +
										 " (pd.number like '" + startWithNumber[1] + "%' or " +
										 " (pd.number like '" + startWithNumber[2] + "%' ) " +
										 "and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										 "and pd.number not like '%" + notContainNumber[0] + "%' and " +
										 "and pd.number not like '%" + notContainNumber[1] + "%' and " +
										 "and pd.number not like '%" + notContainNumber[2] + "%' and " +
										 "and  pd.number_status='Available'  and pd.status='Y' " +
										 "order by " +
										 " pod.rateInRupee " + orderBy,
								 new BeanPropertyRowMapper(CustomProduct.class));
					 }
					 else if(startWith != null && startWith.length() == 4){
						 return getJdbcTemplate().query(
								 "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										 "pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										 "pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										 " where  pd.product_id = pod.product_id and " +
										 " (pd.number like '" + startWithNumber[0] + "%' or " +
										 " (pd.number like '" + startWithNumber[1] + "%' or " +
										 " (pd.number like '" + startWithNumber[2] + "%' or " +
										 " (pd.number like '" + startWithNumber[3] + "%' ) " +
										 "and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										 "and pd.number not like '%" + notContainNumber[0] + "%' " +
										 "and pd.number not like '%" + notContainNumber[1] + "%' " +
										 "and pd.number not like '%" + notContainNumber[2] + "%' " +
										 "and  pd.number_status='Available'  and pd.status='Y' " +
										 "order by " +
										 " pod.rateInRupee " + orderBy,
								 new BeanPropertyRowMapper(CustomProduct.class));
					 }

				case 4:
					if(startWith != null && startWith.length() == 1){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" pd.number like '" + startWithNumber[0] + "%' " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
										"pd.number not like '%" + notContainNumber[1] + "%' and " +
										"pd.number not like '%" + notContainNumber[2] + "%' and " +
										"pd.number not like '%" + notContainNumber[3] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
					else if(startWith != null && startWith.length() == 2){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" ( pd.number like '" + startWithNumber[0] + "%' or " +
										" pd.number like '" + startWithNumber[1] + "%' ) " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
										"pd.number not like '%" + notContainNumber[1] + "%' and " +
										"pd.number not like '%" + notContainNumber[2] + "%' and " +
										"pd.number not like '%" + notContainNumber[3] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
					else if(startWith != null && startWith.length() == 3){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" ( pd.number like '" + startWithNumber[0] + "%' or " +
										"  pd.number like '" + startWithNumber[1] + "%' or " +
										" pd.number like '" + startWithNumber[2] + "%' ) " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
										"pd.number not like '%" + notContainNumber[1] + "%' and " +
										"pd.number not like '%" + notContainNumber[2] + "%' and " +
										"pd.number not like '%" + notContainNumber[3] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
					else if(startWith != null && startWith.length() == 4){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" ( pd.number like '" + startWithNumber[0] + "%' or " +
										"  pd.number like '" + startWithNumber[1] + "%' or " +
										"  pd.number like '" + startWithNumber[2] + "%' or " +
										" pd.number like '" + startWithNumber[3] + "%' ) " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
										"pd.number not like '%" + notContainNumber[1] + "%' and " +
										"pd.number not like '%" + notContainNumber[2] + "%' and " +
										"pd.number not like '%" + notContainNumber[3] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}

				case 5:
					if(startWith != null && startWith.length() == 1){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" pd.number like '" + startWithNumber[0] + "%' " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and (pd.number not like '%" + notContainNumber[0] + "%' and  " +
										"pd.number not like '%" + notContainNumber[1] + "%' and " +
										"pd.number not like '%" + notContainNumber[2] + "%' and " +
										"pd.number not like '%" + notContainNumber[3] + "%' and " +
										"pd.number not like '%" + notContainNumber[4] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
					else if(startWith != null && startWith.length() == 2){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" ( pd.number like '" + startWithNumber[0] + "%' or " +
										" pd.number like '" + startWithNumber[1] + "%' )" +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and (pd.number not like '%" + notContainNumber[0] + "%' and  " +
										"pd.number not like '%" + notContainNumber[1] + "%' and " +
										"pd.number not like '%" + notContainNumber[2] + "%' and " +
										"pd.number not like '%" + notContainNumber[3] + "%' and " +
										"pd.number not like '%" + notContainNumber[4] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
					else if(startWith != null && startWith.length() == 3){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" ( pd.number like '" + startWithNumber[0] + "%' or " +
										" pd.number like '" + startWithNumber[1] + "%' or " +
										" pd.number like '" + startWithNumber[2] + "%' )" +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and (pd.number not like '%" + notContainNumber[0] + "%' and  " +
										"pd.number not like '%" + notContainNumber[1] + "%' and " +
										"pd.number not like '%" + notContainNumber[2] + "%' and " +
										"pd.number not like '%" + notContainNumber[3] + "%' and " +
										"pd.number not like '%" + notContainNumber[4] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
					else if(startWith != null && startWith.length() == 4){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" ( pd.number like '" + startWithNumber[0] + "%' or " +
										" pd.number like '" + startWithNumber[1] + "%' or " +
										" pd.number like '" + startWithNumber[2] + "%' or " +
										" pd.number like '" + startWithNumber[3] + "%' )" +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and (pd.number not like '%" + notContainNumber[0] + "%' and  " +
										"pd.number not like '%" + notContainNumber[1] + "%' and " +
										"pd.number not like '%" + notContainNumber[2] + "%' and " +
										"pd.number not like '%" + notContainNumber[3] + "%' and " +
										"pd.number not like '%" + notContainNumber[4] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}

				case 6:
					if(startWith != null && startWith.length() == 1){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" pd.number like '" + startWithNumber[0] + "%' " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
										"pd.number not like '%" + notContainNumber[1] + "%' and " +
										"pd.number not like '%" + notContainNumber[2] + "%' and " +
										"pd.number not like '%" + notContainNumber[3] + "%' and " +
										"pd.number not like '%" + notContainNumber[4] + "%' and " +
										"pd.number not like '%" + notContainNumber[5] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
					else if(startWith != null && startWith.length() == 2){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" ( pd.number like '" + startWithNumber[0] + "%' or" +
										" pd.number like '" + startWithNumber[1] + "%' ) " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
										"pd.number not like '%" + notContainNumber[1] + "%' and " +
										"pd.number not like '%" + notContainNumber[2] + "%' and " +
										"pd.number not like '%" + notContainNumber[3] + "%' and " +
										"pd.number not like '%" + notContainNumber[4] + "%' and " +
										"pd.number not like '%" + notContainNumber[5] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
					else if(startWith != null && startWith.length() == 3){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" ( pd.number like '" + startWithNumber[0] + "%' or" +
										" pd.number like '" + startWithNumber[1] + "%'  or" +
										" pd.number like '" + startWithNumber[2] + "%' ) " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
										"pd.number not like '%" + notContainNumber[1] + "%' and " +
										"pd.number not like '%" + notContainNumber[2] + "%' and " +
										"pd.number not like '%" + notContainNumber[3] + "%' and " +
										"pd.number not like '%" + notContainNumber[4] + "%' and " +
										"pd.number not like '%" + notContainNumber[5] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
					else if(startWith != null && startWith.length() == 4){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" ( pd.number like '" + startWithNumber[0] + "%' or" +
										" pd.number like '" + startWithNumber[1] + "%'  or" +
										" pd.number like '" + startWithNumber[2] + "%'  or" +
										" pd.number like '" + startWithNumber[3] + "%' ) " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
										"pd.number not like '%" + notContainNumber[1] + "%' and " +
										"pd.number not like '%" + notContainNumber[2] + "%' and " +
										"pd.number not like '%" + notContainNumber[3] + "%' and " +
										"pd.number not like '%" + notContainNumber[4] + "%' and " +
										"pd.number not like '%" + notContainNumber[5] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}

				case 7:
					if(startWith != null && startWith.length() == 1){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" pd.number like '" + startWithNumber[0] + "%' " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
										"pd.number not like '%" + notContainNumber[1] + "%' and " +
										"pd.number not like '%" + notContainNumber[2] + "%' and " +
										"pd.number not like '%" + notContainNumber[3] + "%' and " +
										"pd.number not like '%" + notContainNumber[4] + "%' and " +
										"pd.number not like '%" + notContainNumber[5] + "%' and " +
										"pd.number not like '%" + notContainNumber[6] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
					else if(startWith != null && startWith.length() == 2){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" ( pd.number like '" + startWithNumber[0] + "%' or " +
										" pd.number like '" + startWithNumber[1] + "%' ) " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
										"pd.number not like '%" + notContainNumber[1] + "%' and " +
										"pd.number not like '%" + notContainNumber[2] + "%' and " +
										"pd.number not like '%" + notContainNumber[3] + "%' and " +
										"pd.number not like '%" + notContainNumber[4] + "%' and " +
										"pd.number not like '%" + notContainNumber[5] + "%' and " +
										"pd.number not like '%" + notContainNumber[6] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
					else if(startWith != null && startWith.length() == 3){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" ( pd.number like '" + startWithNumber[0] + "%' or " +
										" pd.number like '" + startWithNumber[1] + "%' or " +
										" pd.number like '" + startWithNumber[2] + "%' ) " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
										"pd.number not like '%" + notContainNumber[1] + "%' and " +
										"pd.number not like '%" + notContainNumber[2] + "%' and " +
										"pd.number not like '%" + notContainNumber[3] + "%' and " +
										"pd.number not like '%" + notContainNumber[4] + "%' and " +
										"pd.number not like '%" + notContainNumber[5] + "%' and " +
										"pd.number not like '%" + notContainNumber[6] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
					else if(startWith != null && startWith.length() == 4){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" ( pd.number like '" + startWithNumber[0] + "%' or " +
										" pd.number like '" + startWithNumber[1] + "%' or " +
										" pd.number like '" + startWithNumber[2] + "%' or " +
										" pd.number like '" + startWithNumber[3] + "%' ) " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
										"pd.number not like '%" + notContainNumber[1] + "%' and " +
										"pd.number not like '%" + notContainNumber[2] + "%' and " +
										"pd.number not like '%" + notContainNumber[3] + "%' and " +
										"pd.number not like '%" + notContainNumber[4] + "%' and " +
										"pd.number not like '%" + notContainNumber[5] + "%' and " +
										"pd.number not like '%" + notContainNumber[6] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}

				case 8:
					if(startWith != null && startWith.length() == 1){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" pd.number like '" + startWithNumber[0] + "%' " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
										"pd.number not like '%" + notContainNumber[1] + "%' and " +
										"pd.number not like '%" + notContainNumber[2] + "%' and " +
										"pd.number not like '%" + notContainNumber[3] + "%' and " +
										"pd.number not like '%" + notContainNumber[4] + "%' and " +
										"pd.number not like '%" + notContainNumber[5] + "%' and " +
										"pd.number not like '%" + notContainNumber[6] + "%' and " +
										"pd.number not like '%" + notContainNumber[7] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
					else if(startWith != null && startWith.length() == 2){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" ( pd.number like '" + startWithNumber[0] + "%' or " +
										" pd.number like '" + startWithNumber[1] + "%' ) " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
										"pd.number not like '%" + notContainNumber[1] + "%' and " +
										"pd.number not like '%" + notContainNumber[2] + "%' and " +
										"pd.number not like '%" + notContainNumber[3] + "%' and " +
										"pd.number not like '%" + notContainNumber[4] + "%' and " +
										"pd.number not like '%" + notContainNumber[5] + "%' and " +
										"pd.number not like '%" + notContainNumber[6] + "%' and " +
										"pd.number not like '%" + notContainNumber[7] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
					else if(startWith != null && startWith.length() == 3){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" ( pd.number like '" + startWithNumber[0] + "%' or " +
										" pd.number like '" + startWithNumber[1] + "%' or " +
										" pd.number like '" + startWithNumber[2] + "%' ) " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
										"pd.number not like '%" + notContainNumber[1] + "%' and " +
										"pd.number not like '%" + notContainNumber[2] + "%' and " +
										"pd.number not like '%" + notContainNumber[3] + "%' and " +
										"pd.number not like '%" + notContainNumber[4] + "%' and " +
										"pd.number not like '%" + notContainNumber[5] + "%' and " +
										"pd.number not like '%" + notContainNumber[6] + "%' and " +
										"pd.number not like '%" + notContainNumber[7] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
					else if(startWith != null && startWith.length() == 4){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" ( pd.number like '" + startWithNumber[0] + "%' or " +
										" pd.number like '" + startWithNumber[1] + "%' or " +
										" pd.number like '" + startWithNumber[2] + "%' or " +
										" pd.number like '" + startWithNumber[3] + "%' ) " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and (pd.number not like '%" + notContainNumber[0] + "%' and " +
										"pd.number not like '%" + notContainNumber[1] + "%' and " +
										"pd.number not like '%" + notContainNumber[2] + "%' and " +
										"pd.number not like '%" + notContainNumber[3] + "%' and " +
										"pd.number not like '%" + notContainNumber[4] + "%' and " +
										"pd.number not like '%" + notContainNumber[5] + "%' and " +
										"pd.number not like '%" + notContainNumber[6] + "%' and " +
										"pd.number not like '%" + notContainNumber[7] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}

				case 9:
					if(startWith != null && startWith.length() == 1){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" pd.number like '" + startWithNumber[0] + "%' " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and (pd.number not like '%" +notContainNumber[0] + "%' and " +
										"pd.number not like '%" + notContainNumber[1] + "%' and " +
										"pd.number not like '%" + notContainNumber[2] + "%' and " +
										"pd.number not like '%" + notContainNumber[3] + "%' and " +
										"pd.number not like '%" + notContainNumber[4] + "%' and " +
										"pd.number not like '%" + notContainNumber[5] + "%' and " +
										"pd.number not like '%" + notContainNumber[6] + "%' and " +
										"pd.number not like '%" + notContainNumber[7] + "%' and " +
										"pd.number not like '%" + notContainNumber[8] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
					if(startWith != null && startWith.length() == 2){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" ( pd.number like '" + startWithNumber[0] + "%' or " +
										" pd.number like '" + startWithNumber[1] + "%' ) " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and (pd.number not like '%" +notContainNumber[0] + "%' and " +
										"pd.number not like '%" + notContainNumber[1] + "%' and " +
										"pd.number not like '%" + notContainNumber[2] + "%' and " +
										"pd.number not like '%" + notContainNumber[3] + "%' and " +
										"pd.number not like '%" + notContainNumber[4] + "%' and " +
										"pd.number not like '%" + notContainNumber[5] + "%' and " +
										"pd.number not like '%" + notContainNumber[6] + "%' and " +
										"pd.number not like '%" + notContainNumber[7] + "%' and " +
										"pd.number not like '%" + notContainNumber[8] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
					if(startWith != null && startWith.length() == 3){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" ( pd.number like '" + startWithNumber[0] + "%' or " +
										" pd.number like '" + startWithNumber[1] + "%' or " +
										" pd.number like '" + startWithNumber[2] + "%' ) " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and (pd.number not like '%" +notContainNumber[0] + "%' and " +
										"pd.number not like '%" + notContainNumber[1] + "%' and " +
										"pd.number not like '%" + notContainNumber[2] + "%' and " +
										"pd.number not like '%" + notContainNumber[3] + "%' and " +
										"pd.number not like '%" + notContainNumber[4] + "%' and " +
										"pd.number not like '%" + notContainNumber[5] + "%' and " +
										"pd.number not like '%" + notContainNumber[6] + "%' and " +
										"pd.number not like '%" + notContainNumber[7] + "%' and " +
										"pd.number not like '%" + notContainNumber[8] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
					if(startWith != null && startWith.length() == 4){
						return getJdbcTemplate().query(
								"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
										"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
										"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
										" where  pd.product_id = pod.product_id and " +
										" ( pd.number like '" + startWithNumber[0] + "%' or " +
										" pd.number like '" + startWithNumber[1] + "%' or " +
										" pd.number like '" + startWithNumber[2] + "%' or " +
										" pd.number like '" + startWithNumber[3] + "%' ) " +
										"and pod.rateInRupee between '" + priceLow + "' and '" + priceHigh + "' " +
										"and (pd.number not like '%" +notContainNumber[0] + "%' and " +
										"pd.number not like '%" + notContainNumber[1] + "%' and " +
										"pd.number not like '%" + notContainNumber[2] + "%' and " +
										"pd.number not like '%" + notContainNumber[3] + "%' and " +
										"pd.number not like '%" + notContainNumber[4] + "%' and " +
										"pd.number not like '%" + notContainNumber[5] + "%' and " +
										"pd.number not like '%" + notContainNumber[6] + "%' and " +
										"pd.number not like '%" + notContainNumber[7] + "%' and " +
										"pd.number not like '%" + notContainNumber[8] + "%' )" +
										"and  pd.number_status='Available'  and pd.status='Y' " +
										"order by " +
										" pod.rateInRupee " + orderBy,
								new BeanPropertyRowMapper(CustomProduct.class));
					}
		}

		 return getJdbcTemplate().query(
				"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee, " +
						"pod.rateInDollar,pod.discount,pd.productCode,pd.liters, " +
						"pd.trap from ProductDetails pd, ProductOtherDetails pod " +
						"where  pd.product_id = pod.product_id and" +
						" pd.number like '" + startWith + "%' and " +
						" pd.number not like '%" + notContainNumber[0] + "%' " +
						"and pod.rateInRupee between '"+priceLow+"' and '"+priceHigh+"' "+
						"and  pd.number_status='Available'  and pd.status='Y' " +
						"order by " +
						" pod.rateInRupee " + orderBy,
				new BeanPropertyRowMapper(CustomProduct.class));
	}

		@SuppressWarnings("unchecked")
	public List<CustomProduct> getProductListSearchPriceFilter(String priceLow, String priceHigh){
		return getJdbcTemplate().query(
			    "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  pd.product_id = pod.product_id and pod.rateInRupee between '"+priceLow+"' and '"+priceHigh+"' and  pd.number_status='Available'  and pd.status='Y' order by pd.product_id desc",new BeanPropertyRowMapper(CustomProduct.class));
	}
	public List<CustomProduct>getProductListWithout248(String orderBy){
		if(orderBy.equalsIgnoreCase("low")){
			orderBy="asc";

		}
		else {
			orderBy="desc";
		}
		return getJdbcTemplate().query(
				"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar," +
						"pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  " +
						"pd.product_id = pod.product_id and pd.number not like '%2%' and  pd.number not like '%4%' " +
						"and pd.number not like '%8%' and pd.number_status='Available'  and " +
						"pd.status='Y' order by pod.rateInRupee " + orderBy  ,new BeanPropertyRowMapper(CustomProduct.class));

	}

	@SuppressWarnings("unchecked")
	public List<CustomProduct> getProductListSearchPriceFilter(String priceLow, String priceHigh, String price){
		return getJdbcTemplate().query(
			    "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  pd.product_id = pod.product_id and pod.rateInRupee between '"+priceLow+"' and '"+priceHigh+"' and  pd.number_status='Available'  and pd.status='Y' order by pod.rateInRupee "+price+"",new BeanPropertyRowMapper(CustomProduct.class));
	}

	@SuppressWarnings("unchecked")
	public List<CustomProduct> getProductListSearchPrice(String product, String price){
		return getJdbcTemplate().query(
			    "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  pd.product_id = pod.product_id and pd.number like '%"+product+"%' and  pd.number_status='Available'  and pd.status='Y' order by pod.rateInRupee "+price+"",new BeanPropertyRowMapper(CustomProduct.class));
	}

	@SuppressWarnings("unchecked")
	public List<CustomProduct> getProductListSearchSumTotal(String product){
		return getJdbcTemplate().query(
			    "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  pd.product_id = pod.product_id and pd.trap = "+product+" and  pd.number_status='Available'  and pd.status='Y' order by pd.product_id desc",new BeanPropertyRowMapper(CustomProduct.class));
	}

	@SuppressWarnings("unchecked")
	public List<CustomProduct> getProductListSearchSumTotalTwo(String product){
		return getJdbcTemplate().query(
			    "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  pd.product_id = pod.product_id and pd.liters = "+product+" and  pd.number_status='Available'  and pd.status='Y' order by pd.product_id desc",new BeanPropertyRowMapper(CustomProduct.class));
	}

	@SuppressWarnings("unchecked")
	public List<CustomProduct> getProductListSearchSumTotalPrice(String product, String price){
		return getJdbcTemplate().query(
			    "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  pd.product_id = pod.product_id and pd.trap = "+product+" and  pd.number_status='Available'  and pd.status='Y' order by pod.rateInRupee "+price+"",new BeanPropertyRowMapper(CustomProduct.class));
	}

	@SuppressWarnings("unchecked")
	public List<CustomProduct> getProductListSearchSumTotalTwoPrice(String product, String price){
		return getJdbcTemplate().query(
			    "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount,pd.productCode,pd.liters,pd.trap from ProductDetails pd, ProductOtherDetails pod where  pd.product_id = pod.product_id and pd.liters = "+product+" and  pd.number_status='Available'  and pd.status='Y' order by pod.rateInRupee "+price+"",new BeanPropertyRowMapper(CustomProduct.class));
	}

	@SuppressWarnings("unchecked")
	public List<CustomProduct> getProductBrandSearch(String product){
		return getJdbcTemplate().query(
			    "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pid.img_loc,pod.discount,pd.productCode from ProductDetails pd, ProductImageDetails pid, ProductOtherDetails pod where pd.product_id = pid.product_id and pd.product_id = pod.product_id and pid.img_seq_no='1' and pd.productBrand like '%"+product+"%' order by pd.product_id desc",new BeanPropertyRowMapper(CustomProduct.class));
	}

	@SuppressWarnings("unchecked")
	public List<CustomProduct> getProductImageList(int prodId){
		return getJdbcTemplate().query(
			    "select img_loc from ProductImageDetails where product_id = "+prodId+" order by img_seq_no",new BeanPropertyRowMapper(CustomProduct.class));
	}

	@SuppressWarnings("unchecked")
	public List<CustomProduct> getProductCategoryList(String cateId){
		return getJdbcTemplate().query(
			    "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount, pd.productBrand,pd.productCode,pd.liters,pd.trap from ProductDetails pd, categories c,  ProductOtherDetails pod where c.cate_id = pd.cate_id and pd.product_id = pod.product_id  and pd.cate_id in ("+cateId+") and number_status='Available'  and pd.status='Y' order by pd.updated_date desc",new BeanPropertyRowMapper(CustomProduct.class));
	}

	public List<CustomProduct> getProductCategoryListSortedNum(String cateId, String orderBy){
		return getJdbcTemplate().query(
				"select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount, pd.productBrand,pd.productCode,pd.liters,pd.trap from ProductDetails pd, categories c,  ProductOtherDetails pod where c.cate_id = pd.cate_id and pd.product_id = pod.product_id  and pd.cate_id in ("+cateId+") and number_status='Available'  and pd.status='Y' order by pd.number " + orderBy ,new BeanPropertyRowMapper(CustomProduct.class));
	}

	@SuppressWarnings("unchecked")
	public List<CustomProduct> getProductfilterCategoryList(String cateId, String price){
		return getJdbcTemplate().query(
			    "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pod.discount, pd.productBrand,pd.productCode,pd.liters,pd.trap from ProductDetails pd, categories c,  ProductOtherDetails pod where c.cate_id = pd.cate_id and pd.product_id = pod.product_id  and pd.cate_id in ("+cateId+") and number_status='Available'  and pd.status='Y' order by pod.rateInRupee "+price+" ",new BeanPropertyRowMapper(CustomProduct.class));
	}

	@SuppressWarnings("unchecked")
	public List<CustomProduct> getProductfiltersCategoryList(String cateId, String price, String brand){
		return getJdbcTemplate().query(
			    "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pid.img_loc, pod.discount, pd.productBrand from ProductDetails pd, categories c, ProductImageDetails pid, ProductOtherDetails pod where c.cate_id = pd.cate_id and pd.product_id = pid.product_id and pd.product_id = pod.product_id and pid.img_seq_no='1' and pd.productBrand='"+brand+"' and  pd.cate_id in ("+cateId+") order by pod.rateInRupee "+price+" ",new BeanPropertyRowMapper(CustomProduct.class));
	}

	@SuppressWarnings("unchecked")
	public List<CustomProduct> getProductCategoryList(){
		return getJdbcTemplate().query(
			    "select pd.product_id product_id,pd.productName,pd.number,pd.type,pod.rateInRupee,pod.rateInDollar,pid.img_loc, pod.discount,pd.productCode from ProductDetails pd, categories c, ProductImageDetails pid, ProductOtherDetails pod where c.cate_id = pd.cate_id and pd.product_id = pid.product_id and pd.product_id = pod.product_id and pid.img_seq_no='1' and discount>0",new BeanPropertyRowMapper(CustomProduct.class));
	}


	public Map<String, Object> getCustomerDetails(String loginId, String password) {
		try {

		CustomerLoginDetail customerLoginDetail = getJdbcTemplate().queryForObject(QueryConstants.CUSTOMER_LOGIN_QUERY, ParameterizedBeanPropertyRowMapper.newInstance(CustomerLoginDetail.class) , new Object[]{loginId,password});
        //System.out.println(customerLoginDetail.getCust_id());
        if(customerLoginDetail != null) {
                CustomerAddressDetails billingAddressDetails = getJdbcTemplate().queryForObject(QueryConstants.CUSTOMER_BILLING_ADDRESS_SINGLE_DATE_QUERY, ParameterizedBeanPropertyRowMapper.newInstance(CustomerAddressDetails.class) , customerLoginDetail.getCust_id());
                CustomerAddressDetails shippingAddressDetails = getJdbcTemplate().queryForObject(QueryConstants.CUSTOMER_SHIPPING_ADDRESS_SINGLE_DATE_QUERY, ParameterizedBeanPropertyRowMapper.newInstance(CustomerAddressDetails.class) , customerLoginDetail.getCust_id());
                Map<String, Object> details = new HashMap<String, Object>();
                details.put("custLoginDetails", customerLoginDetail);
                details.put("custBillingDetails", billingAddressDetails);
                details.put("custShippingDetails", shippingAddressDetails);
                return details;
		        }
		} catch (Exception e) {
		        e.printStackTrace();
		}
		return null;
	}

	public Map<String, Object> getCustomerDetailsMobile(String loginId, String password) {
		try {

		CustomerLoginDetail customerLoginDetail = getJdbcTemplate().queryForObject(QueryConstants.CUSTOMER_LOGIN_QUERY_MObile, ParameterizedBeanPropertyRowMapper.newInstance(CustomerLoginDetail.class) , new Object[]{loginId,password});
        //System.out.println(customerLoginDetail.getCust_id());
        if(customerLoginDetail != null) {
                CustomerAddressDetails billingAddressDetails = getJdbcTemplate().queryForObject(QueryConstants.CUSTOMER_BILLING_ADDRESS_SINGLE_DATE_QUERY, ParameterizedBeanPropertyRowMapper.newInstance(CustomerAddressDetails.class) , customerLoginDetail.getCust_id());
                CustomerAddressDetails shippingAddressDetails = getJdbcTemplate().queryForObject(QueryConstants.CUSTOMER_SHIPPING_ADDRESS_SINGLE_DATE_QUERY, ParameterizedBeanPropertyRowMapper.newInstance(CustomerAddressDetails.class) , customerLoginDetail.getCust_id());
                Map<String, Object> details = new HashMap<String, Object>();
                details.put("custLoginDetails", customerLoginDetail);
                details.put("custBillingDetails", billingAddressDetails);
                details.put("custShippingDetails", shippingAddressDetails);
                return details;
		        }
		} catch (Exception e) {
		        e.printStackTrace();
		}
		return null;
	}


	public Map<String, Object> getCustomerDetailsOTP(String loginId) {
		try {

		CustomerLoginDetail customerLoginDetail = getJdbcTemplate().queryForObject(QueryConstants.CUSTOMER_LOGIN_QUERY_OTP, ParameterizedBeanPropertyRowMapper.newInstance(CustomerLoginDetail.class) , new Object[]{loginId});
        //System.out.println(customerLoginDetail.getCust_id());
        if(customerLoginDetail != null) {
                CustomerAddressDetails billingAddressDetails = getJdbcTemplate().queryForObject(QueryConstants.CUSTOMER_BILLING_ADDRESS_SINGLE_DATE_QUERY, ParameterizedBeanPropertyRowMapper.newInstance(CustomerAddressDetails.class) , customerLoginDetail.getCust_id());
                CustomerAddressDetails shippingAddressDetails = getJdbcTemplate().queryForObject(QueryConstants.CUSTOMER_SHIPPING_ADDRESS_SINGLE_DATE_QUERY, ParameterizedBeanPropertyRowMapper.newInstance(CustomerAddressDetails.class) , customerLoginDetail.getCust_id());
                Map<String, Object> details = new HashMap<String, Object>();
                details.put("custLoginDetails", customerLoginDetail);
                details.put("custBillingDetails", billingAddressDetails);
                details.put("custShippingDetails", shippingAddressDetails);
                return details;
		        }
		} catch (Exception e) {
		        e.printStackTrace();
		}
		return null;
	}

	public Map<String, Object> getCustomerDetailsMobileOTP(String loginId) {
		try {

		CustomerLoginDetail customerLoginDetail = getJdbcTemplate().queryForObject(QueryConstants.CUSTOMER_LOGIN_QUERY_MObile_OTP, ParameterizedBeanPropertyRowMapper.newInstance(CustomerLoginDetail.class) , new Object[]{loginId});
        //System.out.println(customerLoginDetail.getCust_id());
        if(customerLoginDetail != null) {
                CustomerAddressDetails billingAddressDetails = getJdbcTemplate().queryForObject(QueryConstants.CUSTOMER_BILLING_ADDRESS_SINGLE_DATE_QUERY, ParameterizedBeanPropertyRowMapper.newInstance(CustomerAddressDetails.class) , customerLoginDetail.getCust_id());
                CustomerAddressDetails shippingAddressDetails = getJdbcTemplate().queryForObject(QueryConstants.CUSTOMER_SHIPPING_ADDRESS_SINGLE_DATE_QUERY, ParameterizedBeanPropertyRowMapper.newInstance(CustomerAddressDetails.class) , customerLoginDetail.getCust_id());
                Map<String, Object> details = new HashMap<String, Object>();
                details.put("custLoginDetails", customerLoginDetail);
                details.put("custBillingDetails", billingAddressDetails);
                details.put("custShippingDetails", shippingAddressDetails);
                return details;
		        }
		} catch (Exception e) {
		        e.printStackTrace();
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public List<MasterLookUp> getCountryList(){
		List<MasterLookUp> stateList = getJdbcTemplate().query(
			    "select LookupCode,LookupMeaning from Master_Lookup_Value where LookupName='country_list'",new BeanPropertyRowMapper(MasterLookUp.class));
		return stateList;
	}

	@SuppressWarnings("unchecked")
	public List<MasterLookUp> getStateList(){
		List<MasterLookUp> districtList = getJdbcTemplate().query(
			    "select LookupCode,LookupMeaning from Master_Lookup_Value where LookupName='state_list'",new BeanPropertyRowMapper(MasterLookUp.class));
		return districtList;
	}


	@SuppressWarnings("unchecked")
	public List<MasterLookUp> getStateListFromCountry(String value){
		List<MasterLookUp> districtListFromState = getJdbcTemplate().query(
			    "select LookupCode,LookupMeaning from Master_Lookup_Value where LookupName='state_list' and value1='"+value+"'",new BeanPropertyRowMapper(MasterLookUp.class));
		return districtListFromState;
	}

	@SuppressWarnings("unchecked")
	public List<MasterLookUp> getPincodeListFromCountry(String value){
		List<MasterLookUp> districtListFromState = getJdbcTemplate().query(
			    "SELECT LookupCode,LookupMeaning FROM Master_Lookup_Value where value2 like '%"+value+"%'",new BeanPropertyRowMapper(MasterLookUp.class));
		return districtListFromState;
	}

	public Map<String,String> getMasterLookUp(){
		return getJdbcTemplate().query("select LookupCode,LookupMeaning from Master_Lookup_Value", new ResultSetExtractor<Map<String,String>>() {
			Map<String,String> map =new HashMap<String, String>();
		@Override
		public Map<String,String> extractData(ResultSet arg0) throws SQLException,
				DataAccessException {
			while(arg0.next())
				map.put(arg0.getString("LookupCode"), arg0.getString("LookupMeaning"));
			return map;
		}
		});
	}

	public int updateDiscount(String lookupcode){
		return getJdbcTemplate().update("update ProductOtherDetails set discount='"+lookupcode+"'");
	}


	public int deleteState(int lookupcode){
		return getJdbcTemplate().update("delete from Master_Lookup_Value where LookupCode="+lookupcode+" or value1='"+lookupcode+"'");
	}

	public int deleteDistrict(int lookupcode){
		return getJdbcTemplate().update("delete from Master_Lookup_Value where LookupCode="+lookupcode+" or value2='"+lookupcode+"'");
	}

	public int deleteTaluka(int lookupcode){
		return getJdbcTemplate().update("delete from Master_Lookup_Value where LookupCode="+lookupcode);
	}

	public String getAllSubCategoriesFromProduct(String cate_id) throws Exception {
        Connection con = getJdbcTemplate().getDataSource().getConnection();
        String ids = getAllSubCategoriesFromProduct(con, cate_id);

        if(ids.indexOf(",") != -1) {
            String []tmp = ids.split(",");
            String value = "";
            for (int i = 0; i < tmp.length; i++) {
                if(StringUtils.hasText(tmp[i])) {
                    value = value+tmp[i]+",";
                }
            }

            if(value.substring(value.length() -1 , value.length()).equals(",")) {
                value = value.substring(0, value.length()-1);
            }
            ids = value;
        }
        con.close();
        //System.out.println("Ids = "+ids);
        return ids;
    }

    private String getAllSubCategoriesFromProduct(Connection con, String cate_id) throws Exception {
        Statement stmt = con.createStatement();
        ResultSet res = stmt.executeQuery("SELECT cate_id FROM categories where cate_parent_id = "+cate_id);
        String value = "";
        while(res.next()) {
            value = res.getString("cate_id") + ","+ getAllSubCategoriesFromProduct(con, res.getString("cate_id"))+","+value;
        }
        stmt.close();res.close();
        return value;

    }

    public Map<String, String> getAllSubCategoriesFromProduct() throws Exception {
        Connection con = getJdbcTemplate().getDataSource().getConnection();
        Map<String, String> map = new ConcurrentHashMap<String, String>();
        Statement stmt = con.createStatement();
        ResultSet res = stmt.executeQuery("select cate_id,cate_name,cate_img_loc from categories where cate_parent_id=0 and status='Y'");
        while(res.next())
        {
            String cate_id = res.getString("cate_id");
            String ids = getAllSubCategoriesFromProduct(con, cate_id, map);

            //System.out.println("Parent Id = "+cate_id+ "  Subcategory id = "+ids);

        }

        //System.out.println(map);

        con.close();

        return map;
    }

    private String getAllSubCategoriesFromProduct(Connection con, String cate_id, Map<String, String> map) throws Exception {
        Statement stmt = con.createStatement();
        ResultSet res = stmt.executeQuery("SELECT cate_id FROM categories where cate_parent_id = "+cate_id);
        String value = "";
        while(res.next()) {

            if(StringUtils.hasText(value)){

                String tmp = getAllSubCategoriesFromProduct(con, res.getString("cate_id"), map);
                if(StringUtils.hasText(tmp)){
                    value = res.getString("cate_id") + ","+ tmp+","+value;
                }
                else
                {
                    value = res.getString("cate_id")+","+value;
                }
            }
            else
            {
                String tmp = getAllSubCategoriesFromProduct(con, res.getString("cate_id"), map);
                if(StringUtils.hasText(tmp)){
                    value = res.getString("cate_id") + ","+ tmp;
                }
                else
                {
                    value = res.getString("cate_id");
                }
            }
        }

        if(StringUtils.hasText(value)) map.put(cate_id, value);

        res.close();
        stmt.close();
        return value;
    }

    public int sumNumber(String str) {
        int sum = 0;
        for (char c : str.toCharArray()) {
            sum += Character.digit(c, 10);
        }

        return sum;
    }

    public static long phoneWord(String initial_phone_number)
    {
        // Use long instead of int for 'number' if the string will be longer than max int value
        // 2147483647, which is '10 digits'
        long number = 0;
        int strLen = initial_phone_number.length();


        for (int currCharacter = 0; currCharacter < strLen; currCharacter++)
        {
            char ch = initial_phone_number.charAt(currCharacter);
            // For A-Z & 0-9, multiply by 10, add the 'char' to number.
            // i.e., Shift existing value to the left by 1 digit, add current 'char' to it
            // Use long instead of int if the string will be longer than max int value (2147483647)

            if (Character.isLetter(ch))
            {
                switch(ch)
                {
                case 'A' : case 'B' : case 'C' : number *= 10; number += 2; break;
                case 'D' : case 'E' : case 'F' : number *= 10; number += 3; break;
                case 'G' : case 'H' : case 'I' : number *= 10; number += 4; break;
                case 'J' : case 'K' : case 'L' : number *= 10; number += 5; break;
                case 'M' : case 'N' : case 'O' : number *= 10; number += 6; break;
                case 'P' : case 'Q' : case 'R' : case 'S' : number *= 10; number += 7; break;
                case 'T' : case 'U' : case 'V' : number *= 10; number += 8; break;
                case 'W' : case 'X' : case 'Y' : case 'Z' : number *= 10; number += 9; break;
                }
            }
            else if (Character.isDigit(ch))
            {
                number *= 10; number += Character.getNumericValue(ch);
            }
            else
            {
                System.out.println("Invalid character!");
            }

        } // End of for loop

        // Return actual number only at the end of the function
        return number;

    }// End of full_number function




    public static void main(String[] args) throws Exception{
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("bean.xml");
        GeneralFunction generfunc = (GeneralFunction) context.getBean("generalFunction");
        generfunc.getAllSubCategoriesFromProduct();
    }

}
