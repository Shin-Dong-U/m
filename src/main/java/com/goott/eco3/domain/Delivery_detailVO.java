package com.goott.eco3.domain;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class Delivery_detailVO {
	
	private String delivery_seq;
	private String order_seq;
	private String order_detail_seq;
	private String reguser;
	private Timestamp regdate;
	private Timestamp editdate;
	private String edituser;

	public Delivery_detailVO() {
		
		
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((delivery_seq == null) ? 0 : delivery_seq.hashCode());
		result = prime * result + ((editdate == null) ? 0 : editdate.hashCode());
		result = prime * result + ((edituser == null) ? 0 : edituser.hashCode());
		result = prime * result + ((order_detail_seq == null) ? 0 : order_detail_seq.hashCode());
		result = prime * result + ((order_seq == null) ? 0 : order_seq.hashCode());
		result = prime * result + ((regdate == null) ? 0 : regdate.hashCode());
		result = prime * result + ((reguser == null) ? 0 : reguser.hashCode());
		return result;
	}

	public Delivery_detailVO(String delivery_seq, String order_seq, String order_detail_seq, String reguser,
			Timestamp regdate, Timestamp editdate, String edituser) {
		super();
		this.delivery_seq = delivery_seq;
		this.order_seq = order_seq;
		this.order_detail_seq = order_detail_seq;
		this.reguser = reguser;
		this.regdate = regdate;
		this.editdate = editdate;
		this.edituser = edituser;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Delivery_detailVO other = (Delivery_detailVO) obj;
		if (delivery_seq == null) {
			if (other.delivery_seq != null)
				return false;
		} else if (!delivery_seq.equals(other.delivery_seq))
			return false;
		if (editdate == null) {
			if (other.editdate != null)
				return false;
		} else if (!editdate.equals(other.editdate))
			return false;
		if (edituser == null) {
			if (other.edituser != null)
				return false;
		} else if (!edituser.equals(other.edituser))
			return false;
		if (order_detail_seq == null) {
			if (other.order_detail_seq != null)
				return false;
		} else if (!order_detail_seq.equals(other.order_detail_seq))
			return false;
		if (order_seq == null) {
			if (other.order_seq != null)
				return false;
		} else if (!order_seq.equals(other.order_seq))
			return false;
		if (regdate == null) {
			if (other.regdate != null)
				return false;
		} else if (!regdate.equals(other.regdate))
			return false;
		if (reguser == null) {
			if (other.reguser != null)
				return false;
		} else if (!reguser.equals(other.reguser))
			return false;
		return true;
	}

	public String getDelivery_seq() {
		return delivery_seq;
	}

	public void setDelivery_seq(String delivery_seq) {
		this.delivery_seq = delivery_seq;
	}

	public String getOrder_seq() {
		return order_seq;
	}

	public void setOrder_seq(String order_seq) {
		this.order_seq = order_seq;
	}

	public String getOrder_detail_seq() {
		return order_detail_seq;
	}

	public void setOrder_detail_seq(String order_detail_seq) {
		this.order_detail_seq = order_detail_seq;
	}

	public String getReguser() {
		return reguser;
	}

	public void setReguser(String reguser) {
		this.reguser = reguser;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public Timestamp getEditdate() {
		return editdate;
	}

	public void setEditdate(Timestamp editdate) {
		this.editdate = editdate;
	}

	public String getEdituser() {
		return edituser;
	}

	public void setEdituser(String edituser) {
		this.edituser = edituser;
	}
}
