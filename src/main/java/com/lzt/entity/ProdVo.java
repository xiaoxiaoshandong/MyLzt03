package com.lzt.entity;

import java.math.BigDecimal;
import java.util.List;
/**
 * 商品信息实体
 * @author Administrator
 *
 */
public class ProdVo {
	private String chanpinName;
	private String skuName;
	private BigDecimal jiage;
	private List<MyPicture> myPicture;
	
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
	@Override
	public String toString() {
		return "ProdVo [chanpinName=" + chanpinName + ", skuName=" + skuName + ", jiage=" + jiage + ", myPicture="
				+ myPicture + "]";
	}
	
}
