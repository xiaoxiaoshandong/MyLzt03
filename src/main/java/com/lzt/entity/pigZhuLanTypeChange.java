package com.lzt.entity;

import java.util.Date;

public class pigZhuLanTypeChange {
    private String pzltcId;

    private String zlId;

    private String zlBefore;

    private String zlAfter;

    private Date createTime;

    private Date updateTime;

    public String getPzltcId() {
        return pzltcId;
    }

    public void setPzltcId(String pzltcId) {
        this.pzltcId = pzltcId == null ? null : pzltcId.trim();
    }

    public String getZlId() {
        return zlId;
    }

    public void setZlId(String zlId) {
        this.zlId = zlId == null ? null : zlId.trim();
    }

    public String getZlBefore() {
        return zlBefore;
    }

    public void setZlBefore(String zlBefore) {
        this.zlBefore = zlBefore == null ? null : zlBefore.trim();
    }

    public String getZlAfter() {
        return zlAfter;
    }

    public void setZlAfter(String zlAfter) {
        this.zlAfter = zlAfter == null ? null : zlAfter.trim();
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