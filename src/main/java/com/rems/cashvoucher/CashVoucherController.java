package com.rems.cashvoucher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rems.enumeration.PaymentType;
import com.rems.party.PartyService;

@Controller
@RequestMapping("/cash_voucher")
public class CashVoucherController {

	@Autowired
	private CashVoucherService cashVoucherService;

	@Autowired
	private PartyService partyService;

	// view all receipts
	@RequestMapping
	public String getAllCashVouchers(Model model) {
		model.addAttribute("cash_vouchers", cashVoucherService.getAllCashVouchers());
		return "cash_voucher/cash_voucher_list";
	}

	// edit receipt form
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String getCashVoucher(@PathVariable int id, Model model) {

		model.addAttribute("cash_voucher", cashVoucherService.getCashVoucherById(id))
			 .addAttribute("paymentTypes",PaymentType.findAll())
			 .addAttribute("partyList",partyService.getAllParties());

		return "cash_voucher/cash_voucher_form";
	}

	// add receipt form
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String cashVoucherForm(Model model) {

		model.addAttribute("cash_voucher", new CashVoucher())
			 .addAttribute("paymentTypes", PaymentType.findAll())
			 .addAttribute("partyList",partyService.getAllParties());

		return "cash_voucher/cash_voucher_form";
	}

	// save new receipt
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String saveReceipt(Model model, @ModelAttribute("cash_voucher") CashVoucher cashVoucher) {
		cashVoucherService.save(cashVoucher);
		return "redirect:/cash_voucher";
	}

	// update receipt
	@RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
	public String updateCashVoucher(@ModelAttribute CashVoucher cashVoucher, Model model, @PathVariable int id) {
		cashVoucherService.updateCashVoucherById(id, cashVoucher);
		return "redirect:/cash_voucher";
	}

	// delete receipt
	@RequestMapping(value = "/delete/{id}")
	public String deleteCashVoucher(Model model, @PathVariable int id) {
		cashVoucherService.deleteCashVoucher(id);
		return "redirect:/cash_voucher";
	}

	// print receipt
	@RequestMapping(value = "/print/{id}")
	public String printCashVoucher(@ModelAttribute CashVoucher cashVoucher, Model model, @PathVariable int id) {
		model.addAttribute("cash_voucher", cashVoucherService.getCashVoucherById(id));
		return "cash_voucher/cash_voucher_preview";
	}

}
