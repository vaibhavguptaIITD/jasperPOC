package com.vaibhav.customizer;

import net.sf.jasperreports.engine.JRAbstractChartCustomizer;
import net.sf.jasperreports.engine.JRChart;

import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.renderer.category.BarRenderer;

public class CustomBarchartCustomizer extends JRAbstractChartCustomizer {

	@Override
	public void customize(JFreeChart chart, JRChart jasperChart) {
		// Chart is a bar chart
		if (jasperChart.getChartType() == JRChart.CHART_TYPE_BAR || jasperChart.getChartType() == JRChart.CHART_TYPE_BAR3D) {

			CategoryPlot plot = (CategoryPlot)chart.getPlot();
			ValueAxis verticalAxis = plot.getRangeAxis();
			verticalAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
			
			BarRenderer renderer = (BarRenderer) chart.getCategoryPlot()
					.getRenderer();

			// Set maximum bar width
			renderer.setMaximumBarWidth(0.10);

		}

	}
}
