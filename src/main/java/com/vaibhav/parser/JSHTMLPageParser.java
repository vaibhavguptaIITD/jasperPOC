package com.vaibhav.parser;

import com.opensymphony.module.sitemesh.html.State;
import com.opensymphony.module.sitemesh.html.rules.PageBuilder;
import com.opensymphony.module.sitemesh.parser.HTMLPageParser;

public class JSHTMLPageParser extends HTMLPageParser{
	
	protected void addUserDefinedRules(State html, PageBuilder page) {
		super.addUserDefinedRules(html, page);
		html.addRule(new TdBlockExtractingRule(page)); 
	}

}
