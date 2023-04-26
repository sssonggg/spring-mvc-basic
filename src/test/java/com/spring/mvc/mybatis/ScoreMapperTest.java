package com.spring.mvc.mybatis;

import com.spring.mvc.chap04.DTO.ScoreRequestDTO;
import com.spring.mvc.chap04.entity.Score;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ScoreMapperTest {

    @Autowired
    ScoreMapper mapper;

    @Test
    void findAll() {
    }

    @Test
    @DisplayName("마이바티스 매퍼로 점수정보 저장에 성공해야 한다.")
    void save() {
        // given
        ScoreRequestDTO dto = ScoreRequestDTO.builder()
                .name("텔레토비")
                .kor(80)
                .eng(90)
                .math(100)
                .build();
        Score s = new Score(dto);

        // when
        boolean flag = mapper.save(s);

        //then
        assertTrue(flag);
    }

    @Test
    void deleteByStuNum() {
    }

    @Test
    void findByStuNum() {
    }
}