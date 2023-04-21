package com.spring.mvc.chap04.repository;

import com.spring.mvc.chap04.entity.Score;
import com.spring.mvc.chap04.DTO.ScoreRequestDTO;

import java.util.List;

// [인터페이스] 역할 명세(=추상화) :
// 성적정보를 잘 저장, 조회, 삭제, 수정해야 함.
// Q. 그래서 어디에 저장/ 어디에서 조회&삭제&수정 하나요?
//
public interface ScoreRepository {

    // 성적 정보 전체 목록 조회
    List<Score> findAll(); // 일반 목록조회

    default List<Score> findAll(String sort){
        return null;
    }  // 정렬 목록조회 - default 처음 설계와 달리 강제 오버라이딩 할 경우

    // 성적 정보 등록
    boolean save(Score score);

    // 성적 정보 한개 삭제
    boolean deleteByStuNum(int stuNum);

    // 성적 정보 개별 조회
    Score findByStuNum(int stuNum);

    // 성적 정보 수정
    public boolean modifyByScore(int stuNum, ScoreRequestDTO dto);
}
