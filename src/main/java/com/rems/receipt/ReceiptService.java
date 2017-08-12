package com.rems.receipt;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

@Service
public class ReceiptService {

	@Autowired
	private ReceiptRepository receiptRepository;

	public List<Receipt> getAllReceipts() {
		List<Receipt> receipts = new ArrayList<>();
		receiptRepository.findAll().forEach(receipts::add);
		return receipts;
	}

	public Receipt getReceiptById(int id) {
		return receiptRepository.findOne(id);
	}

	public String updateReceiptById(int id, Receipt receipt) {
		 receiptRepository.save(receipt);
		 return "index";
	}
	
	public String save(Receipt receipt) {
		 receiptRepository.save(receipt);
		 return "index";
	}

	public String deleteReceipt(int id) {
		receiptRepository.delete(id);
		return "index";
	}

}
