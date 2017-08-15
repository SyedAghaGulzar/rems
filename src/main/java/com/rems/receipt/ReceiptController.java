package com.rems.receipt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/receipt")
public class ReceiptController {

	@Autowired
	private ReceiptService receiptService;

	// view all receipts
	@RequestMapping
	public String getAllReceipts(Model model) {
		model.addAttribute("receipts", receiptService.getAllReceipts());
		return "receipt/list";
	}

	// edit receipt form
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String getRecipet(@PathVariable int id, Model model) {
		model.addAttribute("receipt", receiptService.getReceiptById(id));
		return "receipt/form";
	}
	
	// add receipt form
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String receiptForm(Model model) {
		model.addAttribute("receipt", new Receipt());
		return "receipt/form";
	}
	
	// save new receipt
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String saveReceipt(Model model, @ModelAttribute("receipt") Receipt receipt) {
		receiptService.save(receipt);
		return "redirect:/receipt";
	}

	// update receipt
	@RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
	public String updateReceipt(@ModelAttribute Receipt receipt, Model model, @PathVariable int id) {
		receiptService.updateReceiptById(id, receipt);
		return "redirect:/receipt";
	}
	
	// delete receipt
	@RequestMapping(value = "/delete/{id}")
	public String deleteRecipet(Model model, @PathVariable int id) {
		receiptService.deleteReceipt(id);
		return "redirect:/receipt";
	}

}
