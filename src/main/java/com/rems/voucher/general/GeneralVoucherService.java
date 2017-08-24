package com.rems.voucher.general;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GeneralVoucherService {

	@Autowired
	private GeneralVoucherRepository generalVoucherRepository;

	public List<GeneralVoucher> getAllGeneralVouchers() {
		List<GeneralVoucher> generalVouchers = new ArrayList<>();
		generalVoucherRepository.findAll().forEach(generalVouchers::add);
		return generalVouchers;
	}

	public GeneralVoucher getGeneralVoucherById(int id) {
		return generalVoucherRepository.findOne(id);
	}

	public void updateGeneralVoucherById(int id, GeneralVoucher generalVoucher) {
		 generalVoucherRepository.save(generalVoucher);
	}
	
	public void save(GeneralVoucher generalVoucher) {
		 generalVoucherRepository.save(generalVoucher);
	}

	public void deleteGeneralVoucher(int id) {
		generalVoucherRepository.delete(id);
	}
	public List<GeneralVoucher> findAllGeneralVouchersByPaidToParty(int partyId) {
		List<GeneralVoucher> generalVouchers = new ArrayList<>();
		generalVoucherRepository.findAllGeneralVouchersByCashPaidTo(partyId).forEach(generalVouchers::add);
		return generalVouchers;
	}
	
	public List<GeneralVoucher> findAllGeneralVouchersByPaidByParty(int partyId) {
		List<GeneralVoucher> generalVouchers = new ArrayList<>();
		generalVoucherRepository.findAllGeneralVouchersByCashPaidBy(partyId).forEach(generalVouchers::add);
		return generalVouchers;
	}
	
	public double calculateTotalAmount(List<GeneralVoucher> generalVouchers) {
		return generalVouchers.stream().mapToDouble(r -> r.getAmount()).sum();
	}

}
