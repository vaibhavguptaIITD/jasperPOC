package com.vaibhav.parser;

import org.springframework.util.StringUtils;

import com.opensymphony.module.sitemesh.html.BlockExtractingRule;
import com.opensymphony.module.sitemesh.html.Tag;
import com.opensymphony.module.sitemesh.html.rules.PageBuilder;
import com.opensymphony.module.sitemesh.html.tokenizer.Parser.ReusableToken;

public class TdBlockExtractingRule extends BlockExtractingRule {

	private final PageBuilder page;

	public TdBlockExtractingRule(PageBuilder page) {
		super(false, "td");
		this.page = page;
	}

	public void process(Tag tag) { 
		ReusableToken reusableTag = (ReusableToken)tag;
		String[] attributes = reusableTag.attributes;
		String reportClass = getAttributeValue(attributes, "class", false);
		if(StringUtils.hasLength(reportClass)){
			String reportId = getAttributeValue(attributes, "id", false);
			if (StringUtils.hasLength(reportId)) {
				page.addProperty("page.report." + reportId, currentBuffer()
						.toString());
			}
		}
		
	}
	
	private String getAttributeValue(String[] attributes, String name, boolean caseSensitive) {
		int attributeCount = attributes.length;
        if(attributeCount == 0)
           return null;
        final int len = attributeCount;
        for (int i = 0; i < len; i+=2) {
            final String current = attributes[i];
            if (caseSensitive ? name.equals(current) : name.equalsIgnoreCase(current)) {
                return attributes[i + 1];
            }
        }
        return null;
      }
}
