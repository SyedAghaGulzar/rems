package com.rems.voucher.general;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

import org.springframework.format.annotation.DateTimeFormat;

import com.rems.enumeration.PaymentType;
import com.rems.party.Party;

@Entity
@NamedQueries({
@NamedQuery(name = "GeneralVoucher.findAll", query = "select g from  GeneralVoucher g order by g.generalVoucherId desc"),
@NamedQuery(name = "GeneralVoucher.findAllGeneralVouchersByParty", query="from GeneralVoucher g where g.party.partyId=:partyId order by g.generalVoucherId desc")
})
public class GeneralVoucher {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "general_voucher_id")
	private int generalVoucherId = -1;

	@ManyToOne
	@JoinColumn(name = "party_id", nullable = true)
	private Party party;

	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "date")
	private Date date;

	@Column(name = "cash_received_by")
	private String cashReceivedBy;
	
	@Column(name = "amount")
	private Double amount;

	@Column(name = "cash_paid_by")
	private String cashPaidBy;
	
	@Column(name = "details")
	private String details;

	public int getGeneralVoucherId() {
		return generalVoucherId;
	}

	public void setGeneralVoucherId(int generalVoucherId) {
		this.generalVoucherId = generalVoucherId;
	}

	public Party getParty() {
		return party;
	}

	public void setParty(Party party) {
		this.party = party;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getCashReceivedBy() {
		return cashReceivedBy;
	}

	public void setCashReceivedBy(String cashReceivedBy) {
		this.cashReceivedBy = cashReceivedBy;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public String getCashPaidBy() {
		return cashPaidBy;
	}

	public void setCashPaidBy(String cashPaidBy) {
		this.cashPaidBy = cashPaidBy;
	}
	
	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public boolean isNew() {
		return this.generalVoucherId == -1;
	}
}
