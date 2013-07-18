package com.vaibhav.view;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRGraphics2DExporter;
import net.sf.jasperreports.engine.export.JRGraphics2DExporterParameter;

import org.springframework.web.servlet.view.jasperreports.AbstractJasperReportsSingleFormatView;

public class CustomJasperReportImageView extends
		AbstractJasperReportsSingleFormatView {

	@Override
	protected JRExporter createExporter() {
		JRGraphics2DExporter exporter = null;
		try {
			exporter = new JRGraphics2DExporter();
		} catch (JRException e) {
			e.printStackTrace();
		}
		return exporter;
	}

	@Override
	protected boolean useWriter() {
		return true;
	}

	@Override
	protected void renderReport(JasperPrint populatedReport,
			Map<String, Object> model, HttpServletResponse response) {
		try {
			OutputStream out = response.getOutputStream();
			BufferedImage pageImage = new BufferedImage(
					populatedReport.getPageWidth() + 1,
					populatedReport.getPageHeight() + 1,
					BufferedImage.TYPE_INT_RGB);
			JRExporter exporter = createExporter();
			exporter.setParameter(JRExporterParameter.JASPER_PRINT,
					populatedReport);
			exporter.setParameter(JRGraphics2DExporterParameter.GRAPHICS_2D,
					pageImage.getGraphics());
			exporter.setParameter(JRExporterParameter.PAGE_INDEX,
					new Integer(0));
			exporter.exportReport();
			ImageIO.write(pageImage, "png", out);
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
