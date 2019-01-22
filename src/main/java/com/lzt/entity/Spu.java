package com.lzt.entity;

public class Spu {
    private String spuId;

    private String chanpinName;

    private String erjiId;

    private String pinpaiId;

    private String jianjie;

    private String xiangqing;

    public String getSpuId() {
        return spuId;
    }

    public void setSpuId(String spuId) {
        this.spuId = spuId;
    }

    public String getChanpinName() {
        return chanpinName;
    }

    public void setChanpinName(String chanpinName) {
        this.chanpinName = chanpinName == null ? null : chanpinName.trim();
    }

    public String getErjiId() {
        return erjiId;
    }

    public void setErjiId(String erjiId) {
        this.erjiId = erjiId;
    }

    public String getPinpaiId() {
        return pinpaiId;
    }

    public void setPinpaiId(String pinpaiId) {
        this.pinpaiId = pinpaiId;
    }

    public String getJianjie() {
        return jianjie;
    }

    public void setJianjie(String jianjie) {
        this.jianjie = jianjie == null ? null : jianjie.trim();
    }

    public String getXiangqing() {
        return xiangqing;
    }

    public void setXiangqing(String xiangqing) {
        this.xiangqing = xiangqing == null ? null : xiangqing.trim();
    }
}