package com.jiyun.bean;

public class Type {

	private Integer yid;
	private String tname;
	public Integer getYid() {
		return yid;
	}
	public void setYid(Integer yid) {
		this.yid = yid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	@Override
	public String toString() {
		return "Type [yid=" + yid + ", tname=" + tname + "]";
	}

}
