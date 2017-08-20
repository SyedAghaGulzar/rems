package com.rems.voucher.cash;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

@Service
public class CashVoucherService {

	@Autowired
	private CashVoucherRepository cashVoucherRepository;

	public List<CashVoucher> getAllCashVouchers() {
		List<CashVoucher> cashVouchers = new ArrayList<>();
		cashVoucherRepository.findAll().forEach(cashVouchers::add);
		return cashVouchers;
	}

	public CashVoucher getCashVoucherById(int id) {
		return cashVoucherRepository.findOne(id);
	}

	public void updateCashVoucherById(int id, CashVoucher cashVoucher) {
		 cashVoucherRepository.save(cashVoucher);
	}
	
	public void save(CashVoucher cashVoucher) {
		 cashVoucherRepository.save(cashVoucher);
	}

	public void deleteCashVoucher(int id) {
		cashVoucherRepository.delete(id);
	}

}
