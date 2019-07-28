package com.lzt.entity;

import java.util.Date;

public class NotePad {
    private String npId;

    private String npTitle;

    private String npContent;

    private Date createTime;

    private Date updateTime;

    public String getNpId() {
        return npId;
    }

    public void setNpId(String npId) {
        this.npId = npId == null ? null : npId.trim();
    }

    public String getNpTitle() {
        return npTitle;
    }

    public void setNpTitle(String npTitle) {
        this.npTitle = npTitle == null ? null : npTitle.trim();
    }

    public String getNpContent() {
        return npContent;
    }

    public void setNpContent(String npContent) {
        this.npContent = npContent == null ? null : npContent.trim();
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