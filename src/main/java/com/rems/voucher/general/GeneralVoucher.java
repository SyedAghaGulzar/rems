package com.rems.voucher.general;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

import org.springframework.format.annotation.DateTimeFormat;

import com.rems.party.Party;

@Entity
@NamedQueries({
@NamedQuery(name = "GeneralVoucher.findAll", query = "select g from  GeneralVoucher g order by g.generalVoucherId desc"),
@NamedQuery(name = "GeneralVoucher.findAllGeneralVouchersByCashPaidTo", query="from GeneralVoucher g where g.cashPaidTo.partyId=:cashPaidTo order by g.generalVoucherId desc"),
@NamedQuery(name = "GeneralVoucher.findAllGeneralVouchersByCashPaidBy", query="from GeneralVoucher g where g.cashPaidBy.partyId=:cashPaidBy order by g.generalVoucherId desc"),
@NamedQuery(name = "GeneralVoucher.findGeneralVouchersForLedger", query="from GeneralVoucher g where g.cashPaidBy.partyId in (?1,?2) and g.cashPaidTo.partyId in (?1,?2) and (g.date>=?3 or ?3 is null) and (g.date<=?4 or ?4 is null)  order by g.generalVoucherId")
})
public class GeneralVoucher {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "general_voucher_id")
	private int generalVoucherId = -1;

	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "date")
	private Date date;

	@ManyToOne
	@JoinColumn(name = "cash_paid_to", nullable = true)
	private Party cashPaidTo;
	
	@Column(name = "amount")
	private Double amount;

	@ManyToOne
	@JoinColumn(name = "cash_paid_by", nullable = true)
	private Party cashPaidBy;
	
	@Column(name = "details")
	private String details;

	public int getGeneralVoucherId() {
		return generalVoucherId;
	}

	public void setGeneralVoucherId(int generalVoucherId) {
		this.generalVoucherId = generalVoucherId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}
	

	public Party getCashPaidTo() {
		return cashPaidTo;
	}

	public void setCashPaidTo(Party cashPaidTo) {
		this.cashPaidTo = cashPaidTo;
	}

	public Party getCashPaidBy() {
		return cashPaidBy;
	}

	public void setCashPaidBy(Party cashPaidBy) {
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
