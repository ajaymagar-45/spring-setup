package com.rainbowforest.Application.controller.admin;

import java.util.List;
import java.util.Locale;

import com.rainbowforest.Application.model.constructionSite.ConstructionSiteAdress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import com.rainbowforest.Application.model.constructionSite.ConstructionSite;
import com.rainbowforest.Application.model.order.Order;
import com.rainbowforest.Application.service.constructionsite.ConstructionSiteService;
import com.rainbowforest.Application.service.order.OrderService;
import com.rainbowforest.Application.validators.ConstructionSiteValidator;

@Controller
@Secured (value = {"ROLE_ADMIN","ROLE_USER"})
public class AdminConstructionSiteController {

	@Autowired
	private ConstructionSiteService constructionSiteService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MessageSource messageSource;
	
	@GetMapping("/admin/cs-form")
	public String csForm(Model model) {
		ConstructionSite cs = new ConstructionSite();
		cs.setConstructionSiteAdress(new ConstructionSiteAdress());
		model.addAttribute("cs", cs);
		return "admin/constructionsite/constructionsiteform";
	}
    @PostMapping("/admin/save-cs")
    public String saveCs(@ModelAttribute("cs") ConstructionSite cs,
                         BindingResult result,
                         Model model,
                         Locale locale) {

        ConstructionSiteValidator validator = new ConstructionSiteValidator();
        validator.validate(cs, result);
		if (cs.getConstructionSiteAdress() == null) {
			cs.setConstructionSiteAdress(new ConstructionSiteAdress());
		}

        if (result.hasErrors()) {
			result.getAllErrors().forEach(error -> {
				System.out.println(error);
			});
            return "admin/constructionsite/constructionsiteform";
        }

        constructionSiteService.addConstructionSite(cs);

        return "redirect:/admin/construction-sites";
    }

	@GetMapping("/admin/construction-site/stock-list")
	public String stockList(Model model) {
		List<ConstructionSite> constructionSiteList = constructionSiteService.findAllConstructionSite();
		model.addAttribute("constructionSiteList", constructionSiteList);
		return "admin/constructionsite/stocklist";
	}
	
	@GetMapping("/admin/construction-site/stock-list/details")
	public String stockListDetails(@RequestParam("csId") int csId,Model model) {
		List<Order> orders = orderService.findAllOrderByConstructionSiteId(csId);
		model.addAttribute("orders", orders);
		return "admin/constructionsite/stocklistdetails";
	}
	
	@GetMapping("/admin/construction-sites")
	public String constructionSites(Model model) {
		List<ConstructionSite> cs = constructionSiteService.findAllConstructionSite();
		model.addAttribute("cs", cs);
		return "admin/constructionsite/constructionsites";
	}
	
	@GetMapping("/admin/construction-sites/edit")
	public String editCs(@RequestParam("csid") int csid, Model model) {
		ConstructionSite cs = constructionSiteService.findOneCsById(csid);
		model.addAttribute("cs", cs);
		return "admin/constructionsite/editconstructionsite";
	}
	
	@PostMapping("/admin/construction-sites/update")
	public String updateCs(@RequestParam("csid") Integer id, @ModelAttribute ConstructionSite cs) {
		constructionSiteService.updateConstructionSiteAdress(
				cs.getConstructionSiteAdress().getStreet(), 
				cs.getConstructionSiteAdress().getStreetNumber(), 
				cs.getConstructionSiteAdress().getLocality(), 
				cs.getConstructionSiteAdress().getZipCode(), 
				cs.getConstructionSiteAdress().getCountry(), 
				id);
		constructionSiteService.updateConstructionSite(
				cs.getBuildingName(), 
				cs.getBuildingCode(), 
				cs.getStatus(), 
				id);
        return "redirect:/admin/construction-sites";
	}
}
