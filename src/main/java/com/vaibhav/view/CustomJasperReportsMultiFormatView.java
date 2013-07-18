package com.vaibhav.view;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.servlet.view.jasperreports.AbstractJasperReportsView;
import org.springframework.web.servlet.view.jasperreports.JasperReportsCsvView;
import org.springframework.web.servlet.view.jasperreports.JasperReportsMultiFormatView;
import org.springframework.web.servlet.view.jasperreports.JasperReportsPdfView;
import org.springframework.web.servlet.view.jasperreports.JasperReportsXlsView;

public class CustomJasperReportsMultiFormatView extends JasperReportsMultiFormatView{
	
	public CustomJasperReportsMultiFormatView(){
		Map<String, Class<? extends AbstractJasperReportsView>> formatMappings = new HashMap<String, Class<? extends AbstractJasperReportsView>>(4);
		formatMappings.put("csv", JasperReportsCsvView.class);
		formatMappings.put("html", CustomHTMLExporter.class);
		formatMappings.put("pdf", JasperReportsPdfView.class);
		formatMappings.put("xls", JasperReportsXlsView.class);
		formatMappings.put("png", CustomJasperReportImageView.class);
		this.setFormatMappings(formatMappings);
	}

}
