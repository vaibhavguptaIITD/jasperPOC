package com.vaibhav.view;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRHtmlExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;
import net.sf.jasperreports.j2ee.servlets.ImageServlet;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.view.jasperreports.AbstractJasperReportsSingleFormatView;

public class CustomHTMLExporter extends AbstractJasperReportsSingleFormatView{

	@Override
	protected JRExporter createExporter() {
		JRHtmlExporter htmlExporter = new JRHtmlExporter();
//	    htmlExporter.setParameter(JRHtmlExporterParameter.IMAGES_URI,
//	                              "/report/images?image=");
	    return htmlExporter;
	  }

	@Override
	protected boolean useWriter() {
		return true;
	}
	
	@Override
	protected void renderReport(JasperPrint populatedReport, Map<String, Object> model, HttpServletResponse response)
			throws Exception {
		ServletRequestAttributes sra = (ServletRequestAttributes)RequestContextHolder.getRequestAttributes();
	    HttpServletRequest req = sra.getRequest(); 
	    req.getSession().setAttribute(populatedReport.getName() + "_report",
                populatedReport);
		super.renderReport(populatedReport, model, response);
	}

}
