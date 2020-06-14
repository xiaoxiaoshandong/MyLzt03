package com.lzt.entity;

import java.util.Date;

public class pigNumChange {
    private String ncId;

    private String zlId;

    private Integer changeNum;

    private Integer pigNumType;

    private Date createTime;

    private Date updateTime;

    public String getNcId() {
        return ncId;
    }

    public void setNcId(String ncId) {
        this.ncId = ncId == null ? null : ncId.trim();
    }

    public String getZlId() {
        return zlId;
    }

    public void setZlId(String zlId) {
        this.zlId = zlId == null ? null : zlId.trim();
    }

    public Integer getChangeNum() {
        return changeNum;
    }

    public void setChangeNum(Integer changeNum) {
        this.changeNum = changeNum;
    }

    public Integer getPigNumType() {
        return pigNumType;
    }

    public void setPigNumType(Integer pigNumType) {
        this.pigNumType = pigNumType;
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