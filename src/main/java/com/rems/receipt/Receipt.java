package com.rems.receipt;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;

import com.rems.enumeration.PaymentType;


@Entity
public class Receipt {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "receipt_id")
	private int receiptId;

	 @DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name="date")
	private Date date;

	@Column(name = "cash_received_from")
	private String cashReceivedFrom;

	@Column(name="amount")
	private Double amount;

	@Enumerated(EnumType.STRING)
	@Column(name = "payment_type")
	private PaymentType paymentType;

	@Column(name="babat")
	private String babat;

	@Column(name = "bank_name")
	private String bankName;

	@Column(name = "bank_branch")
	private String bankBranch;

	@Column(name = "reference_name")
	private String referenceName;

	public int getReceiptId() {
		return receiptId;
	}

	public void setReceiptId(int receiptId) {
		this.receiptId = receiptId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getCashReceivedFrom() {
		return cashReceivedFrom;
	}

	public void setCashReceivedFrom(String cashReceivedFrom) {
		this.cashReceivedFrom = cashReceivedFrom;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public PaymentType getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(PaymentType paymentType) {
		this.paymentType = paymentType;
	}

	public String getBabat() {
		return babat;
	}

	public void setBabat(String babat) {
		this.babat = babat;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBankBranch() {
		return bankBranch;
	}

	public void setBankBranch(String bankBranch) {
		this.bankBranch = bankBranch;
	}

	public String getReferenceName() {
		return referenceName;
	}

	public void setReferenceName(String referenceName) {
		this.referenceName = referenceName;
	}

	@Override
	public String toString() {
		return "Receipt [receiptId=" + receiptId + ", date=" + date + ", cashReceivedFrom=" + cashReceivedFrom
				+ ", amount=" + amount + ", paymentType=" + paymentType + ", babat=" + babat + ", bankName=" + bankName
				+ ", bankBranch=" + bankBranch + ", referenceName=" + referenceName + "]";
	}
}
