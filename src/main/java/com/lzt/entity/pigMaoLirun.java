package com.lzt.entity;

import java.util.Date;

public class pigMaoLirun {
    private String mlrId;

    private String mlrAcount;

    private String zlId;

    private Date createTime;

    private Date updateTime;

    public String getMlrId() {
        return mlrId;
    }

    public void setMlrId(String mlrId) {
        this.mlrId = mlrId == null ? null : mlrId.trim();
    }

    public String getMlrAcount() {
        return mlrAcount;
    }

    public void setMlrAcount(String mlrAcount) {
        this.mlrAcount = mlrAcount == null ? null : mlrAcount.trim();
    }

    public String getZlId() {
        return zlId;
    }

    public void setZlId(String zlId) {
        this.zlId = zlId == null ? null : zlId.trim();
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