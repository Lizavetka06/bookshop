package com.example.demo.controllers;

import com.example.demo.models.Basket;
import com.example.demo.models.Product;
import com.example.demo.services.BasketService;
import com.example.demo.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
public class BasketController {
    private final BasketService basketService;

    @GetMapping("/basket")
    public String basket(Model model){
        model.addAttribute("basket", basketService.listBasket());
        return "basket";
    }

    @PostMapping("/basket/add")
    public String addToBasket(@RequestParam(value = "productName") String productName,
                              @RequestParam(value = "productDescription") String productDescription,
                              @RequestParam(value = "productPrice") int productPrice,
                              @RequestParam(value = "productWeight") int productWeight,
                              @RequestParam(value = "productBeing") int productBeing) {
        if (productBeing == 0) {
            return "redirect:/";
        }
        Basket basket = new Basket();
        basket.setTitle(productName);
        basket.setDescription(productDescription);
        basket.setPrice(productPrice);
        basket.setWeight(productWeight);
        basketService.addProductToBasket(basket);
        return "redirect:/";
    }

    @PostMapping("/basket/delete/{id}")
    public String deleteFromBasket(@PathVariable Long id) {
        basketService.deleteProductFromBasket(id);
        return "redirect:/basket";
    }

    @PostMapping("/basket/deleteAll")
    public String deleteAllFromBasket() {
        basketService.deleteAllFromBasket();
        return "redirect:/basket";
    }
}

