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
 */
public class MessageCode {

	public static final MessageCode GENERIC_ERROR = new MessageCode("GENERIC_ERROR", "Unknown Error has happened");

	private String name;

	private String defaultMessage;

	public MessageCode(String name) {
		this.name = name;
	}

	public MessageCode(String name, String defaultMessage) {
		this.name = name;
		this.defaultMessage = defaultMessage;
	}

	public String getDefaultMessage() {
		return defaultMessage;
	}

	public void setDefaultMessage(String defaultMessage) {
		this.defaultMessage = defaultMessage;
	}

	public String getName() {
		return name;
	}

	@Override
	public String toString() {
		return name + ":" + defaultMessage;
	}

	@Override
	public boolean equals(Object obj) {
		if (!(obj instanceof MessageCode)) {
			return false;
		}
		if (this == obj) {
			return true;
		}
		return this.name.equals(((MessageCode) obj).getName()) && this.defaultMessage.equals(((MessageCode) obj).getDefaultMessage());
	}

	@Override
	public int hashCode() {
		return 1; // All MessageCode objects will hv the same hashcode so equality determined by equals method
	}
}
