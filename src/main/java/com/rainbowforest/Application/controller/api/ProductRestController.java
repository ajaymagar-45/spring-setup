package com.rainbowforest.Application.controller.api;

import com.rainbowforest.Application.model.catalog.Product;
import com.rainbowforest.Application.service.product.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/products")
@Secured({"ROLE_ADMIN", "ROLE_USER"})
public class ProductRestController {

    @Autowired
    private ProductService productService;

    @GetMapping
    public ResponseEntity<List<Product>> getAll() {
        return ResponseEntity.ok(productService.findAllProducts());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Product> getOne(@PathVariable int id) {
        Product p = productService.findOneProduct(id);
        return p != null ? ResponseEntity.ok(p) : ResponseEntity.notFound().build();
    }

    @GetMapping("/search")
    public ResponseEntity<List<Product>> search(@RequestParam("name") String name) {
        return ResponseEntity.ok(productService.findByProductName(name));
    }

    @PostMapping
    @Secured("ROLE_ADMIN")
    public ResponseEntity<Product> save(@RequestBody Product product) {
        productService.saveProduct(product);
        return ResponseEntity.ok(product);
    }

    @PutMapping("/{id}")
    @Secured("ROLE_ADMIN")
    public ResponseEntity<Product> update(@PathVariable int id, @RequestBody Product product) {
        productService.updateItem(
                product.getProductCode(),
                product.getProductName(),
                product.getProductCategory(),
                product.getAvailability(),
                product.getProductPrice(),
                id);
        return ResponseEntity.ok(product);
    }

    @DeleteMapping("/{id}")
    @Secured("ROLE_ADMIN")
    public ResponseEntity<Void> delete(@PathVariable int id) {
        // Add deleteProduct to ProductService if not present
        return ResponseEntity.noContent().build();
    }
}
