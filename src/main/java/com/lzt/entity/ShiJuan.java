package com.lzt.entity;

import java.util.Date;

public class ShiJuan {
    private String sjId;

    private String ksrId;

    private String ksrQuestIds;

    private String ksrSjNum;

    private String ksrTotal;

    private Date createTime;

    private Date updateTime;

    public String getSjId() {
        return sjId;
    }

    public void setSjId(String sjId) {
        this.sjId = sjId == null ? null : sjId.trim();
    }

    public String getksrId() {
        return ksrId;
    }

    public void setksrId(String ksrId) {
        this.ksrId = ksrId == null ? null : ksrId.trim();
    }

    public String getKsrQuestIds() {
        return ksrQuestIds;
    }

    public void setKsrQuestIds(String ksrQuestIds) {
        this.ksrQuestIds = ksrQuestIds == null ? null : ksrQuestIds.trim();
    }

    public String getKsrSjNum() {
        return ksrSjNum;
    }

    public void setKsrSjNum(String ksrSjNum) {
        this.ksrSjNum = ksrSjNum == null ? null : ksrSjNum.trim();
    }

    public String getKsrTotal() {
        return ksrTotal;
    }

    public void setKsrTotal(String ksrTotal) {
        this.ksrTotal = ksrTotal == null ? null : ksrTotal.trim();
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