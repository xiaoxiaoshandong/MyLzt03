package com.lzt.myexception;

public class TokenException extends Exception {
	private static final long serialVersionUID = -5946863193639201273L;
	public TokenException() {
	}
 
	public TokenException(String message) {
		super(message);
	}
 
	public TokenException(Throwable cause) {
		super(cause);
	}
 
	public TokenException(String message, Throwable cause) {
		super(message, cause);
	}
}
