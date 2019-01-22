package com.lzt.entity;

public class Shuxing {
    private String shuxingId;

    private String shuxingName;

    private String erjiId;

    public String getShuxingId() {
        return shuxingId;
    }

    public void setShuxingId(String shuxingId) {
        this.shuxingId = shuxingId;
    }

    public String getShuxingName() {
        return shuxingName;
    }

    public void setShuxingName(String shuxingName) {
        this.shuxingName = shuxingName == null ? null : shuxingName.trim();
    }

    public String getErjiId() {
        return erjiId;
    }

    public void setErjiId(String erjiId) {
        this.erjiId = erjiId;
    }

	@Override
	public String toString() {
		return "Shuxing [shuxingId=" + shuxingId + ", shuxingName=" + shuxingName + ", erjiId=" + erjiId + "]";
	}
    
}