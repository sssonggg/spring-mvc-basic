package com.spring.mvc.chap05.service;

import com.spring.mvc.chap05.dto.LoginRequestDTO;
import com.spring.mvc.chap05.dto.SignUpRequestDTO;
import com.spring.mvc.chap05.repository.MemberMapper;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;
@SpringBootTest
class MemberServiceTest {

    @Autowired
    MemberService memberService;

    @Test
    @DisplayName("SignUpDTO를 전달하면 회원가입이 정상적으로 되어야 한다.")
    public void joinTest() {
        //given
        SignUpRequestDTO dto = new SignUpRequestDTO();
        dto.setAccount("kakaka5");
        dto.setName("카카옹");
        dto.setPassword("aaa1234");
        dto.setEmail("kaka@kakak.com");

        //when
        memberService.join(dto);
    }

    @Test
    @DisplayName("계정명이 abc1234인 회원의 로그인시도 결과 검증을 " +
            "상황별로 수행해야 한다.")
    void loginTest() {
        //given
        LoginRequestDTO dto = new LoginRequestDTO();
        dto.setAccount("apple");
        dto.setPassword("a1234@");

        //when
        LoginResult result = memberService.authenticate(dto);

        //then
        assertEquals(LoginResult.SUCCESS, result);
    }

}