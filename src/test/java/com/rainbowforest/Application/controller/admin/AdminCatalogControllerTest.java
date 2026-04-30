package com.rainbowforest.Application.controller.admin;

import com.rainbowforest.Application.controller.AdminCatalogController;
import com.rainbowforest.Application.model.catalog.Product;
import com.rainbowforest.Application.service.product.ProductService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.context.MessageSource;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(AdminCatalogController.class)
class AdminCatalogControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockBean
    private ProductService productService;

    @MockBean
    private MessageSource messageSource;

    // 🔹 Test: GET add item page
    @Test
    void shouldReturnAddItemPage() throws Exception {
        mockMvc.perform(get("/admin/catalog/add-item"))
                .andExpect(status().isOk())
                .andExpect(view().name("admin/catalog/itemform"))
                .andExpect(model().attributeExists("product"));
    }

    // 🔹 Test: Save item - validation error
    @Test
    void shouldReturnForm_whenValidationFails() throws Exception {
        mockMvc.perform(post("/admin/catalog/save-item")
                        .flashAttr("product", new Product()))
                .andExpect(status().isOk())
                .andExpect(view().name("admin/catalog/itemform"))
                .andExpect(model().attributeExists("product"));
    }

    // 🔹 Test: Save item - success
    @Test
    void shouldSaveProduct_whenValid() throws Exception {
        Product product = new Product();
        product.setProductName("Test");

        when(messageSource.getMessage(any(), any(), any()))
                .thenReturn("Saved successfully");

        mockMvc.perform(post("/admin/catalog/save-item")
                        .flashAttr("product", product))
                .andExpect(status().isOk())
                .andExpect(model().attributeExists("message"));

        verify(productService, times(1)).saveProduct(any(Product.class));
    }

    // 🔹 Test: Get all products
    @Test
    void shouldReturnProductsPage() throws Exception {
        when(productService.findAllProducts()).thenReturn(List.of(new Product()));

        mockMvc.perform(get("/admin/catalog/products"))
                .andExpect(status().isOk())
                .andExpect(view().name("admin/catalog/products"))
                .andExpect(model().attributeExists("products"));
    }

    // 🔹 Test: Edit item
    @Test
    void shouldReturnEditPage() throws Exception {
        when(productService.findOneProduct(1)).thenReturn(new Product());

        mockMvc.perform(get("/admin/catalog/edit-item")
                        .param("itemId", "1"))
                .andExpect(status().isOk())
                .andExpect(view().name("admin/catalog/editproduct"))
                .andExpect(model().attributeExists("product"));
    }

    // 🔹 Test: Search product
    @Test
    void shouldReturnSearchResults() throws Exception {
        when(productService.findByProductName("test"))
                .thenReturn(List.of(new Product()));

        mockMvc.perform(get("/admin/catalog/product")
                        .param("productName", "test"))
                .andExpect(status().isOk())
                .andExpect(view().name("admin/catalog/products"))
                .andExpect(model().attributeExists("products"));
    }

    // 🔹 Test: Update item
    @Test
    void shouldUpdateProductAndRedirect() throws Exception {
        mockMvc.perform(post("/admin/catalog/update-item")
                        .param("itemId", "1")
                        .flashAttr("product", new Product()))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/admin/catalog/products"));

        verify(productService, times(1))
                .updateItem(any(), any(), any(), any(), any(), eq(1));
    }
}
