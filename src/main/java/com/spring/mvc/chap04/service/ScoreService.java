package com.spring.mvc.chap04.service;

import com.spring.mvc.chap04.DTO.ScoreListResponseDTO;
import com.spring.mvc.chap04.DTO.ScoreRequestDTO;
import com.spring.mvc.chap04.entity.Score;
import com.spring.mvc.chap04.repository.ScoreRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

// 컨트롤러와 레파지토리 사이에서 비즈니스 로직을 처리
// ex) 트랜젝션 처리, 예외처리 , dto 변환처리

@RequiredArgsConstructor
@Service  // service 빈 등록
public class ScoreService {
    private final ScoreRepository scoreRepository;


    // 목록조회 중간처리

    /**
     * 컨트롤러는 데이터베이스를 통해
     * 성적정보 리스트를 가져오길 원한다.
     * 그런데 데이터베이스는 성적정보를 전부 모아서준다.
     * 컨트롤러는 정보를 일부만 받았으면 좋겠다.
     */

    public List<ScoreListResponseDTO> getList(String sort) {

        // scoreList 에서 원하는 정보만 추출하고 이름을 마스킹해서
        // 다시 DTO리스트로 변환해줘야 함.
        return scoreRepository.findAll(sort)
                .stream()
                .map(s -> new ScoreListResponseDTO(s))
                .collect(Collectors.toList());
    }

    /**
     * 등록 중간 처리
     */
    public boolean insertScore(ScoreRequestDTO dto) {
        // dto(ScoreDTO)를 entity(Score)로 변환해야 함.
        // save 명령
        return scoreRepository.save(new Score(dto));
    }

    // 삭제 중간처리
    public boolean delete(int stuNum) {
        return scoreRepository.deleteByStuNum(stuNum);
    }

    // 상세조회, 수정화면조회 중간처리
    public Score retrieve(int stuNum) {
        // 만약 스코어 전체데이터 아닌 몇개만 전후처리를 원할 때
        return scoreRepository.findByStuNum(stuNum);
    }
}
