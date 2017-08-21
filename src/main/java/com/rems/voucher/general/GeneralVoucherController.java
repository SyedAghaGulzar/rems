package com.rems.voucher.general;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rems.enumeration.PaymentType;
import com.rems.party.PartyService;
import com.rems.receipt.Receipt;

@Controller
@RequestMapping("/voucher/general")
public class GeneralVoucherController {

	@Autowired
	private GeneralVoucherService generalVoucherService;

	@Autowired
	private PartyService partyService;

	// view all receipts
	@RequestMapping
	public String getAllGeneralVouchers(Model model) {
		model.addAttribute("general_vouchers", generalVoucherService.getAllGeneralVouchers());
		return "voucher/general/general_voucher_list";
	}

	// edit receipt form
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String getGeneralVoucher(@PathVariable int id, Model model) {

		model.addAttribute("general_voucher", generalVoucherService.getGeneralVoucherById(id))
			 .addAttribute("partyList",partyService.getAllParties());

		return "voucher/general/general_voucher_form";
	}

	// add receipt form
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String generalVoucherForm(Model model) {

		model.addAttribute("general_voucher", new GeneralVoucher())
			 .addAttribute("partyList",partyService.getAllParties());

		return "voucher/general/general_voucher_form";
	}

	// save new receipt
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String saveGeneralVoucher(Model model, @ModelAttribute("general_voucher") GeneralVoucher generalVoucher) {
		generalVoucherService.save(generalVoucher);
		return "redirect:/voucher/general";
	}

	// update receipt
	@RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
	public String updateGeneralVoucher(@ModelAttribute GeneralVoucher generalVoucher, Model model, @PathVariable int id) {
		generalVoucherService.updateGeneralVoucherById(id, generalVoucher);
		return "redirect:/voucher/general";
	}

	// delete receipt
	@RequestMapping(value = "/delete/{id}")
	public String deleteGeneralVoucher(Model model, @PathVariable int id) {
		generalVoucherService.deleteGeneralVoucher(id);
		return "redirect:/voucher/general";
	}

	// print receipt
	@RequestMapping(value = "/print/{id}")
	public String printGeneralVoucher(@ModelAttribute GeneralVoucher generalVoucher, Model model, @PathVariable int id) {
		model.addAttribute("general_voucher", generalVoucherService.getGeneralVoucherById(id));
		return "voucher/general/general_voucher_preview";
	}
	// generate cash vouchers for specific party
		@RequestMapping(value = "/party/{partyId}")
		public String generatePartyGeneralVouchers(@ModelAttribute GeneralVoucher general_voucher, Model model, @PathVariable int partyId) {
			List<GeneralVoucher> generalVouchers = generalVoucherService.findAllGeneralVouchersByPartyId(partyId);
			model.addAttribute("generalVoucher",generalVouchers);
			model.addAttribute("total",generalVoucherService.calculateTotalAmount(generalVouchers));
			return "voucher/general/party_general_voucher_list";
		}

}
