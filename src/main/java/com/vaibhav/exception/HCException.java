/*******************************************************************************
 * Copyright (c) 2009 - 2012 hCentive Inc. All rights reserved.
 ******************************************************************************/
/**
 * Copyright (c) 2009 - 2012 hCentive Inc. All rights reserved.
 */
/**
 * Copyright (c) 2009 - 2011 hCentive Inc. All rights reserved.
 */
package com.vaibhav.exception;


/**
 * @author ashish.jaiswal
 * 
 */
public class HCException extends Exception {

	protected MessageCode messageCode;
	protected String[] args;

	public HCException(MessageCode messageCode, Throwable th) {
		super(messageCode.toString(), th);
		this.messageCode = messageCode;
	}

	public HCException(MessageCode messageCode, Throwable th, String... args) {
		super(messageCode.toString(), th);
		this.messageCode = messageCode;
		this.args = args;
	}

	public HCException(MessageCode messageCode) {
		super(messageCode.toString());
		this.messageCode = messageCode;
	}

	public HCException(MessageCode messageCode, String... args) {
		super(messageCode.toString());
		this.messageCode = messageCode;
		this.args = args;
	}

	public MessageCode getMessageCode() {
		return messageCode;
	}

	public String[] getArgs() {
		return args;
	}

//	public String getI18nMessage(Locale locale) {
//		return Springi18nUtils.getMessage(messageCode.getName(),this.args, messageCode.getDefaultMessage(), locale);
//	}
}
