package com.example.demo.models;

import javax.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "basket")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Basket {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private Long id;
    @Column(name = "Название")
    private String title;
    @Column(name = "Описание")
    private String description;
    @Column(name = "Цена")
    private int price;
    @Column(name = "Вес")
    private int weight;
    @Column(name = "Наличие")
    private int being;
}