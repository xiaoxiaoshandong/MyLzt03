package com.lzt.myutils;

public class Page {
	/**
	 * m:起始位置
	 */
	Integer m;
	/**
	 * n:每页要展示的个数
	 */
	Integer n;
	public Integer getM() {
		return m;
	}
	public void setM(Integer m) {
		this.m = m;
	}
	public Integer getN() {
		return n;
	}
	public void setN(Integer n) {
		this.n = n;
	}
	@Override
	public String toString() {
		return "Page [m=" + m + ", n=" + n + "]";
	}
}
