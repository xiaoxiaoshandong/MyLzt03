package com.lzt.entity;

import java.util.Date;

public class KsrDaAn {
    private String kdaId;

    private String sjId;

    private String questId;

    private String ksrContent;

    private Date createTime;

    private Date updateTime;
    
    private String ksrQuestType;

    public String getKdaId() {
        return kdaId;
    }

    public void setKdaId(String kdaId) {
        this.kdaId = kdaId == null ? null : kdaId.trim();
    }

    public String getSjId() {
        return sjId;
    }

    public void setSjId(String sjId) {
        this.sjId = sjId == null ? null : sjId.trim();
    }

    public String getQuestId() {
        return questId;
    }

    public void setQuestId(String questId) {
        this.questId = questId == null ? null : questId.trim();
    }

    public String getKsrContent() {
        return ksrContent;
    }

    public void setKsrContent(String ksrContent) {
        this.ksrContent = ksrContent == null ? null : ksrContent.trim();
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

	public String getKsrQuestType() {
		return ksrQuestType;
	}

	public void setKsrQuestType(String ksrQuestType) {
		this.ksrQuestType = ksrQuestType;
	}

	@Override
	public String toString() {
		return "KsrDaAn [kdaId=" + kdaId + ", sjId=" + sjId + ", questId=" + questId + ", ksrContent=" + ksrContent
				+ ", createTime=" + createTime + ", updateTime=" + updateTime + ", ksrQuestType=" + ksrQuestType + "]";
	}
    
    
}