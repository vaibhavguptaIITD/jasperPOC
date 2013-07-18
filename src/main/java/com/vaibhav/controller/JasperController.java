package com.vaibhav.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vaibhav.model.DashboardFilter;

@Controller
public class JasperController {

	@Autowired
	private DataSource dataSource;
	
	@RequestMapping(value="/report/{reportName}.{format}")
	public ModelAndView getReport(@PathVariable("format") String format, @PathVariable("reportName") String reportName, DashboardFilter dashBoardFilters) throws SQLException{
		Map<String, Object> model = new HashMap<String, Object>();
		if(dashBoardFilters != null && dashBoardFilters.getFilters() != null){
			Map<String, String> filters = dashBoardFilters.getFilters();
			Set<Entry<String, String>> entrySet = filters.entrySet();
			for(Entry<String, String> entry : entrySet){
				model.put(entry.getKey(), entry.getValue());
			}
		}
		//Connection has to be closed
		model.put("REPORT_CONNECTION", dataSource.getConnection());
		model.put("format", format);
		
		return new ModelAndView(reportName, model);
	}

}
