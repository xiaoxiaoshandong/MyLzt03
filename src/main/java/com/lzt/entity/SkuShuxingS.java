package com.lzt.entity;

public class SkuShuxingS {
    private String skuShuxingSId;

    private String skuId;

    private String shuxingSId;

    public String getSkuShuxingSId() {
        return skuShuxingSId;
    }

    public void setSkuShuxingSId(String skuShuxingSId) {
        this.skuShuxingSId = skuShuxingSId == null ? null : skuShuxingSId.trim();
    }

    public String getSkuId() {
        return skuId;
    }

    public void setSkuId(String skuId) {
        this.skuId = skuId == null ? null : skuId.trim();
    }

    public String getShuxingSId() {
        return shuxingSId;
    }

    public void setShuxingSId(String shuxingSId) {
        this.shuxingSId = shuxingSId == null ? null : shuxingSId.trim();
    }
}