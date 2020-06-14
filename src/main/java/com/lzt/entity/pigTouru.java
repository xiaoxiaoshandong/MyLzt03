package com.lzt.entity;

import java.util.Date;

public class pigTouru {
    private String trId;

    private String trAcount;

    private Integer trType;

    private Date createTime;

    private Date updateTime;

    public String getTrId() {
        return trId;
    }

    public void setTrId(String trId) {
        this.trId = trId == null ? null : trId.trim();
    }

    public String getTrAcount() {
        return trAcount;
    }

    public void setTrAcount(String trAcount) {
        this.trAcount = trAcount == null ? null : trAcount.trim();
    }

    public Integer getTrType() {
        return trType;
    }

    public void setTrType(Integer trType) {
        this.trType = trType;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}