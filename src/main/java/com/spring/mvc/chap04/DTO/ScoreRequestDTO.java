package com.spring.mvc.chap04.entity;

import lombok.*;

@Setter @Getter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class ScoreRequestDTO {
    private String name;  // 학생 이름
    private int kor, eng, math;  // 국, 영, 수 점수 private String name;

}
