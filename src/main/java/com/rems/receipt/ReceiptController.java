package com.rems.receipt;


import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Enumerated;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.rems.enumeration.PaymentType;

@Controller
@RequestMapping("/receipt")
public class ReceiptController {

	@Autowired
	private ReceiptService receiptService;

	@RequestMapping(value = "")
	public String getAllReceipts(Model model) {
		model.addAttribute("receipts", receiptService.getAllReceipts());
		model.addAttribute("mode", "show");
		return "home";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String getRecipet(@PathVariable int id, Model model) {
		model.addAttribute("mode", "show");
		return "home";
	}
	
	@RequestMapping(value = "/update")
	public String updateRecipet(Model model, @RequestParam int id,Receipt receipt) {
		model.addAttribute("mode", "edit");
		model.addAttribute("receipt", receiptService.getReceiptById(id));
		return "home";
	}
	
	@RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
	public String save(@ModelAttribute Receipt receipt,Model model,@PathVariable int id)
	{
		receiptService.updateReceiptById(id, receipt);
		model.addAttribute("mode", "edit");
		return "redirect:/receipt";
	}
	
	

	@RequestMapping(value = "/delete/{id}")
	public String deleteRecipet(Model model, @PathVariable int id) {
		receiptService.deleteReceipt(id);
		model.addAttribute("mode", "show");
		return "redirect:/receipt";
	}
	@RequestMapping(value = "/new",method = RequestMethod.GET)
	public  String newReceipt(Model model,Receipt receipt)
	{
		model.addAttribute("mode", "new_receipt");
		return "home";
		
	}
	@RequestMapping(value = "/new",method = RequestMethod.POST)
	public  String newAddReceipt(Model model,@ModelAttribute("receipt") Receipt receipt)
	{
		System.out.println(receipt);
		model.addAttribute("mode", "new_receipt");
		/*receipt.setPaymentType(receipt.getPaymentType());
		receipt.setCashReceivedFrom(receipt.getCashReceivedFrom());*/	
		receiptService.save(receipt);
		return "home";
		
	}

	@InitBinder
	private void dateBinder(WebDataBinder binder) {
	            //The date format to parse or output your dates
	    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	            //Create a new CustomDateEditor
	    CustomDateEditor editor = new CustomDateEditor(dateFormat, true);
	            //Register it as custom editor for the Date type
	    binder.registerCustomEditor(Date.class, editor);
	    binder.registerCustomEditor(Enumerated.class, editor);
	}

	
}
