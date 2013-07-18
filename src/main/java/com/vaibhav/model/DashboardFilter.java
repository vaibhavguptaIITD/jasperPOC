package com.vaibhav.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.util.StringUtils;

public class DashboardFilter {
	
	private Map<String, String> filters;

	public Map<String, String> getFilters() {
		return filters;
	}

	public void setFilters(Map<String, String> filters) {
		this.filters = filters;
	}
	
	public String toString(){
		if(filters != null){
			List<String> paramList = new ArrayList<String>();
			Set<Entry<String, String>> entries = filters.entrySet();
			for(Entry<String, String> entry: entries){
				paramList.add("filters["+entry.getKey()+"]="+entry.getValue());
			}
			return StringUtils.collectionToDelimitedString(paramList, "&");
		}
		return "";
	}
	

}
