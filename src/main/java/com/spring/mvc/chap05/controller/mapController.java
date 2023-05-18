package com.spring.mvc.chap05.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/map")
@Slf4j
public class mapController {

    @GetMapping("/kakao-map")
    public String kakaoMap() {
        return "weather/map";
    }

    @GetMapping("/weather")
    public String test() {
        return "weather/weather01";
    }
}
