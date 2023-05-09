package com.spring.mvc.chap04.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class testCon {

    @GetMapping("/weather")
    public String weatherOrder() {
        System.out.println("/test/weather : GET 요청 발생!");
        return "weather/weather01";
    }
}
