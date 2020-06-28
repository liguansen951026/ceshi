package com.jiyun.bean;

public class Course {

	private Integer cid;
	private String cname;
	private String tai;
	private String img;
	private double price;
	private Integer tid;
	
	private Type type;

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getTai() {
		return tai;
	}

	public void setTai(String tai) {
		this.tai = tai;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Course [cid=" + cid + ", cname=" + cname + ", tai=" + tai + ", img=" + img + ", price=" + price
				+ ", tid=" + tid + ", type=" + type + "]";
	}


}
