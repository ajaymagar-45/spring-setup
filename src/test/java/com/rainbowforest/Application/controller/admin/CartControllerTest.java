package com.rainbowforest.Application.controller.admin;

import com.rainbowforest.Application.controller.user.CartController;
import com.rainbowforest.Application.model.catalog.Item;
import com.rainbowforest.Application.model.catalog.Product;
import com.rainbowforest.Application.service.constructionsite.ConstructionSiteService;
import com.rainbowforest.Application.service.order.OrderDetailsService;
import com.rainbowforest.Application.service.product.ProductService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MockMvc;

import java.util.ArrayList;
import java.util.List;

import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@WebMvcTest(CartController.class)
class CartControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private ProductService productService;

    @MockBean
    private ConstructionSiteService constructionSiteService;

    @MockBean
    private OrderDetailsService orderDetailsService;

    @Test
    void shouldInitializeCartIfNotExists() throws Exception {
        mockMvc.perform(get("/cart"))
                .andExpect(status().isOk())
                .andExpect(model().attributeExists("totalPrice"));
    }

    @Test
    void shouldAddItemToCart() throws Exception {
        Product product = new Product();
        product.setId(1);

        when(productService.findOneProduct(1)).thenReturn(product);

        mockMvc.perform(post("/cart/add")
                        .param("itemId", "1")
                        .param("quantity", "2")
                        .sessionAttr("cart", new ArrayList<>()))
                .andExpect(status().is3xxRedirection());

        verify(productService).findOneProduct(1);
    }

    @Test
    void shouldDeleteItemFromCart() throws Exception {
        List<Item> cart = new ArrayList<>();
        cart.add(new Item(new Product(), 1));

        mockMvc.perform(post("/cart/delete-item")
                        .param("itemId", "1")
                        .sessionAttr("cart", cart))
                .andExpect(status().is3xxRedirection());
    }

    @Test
    void shouldUpdateCartItemQuantity() throws Exception {
        List<Item> cart = new ArrayList<>();
        Product p = new Product();
        p.setId(1);
        cart.add(new Item(p, 1));

        mockMvc.perform(post("/cart/update")
                        .param("itemId", "1")
                        .param("quantity", "5")
                        .sessionAttr("cart", cart))
                .andExpect(status().is3xxRedirection());
    }
}
