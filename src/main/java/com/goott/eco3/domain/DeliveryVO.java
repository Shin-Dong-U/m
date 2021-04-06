package com.goott.eco3.domain;



import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class DeliveryVO {

	private String delivery_seq;
	private String invoice_no;
	private String order_seq;
	private String delivery_status;
	private long delivery_company;
	private Timestamp regdate;
	private String reguser;
	private Timestamp editdate;
	private String edituser;
	private String sender_name;
	private String sender_phone;
	private String sender_addr_post;
	private String sender_addr_city;
	private String sender_adr_detail;
	private String cust_name;
	private String cust_phone;
	private String cust_addr_post;
	private String cust_addr_city;
	private String cust_addr_detail;


	
	public DeliveryVO() {
		
	}

	public DeliveryVO(String delivery_seq, String invoice_no, String order_seq, String delivery_status,long delivery_company, 
			Timestamp regdate, String reguser, Timestamp editdate, String edituser, String sender_name, 
			String sender_phone, String sender_addr_post, String sender_addr_city, String sender_adr_detail, String cust_name, String cust_phone,
			String cust_addr_post, String cust_addr_city, String cust_addr_detail) {
		
		this.delivery_seq = delivery_seq;
		this.invoice_no = invoice_no;
		this.order_seq = order_seq;
		this.delivery_status = delivery_status;
		this.delivery_company = delivery_company;
		this.regdate = regdate;
		this.reguser = reguser;
		this.editdate = editdate;
		this.edituser = edituser;
		this.sender_name = sender_name;
		this.sender_phone = sender_phone;
		this.sender_addr_post = sender_addr_post;
		this.sender_addr_city = sender_addr_city;
		this.sender_adr_detail = sender_adr_detail;
		this.cust_name = cust_name;
		this.cust_phone = cust_phone;
		this.cust_addr_post = cust_addr_post;
		this.cust_addr_city = cust_addr_city;
		this.cust_addr_detail = cust_addr_detail;
		
	}

	public String getDelivery_seq() {
		return delivery_seq;
	}

	public void setDelivery_seq(String delivery_seq) {
		this.delivery_seq = delivery_seq;
	}

	public String getInvoice_no() {
		return invoice_no;
	}

	public void setInvoice_no(String invoice_no) {
		this.invoice_no = invoice_no;
	}

	public String getOrder_seq() {
		return order_seq;
	}

	public void setOrder_seq(String order_seq) {
		this.order_seq = order_seq;
	}

	public String getDelivery_status() {
		return delivery_status;
	}

	public void setDelivery_status(String delivery_status) {
		this.delivery_status = delivery_status;
	}

	public long getDelivery_company() {
		return delivery_company;
	}

	public void setDelivery_company(long delivery_company) {
		this.delivery_company = delivery_company;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getReguser() {
		return reguser;
	}

	public void setReguser(String reguser) {
		this.reguser = reguser;
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

	public String getSender_name() {
		return sender_name;
	}

	public void setSender_name(String sender_name) {
		this.sender_name = sender_name;
	}

	public String getSender_phone() {
		return sender_phone;
	}

	public void setSender_phone(String sender_phone) {
		this.sender_phone = sender_phone;
	}

	public String getSender_addr_post() {
		return sender_addr_post;
	}

	public void setSender_addr_post(String sender_addr_post) {
		this.sender_addr_post = sender_addr_post;
	}

	public String getSender_addr_city() {
		return sender_addr_city;
	}

	public void setSender_addr_city(String sender_addr_city) {
		this.sender_addr_city = sender_addr_city;
	}

	public String getSender_adr_detail() {
		return sender_adr_detail;
	}

	public void setSender_adr_detail(String sender_adr_detail) {
		this.sender_adr_detail = sender_adr_detail;
	}

	public String getCust_name() {
		return cust_name;
	}

	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}

	public String getCust_phone() {
		return cust_phone;
	}

	public void setCust_phone(String cust_phone) {
		this.cust_phone = cust_phone;
	}

	public String getCust_addr_post() {
		return cust_addr_post;
	}

	public void setCust_addr_post(String cust_addr_post) {
		this.cust_addr_post = cust_addr_post;
	}

	public String getCust_addr_city() {
		return cust_addr_city;
	}

	public void setCust_addr_city(String cust_addr_city) {
		this.cust_addr_city = cust_addr_city;
	}

	public String getCust_addr_detail() {
		return cust_addr_detail;
	}

	public void setCust_addr_detail(String cust_addr_detail) {
		this.cust_addr_detail = cust_addr_detail;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cust_addr_city == null) ? 0 : cust_addr_city.hashCode());
		result = prime * result + ((cust_addr_detail == null) ? 0 : cust_addr_detail.hashCode());
		result = prime * result + ((cust_addr_post == null) ? 0 : cust_addr_post.hashCode());
		result = prime * result + ((cust_name == null) ? 0 : cust_name.hashCode());
		result = prime * result + ((cust_phone == null) ? 0 : cust_phone.hashCode());
		result = prime * result + (int) (delivery_company ^ (delivery_company >>> 32));
		result = prime * result + ((delivery_seq == null) ? 0 : delivery_seq.hashCode());
		result = prime * result + ((delivery_status == null) ? 0 : delivery_status.hashCode());
		result = prime * result + ((editdate == null) ? 0 : editdate.hashCode());
		result = prime * result + ((edituser == null) ? 0 : edituser.hashCode());
		result = prime * result + ((invoice_no == null) ? 0 : invoice_no.hashCode());
		result = prime * result + ((order_seq == null) ? 0 : order_seq.hashCode());
		result = prime * result + ((regdate == null) ? 0 : regdate.hashCode());
		result = prime * result + ((reguser == null) ? 0 : reguser.hashCode());
		result = prime * result + ((sender_addr_city == null) ? 0 : sender_addr_city.hashCode());
		result = prime * result + ((sender_addr_post == null) ? 0 : sender_addr_post.hashCode());
		result = prime * result + ((sender_adr_detail == null) ? 0 : sender_adr_detail.hashCode());
		result = prime * result + ((sender_name == null) ? 0 : sender_name.hashCode());
		result = prime * result + ((sender_phone == null) ? 0 : sender_phone.hashCode());
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
		DeliveryVO other = (DeliveryVO) obj;
		if (cust_addr_city == null) {
			if (other.cust_addr_city != null)
				return false;
		} else if (!cust_addr_city.equals(other.cust_addr_city))
			return false;
		if (cust_addr_detail == null) {
			if (other.cust_addr_detail != null)
				return false;
		} else if (!cust_addr_detail.equals(other.cust_addr_detail))
			return false;
		if (cust_addr_post == null) {
			if (other.cust_addr_post != null)
				return false;
		} else if (!cust_addr_post.equals(other.cust_addr_post))
			return false;
		if (cust_name == null) {
			if (other.cust_name != null)
				return false;
		} else if (!cust_name.equals(other.cust_name))
			return false;
		if (cust_phone == null) {
			if (other.cust_phone != null)
				return false;
		} else if (!cust_phone.equals(other.cust_phone))
			return false;
		if (delivery_company != other.delivery_company)
			return false;
		if (delivery_seq == null) {
			if (other.delivery_seq != null)
				return false;
		} else if (!delivery_seq.equals(other.delivery_seq))
			return false;
		if (delivery_status == null) {
			if (other.delivery_status != null)
				return false;
		} else if (!delivery_status.equals(other.delivery_status))
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
		if (invoice_no == null) {
			if (other.invoice_no != null)
				return false;
		} else if (!invoice_no.equals(other.invoice_no))
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
		if (sender_addr_city == null) {
			if (other.sender_addr_city != null)
				return false;
		} else if (!sender_addr_city.equals(other.sender_addr_city))
			return false;
		if (sender_addr_post == null) {
			if (other.sender_addr_post != null)
				return false;
		} else if (!sender_addr_post.equals(other.sender_addr_post))
			return false;
		if (sender_adr_detail == null) {
			if (other.sender_adr_detail != null)
				return false;
		} else if (!sender_adr_detail.equals(other.sender_adr_detail))
			return false;
		if (sender_name == null) {
			if (other.sender_name != null)
				return false;
		} else if (!sender_name.equals(other.sender_name))
			return false;
		if (sender_phone == null) {
			if (other.sender_phone != null)
				return false;
		} else if (!sender_phone.equals(other.sender_phone))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "DeliveryVO [delivery_seq=" + delivery_seq + ", invoice_no=" + invoice_no + ", order_seq=" + order_seq
				+ ", delivery_status=" + delivery_status + ", delivery_company=" + delivery_company + ", regdate="
				+ regdate + ", reguser=" + reguser + ", editdate=" + editdate + ", edituser=" + edituser
				+ ", sender_name=" + sender_name + ", sender_phone=" + sender_phone + ", sender_addr_post="
				+ sender_addr_post + ", sender_addr_city=" + sender_addr_city + ", sender_adr_detail="
				+ sender_adr_detail + ", cust_name=" + cust_name + ", cust_phone=" + cust_phone + ", cust_addr_post="
				+ cust_addr_post + ", cust_addr_city=" + cust_addr_city + ", cust_addr_detail=" + cust_addr_detail
				+ "]";
	}



	
	
	
}
