package com.rainbowforest.Application.controller.api;

import com.rainbowforest.Application.model.order.Order;
import com.rainbowforest.Application.model.order.OrderDetails;
import com.rainbowforest.Application.service.order.OrderDetailsService;
import com.rainbowforest.Application.service.order.OrderService;
import com.rainbowforest.Application.utilities.UserUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/orders")
@Secured({"ROLE_ADMIN", "ROLE_USER"})
public class OrderRestController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderDetailsService orderDetailsService;

    /** All orders — admin only */
    @GetMapping
    @Secured("ROLE_ADMIN")
    public ResponseEntity<List<Order>> getAllOrders() {
        return ResponseEntity.ok(orderService.findAllOrders());
    }

    /** My orders */
    @GetMapping("/my")
    public ResponseEntity<List<Order>> getMyOrders() {
        String userName = UserUtilities.getLoggedUser();
        return ResponseEntity.ok(orderService.getAllOrdersByUserName(userName));
    }

    /** Order details by orderDetails ID */
    @GetMapping("/details/{id}")
    public ResponseEntity<OrderDetails> getDetails(@PathVariable int id) {
        OrderDetails od = orderDetailsService.findOneOrderDetailsById(id);
        return od != null ? ResponseEntity.ok(od) : ResponseEntity.notFound().build();
    }

    /** Save a new order (checkout) */
    @PostMapping("/save")
    public ResponseEntity<OrderDetails> saveOrder(@RequestBody OrderDetails orderDetails) {
        if (orderDetails.getOrder() == null) {
            orderDetails.setOrder(new Order());
        }
        orderDetails.getOrder().setDate(LocalDate.now());
        orderDetails.getOrder().setOrderingParty(UserUtilities.getLoggedUser());
        orderDetails.getOrder().setStatus(0);
        orderDetailsService.saveOrder(orderDetails);
        return ResponseEntity.ok(orderDetails);
    }

    /** Update order status — admin only */
    @PutMapping("/{orderId}/status")
    @Secured("ROLE_ADMIN")
    public ResponseEntity<Void> updateStatus(@PathVariable int orderId, @RequestBody Map<String, Integer> body) {
        orderService.updateOrderStatus(body.get("status"), orderId);
        return ResponseEntity.noContent().build();
    }

    /** Orders by construction site */
    @GetMapping("/by-site/{csId}")
    public ResponseEntity<List<Order>> getBySite(@PathVariable int csId) {
        return ResponseEntity.ok(orderService.findAllOrderByConstructionSiteId(csId));
    }
}
