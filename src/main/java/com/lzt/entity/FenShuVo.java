package com.lzt.entity;

import java.util.List;

public class FenShuVo {
	/**
	 * 问题ID
	 */
	private String questId;
	
	/**
	 * 考试人答案
	 */
	private String ksrContent;
	
	/**
	 * 正确答案
	 */
	private String ansContent;
	
	/**
	 * 总分数
	 */
	private double score=0;
	
	private List<FenShuVo> list;

	public String getQuestId() {
		return questId;
	}

	public void setQuestId(String questId) {
		this.questId = questId;
	}

	public String getKsrContent() {
		return ksrContent;
	}

	public void setKsrContent(String ksrContent) {
		this.ksrContent = ksrContent;
	}

	public String getAnsContent() {
		return ansContent;
	}

	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public List<FenShuVo> getList() {
		return list;
	}

	public void setList(List<FenShuVo> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "FenShuVo [questId=" + questId + ", ksrContent=" + ksrContent + ", ansContent=" + ansContent + ", score="
				+ score + ", list=" + list + "]";
	}

}
