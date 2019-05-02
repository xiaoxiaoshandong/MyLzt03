package com.lzt.entity;

import java.math.BigDecimal;
import java.util.List;
/**
 * 商品信息实体
 * @author Administrator
 *
 */
public class ProdVo {
	private String skuId;
	private String chanpinName;
	private String skuName;
	private BigDecimal jiage;
	private List<MyPicture> myPicture;
	private String num;
	
	
	public String getSkuId() {
		return skuId;
	}
	public void setSkuId(String skuId) {
		this.skuId = skuId;
	}
	public String getChanpinName() {
		return chanpinName;
	}
	public void setChanpinName(String chanpinName) {
		this.chanpinName = chanpinName;
	}
	public String getSkuName() {
		return skuName;
	}
	public void setSkuName(String skuName) {
		this.skuName = skuName;
	}
	public BigDecimal getJiage() {
		return jiage;
	}
	public void setJiage(BigDecimal jiage) {
		this.jiage = jiage;
	}
	public List<MyPicture> getMyPicture() {
		return myPicture;
	}
	public void setMyPicture(List<MyPicture> myPicture) {
		this.myPicture = myPicture;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "ProdVo [skuId=" + skuId + ", chanpinName=" + chanpinName + ", skuName=" + skuName + ", jiage=" + jiage
				+ ", myPicture=" + myPicture + ", num=" + num + "]";
	}
	
}
