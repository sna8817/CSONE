package com.shop_CSone.dto;

import java.sql.Date;

public class ProductDTO {
	private String p_code;
	private String p_name;
	private int p_price;
	private int p_purchasecnt;
	private int p_goodcnt;
	private String p_img;
	private String p_text;
	private String p_size;
	private String p_storage;
	private String p_shelf;
	private String p_detail;
	private Date p_indate;
	
	public ProductDTO() {
		
	}

	public ProductDTO(String p_code, String p_name, int p_price, int p_purchasecnt, int p_goodcnt, String p_img,
			String p_text, String p_size, String p_storage, String p_shelf, String p_detail, Date p_indate) {
		super();
		this.p_code = p_code;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_purchasecnt = p_purchasecnt;
		this.p_goodcnt = p_goodcnt;
		this.p_img = p_img;
		this.p_text = p_text;
		this.p_size = p_size;
		this.p_storage = p_storage;
		this.p_shelf = p_shelf;
		this.p_detail = p_detail;
		this.p_indate = p_indate;
	}

	public String getP_code() {
		return p_code;
	}

	public void setP_code(String p_code) {
		this.p_code = p_code;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public int getP_purchasecnt() {
		return p_purchasecnt;
	}

	public void setP_purchasecnt(int p_purchasecnt) {
		this.p_purchasecnt = p_purchasecnt;
	}

	public int getP_goodcnt() {
		return p_goodcnt;
	}

	public void setP_goodcnt(int p_goodcnt) {
		this.p_goodcnt = p_goodcnt;
	}

	public String getP_img() {
		return p_img;
	}

	public void setP_img(String p_img) {
		this.p_img = p_img;
	}

	public String getP_text() {
		return p_text;
	}

	public void setP_text(String p_text) {
		this.p_text = p_text;
	}

	public String getP_size() {
		return p_size;
	}

	public void setP_size(String p_size) {
		this.p_size = p_size;
	}

	public String getP_storage() {
		return p_storage;
	}

	public void setP_storage(String p_storage) {
		this.p_storage = p_storage;
	}

	public String getP_shelf() {
		return p_shelf;
	}

	public void setP_shelf(String p_shelf) {
		this.p_shelf = p_shelf;
	}

	public String getP_detail() {
		return p_detail;
	}

	public void setP_detail(String p_detail) {
		this.p_detail = p_detail;
	}

	public Date getP_indate() {
		return p_indate;
	}

	public void setP_indate(Date p_indate) {
		this.p_indate = p_indate;
	}

	@Override
	public String toString() {
		return "ProductDTO [p_code=" + p_code + ", p_name=" + p_name + ", p_price=" + p_price + ", p_purchasecnt="
				+ p_purchasecnt + ", p_goodcnt=" + p_goodcnt + ", p_img=" + p_img + ", p_text=" + p_text + ", p_size="
				+ p_size + ", p_storage=" + p_storage + ", p_shelf=" + p_shelf + ", p_detail=" + p_detail
				+ ", p_indate=" + p_indate + "]";
	}



	
	
	
}
