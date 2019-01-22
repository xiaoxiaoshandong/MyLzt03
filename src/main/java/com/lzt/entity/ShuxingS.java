package com.lzt.entity;

public class ShuxingS {
    private String shuxingSId;

    private String shuxingId;

    private String shuxingSVal;

    public String getShuxingSId() {
        return shuxingSId;
    }

	public String getShuxingId() {
		return shuxingId;
	}

	public void setShuxingId(String shuxingId) {
		this.shuxingId = shuxingId;
	}

	public String getShuxingSVal() {
		return shuxingSVal;
	}

	public void setShuxingSVal(String shuxingSVal) {
		this.shuxingSVal = shuxingSVal;
	}

	public void setShuxingSId(String shuxingSId) {
		this.shuxingSId = shuxingSId;
	}

	@Override
	public String toString() {
		return "ShuxingS [shuxingSId=" + shuxingSId + ", shuxingId=" + shuxingId + ", shuxingSVal=" + shuxingSVal + "]";
	}

}