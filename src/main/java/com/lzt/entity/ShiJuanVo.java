package com.lzt.entity;

public class ShiJuanVo {
		
	private String sjId;
	private String questId;
	private String ksrContent;
	private String ansContent;
	private String questContent;
	private String optionA;
	private String optionB;
	private String optionC;
	private String optionD;
	private int ksrSjNum;
	private String ksrTotal;
	public String getSjId() {
		return sjId;
	}
	public void setSjId(String sjId) {
		this.sjId = sjId;
	}
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
	public String getQuestContent() {
		return questContent;
	}
	public void setQuestContent(String questContent) {
		this.questContent = questContent;
	}
	public String getOptionA() {
		return optionA;
	}
	public void setOptionA(String optionA) {
		this.optionA = optionA;
	}
	public String getOptionB() {
		return optionB;
	}
	public void setOptionB(String optionB) {
		this.optionB = optionB;
	}
	public String getOptionC() {
		return optionC;
	}
	public void setOptionC(String optionC) {
		this.optionC = optionC;
	}
	public String getOptionD() {
		return optionD;
	}
	public void setOptionD(String optionD) {
		this.optionD = optionD;
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
	@Override
	public String toString() {
		return "ShiJuanVo [sjId=" + sjId + ", questId=" + questId + ", ksrContent=" + ksrContent + ", ansContent="
				+ ansContent + ", questContent=" + questContent + ", optionA=" + optionA + ", optionB=" + optionB
				+ ", optionC=" + optionC + ", optionD=" + optionD + ", ksrSjNum=" + ksrSjNum + ", ksrTotal=" + ksrTotal
				+ "]";
	}
	
}
