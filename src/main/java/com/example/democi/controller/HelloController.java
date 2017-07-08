package com.example.democi.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @RequestMapping("/")
    String home() {
        return "Hello";
    }

    @RequestMapping("/health")
    String health() {
        return "All fine";
    }
}
