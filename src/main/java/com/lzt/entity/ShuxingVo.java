package com.lzt.entity;

import java.util.List;

/**
 * 属性和属性值实体
 * 
 * @author Administrator
 *
 */
public class ShuxingVo {
	
	private String shuxingId;

	private String shuxingName;

	private String erjiId;
	
	private List<ShuxingS> shuxingS;

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
		this.shuxingName = shuxingName;
	}

	public String getErjiId() {
		return erjiId;
	}

	public void setErjiId(String erjiId) {
		this.erjiId = erjiId;
	}

	public List<ShuxingS> getShuxingS() {
		return shuxingS;
	}

	public void setShuxingS(List<ShuxingS> shuxingS) {
		this.shuxingS = shuxingS;
	}

	@Override
	public String toString() {
		return "ShuxingVo [shuxingId=" + shuxingId + ", shuxingName=" + shuxingName + ", erjiId=" + erjiId
				+ ", shuxingS=" + shuxingS + "]";
	}
	
}
