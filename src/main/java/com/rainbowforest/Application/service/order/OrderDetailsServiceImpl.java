package com.rainbowforest.Application.service.order;

import com.rainbowforest.Application.model.catalog.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.rainbowforest.Application.model.order.OrderDetails;
import com.rainbowforest.Application.model.order.OrderDetails;
import com.rainbowforest.Application.model.constructionSite.ConstructionSite;
import com.rainbowforest.Application.model.catalog.Product;
import com.rainbowforest.Application.repository.OrderDetailsRepository;
import com.rainbowforest.Application.service.constructionsite.ConstructionSiteService;
import com.rainbowforest.Application.service.product.ProductService;

@Service
@Transactional
public class OrderDetailsServiceImpl implements OrderDetailsService {

	@Autowired
	private OrderDetailsRepository orderDetailsRepository;

	@Autowired
	private ConstructionSiteService constructionSiteService;

	@Autowired
	private ProductService productService;



	@Override
	public void saveOrder(OrderDetails order) {

		// Handle detached ConstructionSite
		if (order.getConstructionSite() != null && order.getConstructionSite().getId() > 0) {
			ConstructionSite managedSite = constructionSiteService.findById(order.getConstructionSite().getId());
			order.setConstructionSite(managedSite);
		}

		// Handle Items properly
		if (order.getOrderItems() != null) {
			for (Item item : order.getOrderItems()) {   // ✅ FIXED

				if (item.getProduct() != null && item.getProduct().getId() > 0) {
					Product managedProduct = productService.findById(item.getProduct().getId());
					item.setProduct(managedProduct);
				}

				// VERY IMPORTANT (relationship mapping)
				item.setOrderDetails(order);
			}
		}

		orderDetailsRepository.save(order);
	}

	@Override
	public OrderDetails findOneOrderDetailsById(Integer id) {
		OrderDetails orderDetails = orderDetailsRepository.getOne(id);
		return orderDetails;
	}
}