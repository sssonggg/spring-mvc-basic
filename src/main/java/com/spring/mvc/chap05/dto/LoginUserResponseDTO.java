package com.spring.mvc.chap05.dto;

import lombok.*;

@Setter @Getter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LoginUserResponseDTO {  // 서버가 ct에게 줄 데이터

    private String account;
    private String nickName;
    private String email;
    private String auth;
}
