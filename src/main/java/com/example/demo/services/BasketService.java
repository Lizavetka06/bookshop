package com.example.demo.services;

import com.example.demo.models.Basket;
import com.example.demo.models.Product;
import com.example.demo.repository.BasketRepository;
import com.example.demo.repository.ProductRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class BasketService {
    private final BasketRepository basketRepository;
    private final ProductRepository productRepository;

    public List<Basket> listBasket() {
        return basketRepository.findAll();
    }

    public void addProductToBasket(Basket basket) {
        basketRepository.save(basket);
    }

    public void deleteProductFromBasket(Long id) {
        basketRepository.deleteById(id);
    }

    public void deleteAllFromBasket() {
        List<Basket> basketProducts = basketRepository.findAll();
        //for (Basket b : basketProducts){
        //    Product product = productRepository.findById(b.getId()).orElseThrow();
            //product.setBeing(product.getBeing()-1);
        //}
        basketRepository.deleteAll();
    }
}