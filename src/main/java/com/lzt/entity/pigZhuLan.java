package com.lzt.entity;

import java.util.Date;

public class pigZhuLan {
    private String zlId;

    private String zsId;

    private String zlName;

    private Integer zlType;

    private Integer pigNum;

    private Date createTime;

    private Date updateTime;

    public String getZlId() {
        return zlId;
    }

    public void setZlId(String zlId) {
        this.zlId = zlId == null ? null : zlId.trim();
    }

    public String getZsId() {
        return zsId;
    }

    public void setZsId(String zsId) {
        this.zsId = zsId == null ? null : zsId.trim();
    }

    public String getZlName() {
        return zlName;
    }

    public void setZlName(String zlName) {
        this.zlName = zlName == null ? null : zlName.trim();
    }

    public Integer getZlType() {
        return zlType;
    }

    public void setZlType(Integer zlType) {
        this.zlType = zlType;
    }

    public Integer getPigNum() {
        return pigNum;
    }

    public void setPigNum(Integer pigNum) {
        this.pigNum = pigNum;
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