package com.rainbowforest.Application.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.rainbowforest.Application.model.order.Order;
import com.rainbowforest.Application.model.order.OrderDetails;
import com.rainbowforest.Application.service.order.OrderDetailsService;
import com.rainbowforest.Application.service.order.OrderService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@Secured(value = {"ROLE_ADMIN","ROLE_USER"})
public class AdminOrderController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderDetailsService orderDetailsService;
	

	@GetMapping("/admin/orders")
	public String orders(Model model) {
		List<Order> orders = orderService.findAllOrders();
		model.addAttribute("orders", orders);
		return "admin/order/orders";
	}
	

	@GetMapping("/admin/orders/details")
	public String orderDetails(@RequestParam("orderDetailsId") int orderDetailsId, Model model) {
		OrderDetails orderDetails = orderDetailsService.findOneOrderDetailsById(orderDetailsId);
		model.addAttribute("orderDetails", orderDetails);
		return "admin/order/orderdetails";
	}


    @PostMapping("/admin/orders/update-status")  // Explicit POST
    public String updateStatus(@RequestParam("orderId") int orderId,
                               @RequestParam("status") int status,
                               RedirectAttributes redirectAttributes) {  // Add this
        orderService.updateOrderStatus(status, orderId);
        redirectAttributes.addFlashAttribute("message", "Status updated successfully!");
        return "redirect:/admin/orders";  // ✅ REDIRECT - safe refresh
    }
	

	@GetMapping("/admin/orders/history")
	public String ordersHistory(Model model) {
		List<Order> orders = orderService.findAllOrders();
		model.addAttribute("orders", orders);
		return "admin/order/ordershistory";
	}
}
