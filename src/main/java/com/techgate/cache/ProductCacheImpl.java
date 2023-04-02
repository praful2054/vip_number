package com.techgate.cache;

import java.util.Collection;
import java.util.concurrent.CopyOnWriteArraySet;
import org.apache.log4j.Logger;
import com.techgate.domain.CustomProduct;
import com.techgate.util.GeneralFunction;

public class ProductCacheImpl implements ICache<CustomProduct> {
	
	private static final Logger log = Logger.getLogger(ProductCacheImpl.class);

	private GeneralFunction generalFunction = null;
	
	private final CopyOnWriteArraySet<CustomProduct> productList = new CopyOnWriteArraySet<CustomProduct>();
	
	private volatile boolean doCaching = true;
	
	private static final int CACHE_SIZE = 5000;
	
	public ProductCacheImpl() {
		load();
	}
	
	public void setGeneralFunction(GeneralFunction generalFunction) {
		this.generalFunction = generalFunction;
	}
	
	public GeneralFunction getGeneralFunction() {
		return generalFunction;
	}
	
	@Override
	public boolean add(CustomProduct t) {
		if(productList.size() >= CACHE_SIZE  || !doCaching) {
			clear();
			doCaching = false;
			log.warn("Product Size is greater than specified cache size no caching will be done");
			return false;
		}
		doCaching = true;
		return productList.add(t);
	}

	@Override
	public Collection<CustomProduct> getContent() {
		if(!doCaching) {
			log.warn("Product Size is greater than specified cache size no caching will be done. Retreving list from database");
			return generalFunction.getProductList();
		}
		return productList;
	}

	@Override
	public void load() {
		clear();
		productList.addAll(
				generalFunction.getProductList()
		);
	}

	@Override
	public boolean remove(CustomProduct t) {
		return productList.remove(t);
	}
	
	@Override
	public void clear() {
		productList.clear();
	}
	
	@Override
	public void reLoad() {
		load();
		doCaching = true;
	}
}
