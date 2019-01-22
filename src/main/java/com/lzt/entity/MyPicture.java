package com.lzt.entity;

public class MyPicture {
    private String picId;

    private String spuId;

    private String tupianName;

    public String getPicId() {
        return picId;
    }

    public void setPicId(String picId) {
        this.picId = picId == null ? null : picId.trim();
    }

    public String getSpuId() {
        return spuId;
    }

    public void setSpuId(String spuId) {
        this.spuId = spuId == null ? null : spuId.trim();
    }

    public String getTupianName() {
        return tupianName;
    }

    public void setTupianName(String tupianName) {
        this.tupianName = tupianName == null ? null : tupianName.trim();
    }
}