package com.spring.mvc.chap04.DTO;

import com.spring.mvc.chap04.entity.Grade;
import com.spring.mvc.chap04.entity.Score;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@RequiredArgsConstructor  // final만 골라서 초기화
// (final이므로 setter 불가 & responseDTO도 setter 없어도 됨)
@Getter @ToString @EqualsAndHashCode
public class ScoreListResponseDTO {
    private final int stuNum;
    private final String maskingName; // 첫글자 빼고는 *처리
    private final double average;
    private final Grade grade;


    public ScoreListResponseDTO(Score s) {
        this.stuNum = s.getStuNum();
        this.maskingName = makeMaskingName(s.getStuName());
        this.average = s.getAverage();
        this.grade = s.getGrade();
    }

    // 첫글자 빼고 * 처리하기
    private String makeMaskingName(String originalName) {
        String maskingName = String.valueOf(originalName.charAt(0));
        for (int i = 1; i < originalName.length(); i++) {
            maskingName += "*";
        }
        return maskingName;
    }
}
