package com.lzt.entity;

import java.util.Date;

public class pigZhuShe {
    private String zsId;

    private String zsName;

    private Date createTime;

    private Date updateTime;

    public String getZsId() {
        return zsId;
    }

    public void setZsId(String zsId) {
        this.zsId = zsId == null ? null : zsId.trim();
    }

    public String getZsName() {
        return zsName;
    }

    public void setZsName(String zsName) {
        this.zsName = zsName == null ? null : zsName.trim();
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