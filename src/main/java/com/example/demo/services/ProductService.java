package com.example.demo.services;

import com.example.demo.models.Product;
import com.example.demo.models.User;
import com.example.demo.repository.ProductRepository;
import com.example.demo.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepository productRepository;
    private final UserRepository userRepository;
    public List<Product> listProducts(String title) {
        if(title != null) return productRepository.findByTitle(title);
        return productRepository.findAll();
    }
    public void saveProduct(Principal principal, Product product) {
        product.setUser(getUserByPrincipal(principal));
        log.info("Saving new {}", product);
        productRepository.save(product);
    }

    public User getUserByPrincipal(Principal principal) {
        if(principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public void deleteProducts(Long id){
       productRepository.deleteById(id);
    }

    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }

    public void updateProduct(Product product){
        Product updateProduct = productRepository.findById(product.getId()).orElseThrow();

        updateProduct.setTitle(product.getTitle());
        updateProduct.setDescription(product.getDescription());
        updateProduct.setPrice(product.getPrice());
        updateProduct.setWeight(product.getWeight());
        updateProduct.setBeing(product.getBeing());

        productRepository.save(updateProduct);
    }
}