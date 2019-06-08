package com.lzt.entity;

import java.util.Date;

public class ShiJuan {
    private String sjId;

    private String ksrId;

    private String ksrQuestIds;

    private int ksrSjNum;

    private String ksrTotal;

    private Date createTime;

    private Date updateTime;

	public String getSjId() {
		return sjId;
	}

	public void setSjId(String sjId) {
		this.sjId = sjId;
	}

	public String getKsrId() {
		return ksrId;
	}

	public void setKsrId(String ksrId) {
		this.ksrId = ksrId;
	}

	public String getKsrQuestIds() {
		return ksrQuestIds;
	}

	public void setKsrQuestIds(String ksrQuestIds) {
		this.ksrQuestIds = ksrQuestIds;
	}

	public int getKsrSjNum() {
		return ksrSjNum;
	}

	public void setKsrSjNum(int ksrSjNum) {
		this.ksrSjNum = ksrSjNum;
	}

	public String getKsrTotal() {
		return ksrTotal;
	}

	public void setKsrTotal(String ksrTotal) {
		this.ksrTotal = ksrTotal;
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

	@Override
	public String toString() {
		return "ShiJuan [sjId=" + sjId + ", ksrId=" + ksrId + ", ksrQuestIds=" + ksrQuestIds + ", ksrSjNum=" + ksrSjNum
				+ ", ksrTotal=" + ksrTotal + ", createTime=" + createTime + ", updateTime=" + updateTime + "]";
	}


}