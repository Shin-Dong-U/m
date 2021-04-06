package com.goott.eco3.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


public class GoodsCommentVO {
	
	private int goods_seq;
	private String cust_id;
	private int star;
	private Timestamp regdate;
	private long goods_comment_seq;
	private String memo;
	private String goods_comment_img_url;
	public GoodsCommentVO() {
		super();
	}
	public GoodsCommentVO(int goods_seq, String cust_id, int star, Timestamp regdate, long goods_comment_seq,
			String memo, String goods_comment_img_url) {
		super();
		this.goods_seq = goods_seq;
		this.cust_id = cust_id;
		this.star = star;
		this.regdate = regdate;
		this.goods_comment_seq = goods_comment_seq;
		this.memo = memo;
		this.goods_comment_img_url = goods_comment_img_url;
	}
	public int getGoods_seq() {
		return goods_seq;
	}
	public void setGoods_seq(int goods_seq) {
		this.goods_seq = goods_seq;
	}
	public String getCust_id() {
		return cust_id;
	}
	public void setCust_id(String cust_id) {
		this.cust_id = cust_id;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public long getGoods_comment_seq() {
		return goods_comment_seq;
	}
	public void setGoods_comment_seq(long goods_comment_seq) {
		this.goods_comment_seq = goods_comment_seq;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getGoods_comment_img_url() {
		return goods_comment_img_url;
	}
	public void setGoods_comment_img_url(String goods_comment_img_url) {
		this.goods_comment_img_url = goods_comment_img_url;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cust_id == null) ? 0 : cust_id.hashCode());
		result = prime * result + ((goods_comment_img_url == null) ? 0 : goods_comment_img_url.hashCode());
		result = prime * result + (int) (goods_comment_seq ^ (goods_comment_seq >>> 32));
		result = prime * result + goods_seq;
		result = prime * result + ((memo == null) ? 0 : memo.hashCode());
		result = prime * result + ((regdate == null) ? 0 : regdate.hashCode());
		result = prime * result + star;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		GoodsCommentVO other = (GoodsCommentVO) obj;
		if (cust_id == null) {
			if (other.cust_id != null)
				return false;
		} else if (!cust_id.equals(other.cust_id))
			return false;
		if (goods_comment_img_url == null) {
			if (other.goods_comment_img_url != null)
				return false;
		} else if (!goods_comment_img_url.equals(other.goods_comment_img_url))
			return false;
		if (goods_comment_seq != other.goods_comment_seq)
			return false;
		if (goods_seq != other.goods_seq)
			return false;
		if (memo == null) {
			if (other.memo != null)
				return false;
		} else if (!memo.equals(other.memo))
			return false;
		if (regdate == null) {
			if (other.regdate != null)
				return false;
		} else if (!regdate.equals(other.regdate))
			return false;
		if (star != other.star)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "GoodsCommentVO [goods_seq=" + goods_seq + ", cust_id=" + cust_id + ", star=" + star + ", regdate="
				+ regdate + ", goods_comment_seq=" + goods_comment_seq + ", memo=" + memo + ", goods_comment_img_url="
				+ goods_comment_img_url + "]";
	}

	

}
