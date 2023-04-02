package com.techgate.cache;

import java.util.Collection;

public interface ICache<T> {

	boolean add(T t);
	boolean remove(T t);
	Collection<T> getContent();
	void load();
	void clear();
	void reLoad();
	
}
