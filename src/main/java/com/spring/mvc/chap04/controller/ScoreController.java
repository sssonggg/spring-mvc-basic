package com.spring.mvc.chap04.controller;

import com.spring.mvc.chap04.entity.Score;
import com.spring.mvc.chap04.entity.ScoreRequestDTO;
import com.spring.mvc.chap04.repository.ScoreRepository;
import com.spring.mvc.chap04.repository.ScoreRepositoryImpl;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
* # 요청 URL
 * 1. 학생 성적정보 등록화면을 보여주고 성적정보 목록조회 처리
 *    - /score/list : GET    - 확인 404메시지 OK.
 * 2. 성적 정보 등록 처리 요청
 *    - /score/register : POST    - 확인 405메시지 OK.
 * 3. 성적 정보 삭제 요청
 *    - /score/remove : POST    - 확인 405메시지 OK.
 * 4. 성적 정보 상세 조회요청
 *    - /score/detail : GET    - 확인 404메시지 OK.
 * */

@Controller
@RequestMapping("/score")
//@AllArgsConstructor   // 모든 필드를 초기화 하는 생성자
@RequiredArgsConstructor  // final 필드만 초기화하는 생성자
public class ScoreController {

    // 저장소에 의존해야 데이터를 받아서 클라이언트에게 응답할 수 있음
    private final ScoreRepository repository;

    // 만약에 클래스의 생성자가 단 한개라면
    // 자동으로 @Autotwired를 써줌
//    @Autowired
//    public ScoreController(ScoreRepository repository) {
//
//        this.repository = repository;
//    }
    /**
     * 1. 성적등록화면 띄우기 + 정보목록조회
     */
    @GetMapping("/list")
    public String list(Model model, @RequestParam(defaultValue = "num") String sort) {
        System.out.println("/score/list : GET!");
        System.out.println("정렬 요구사항 : "+ sort);

        List<Score> scoreList = repository.findAll(sort);
        model.addAttribute("sList", scoreList);
        return "chap04/score-list";
    }
    /**
     * 2. 성적 정보 등록 처리 요청
     */
    @PostMapping("/register")
    public String register(ScoreRequestDTO dto) {

        // 입력데이터(쿼리스트링) 읽기
        System.out.println("/score/register : POST!" + dto);

        // dto(ScoreDTO)를 entity(Score)로 변환해야 함.
        Score score = new Score(dto);

        // save 명령
        repository.save(score);

        /* !!리다이렉트!! "redirect:요청URL(경로x)"
        * 등록요청에서 JSP 뷰 포워딩을 하면
        * 갱신된 목록을 다시 한번 저장소에서 불러와
        * 모델에 담는 추가적인 코드가 필요하지만
        *
        * 리다이렉트를 통해서 위에서 만든 /score/list : GET
        * 을 자동으로 다시 보낼 수 있다면, 번거로운 코드가 줄어듦.
        * */
        return "redirect:/score/list";
    }
    /**
     * 3. 성적 정보 삭제 요청
     */
    @GetMapping("/remove")
    public String remove(@RequestParam int stuNum) {
        System.out.println("/score/remove : GET!");

        repository.deleteByStuNum(stuNum);

        return "redirect:/score/list";
    }
    /**
     * 4. 성적 정보 상세 조회
     */
    @GetMapping("/detail")
    public String detail(@RequestParam int stuNum, Model model) {
        System.out.println("/score/detail : GET!");
        Score detail = repository.findByStuNum(stuNum);

        model.addAttribute("detailNum", detail);

        return "chap04/score-detail";
    }

    /**
     * 5. 성적 정보 수정 폼
     * */
    @GetMapping("/modify")
    public String modify(int stuNum, Model model) {
        System.out.println("/score/modify : GET!");
        Score byStuNum = repository.findByStuNum(stuNum);

        model.addAttribute("stuNum", byStuNum);
        return "chap04/score-modify";
    }
    /**
     * 6. 성적 정보 수정하기
     * */
    @PostMapping("/modify")
    public String modify(int stuNum, ScoreRequestDTO dto) {
        System.out.println("/score/modify : POST!");
        Score score = repository.findByStuNum(stuNum);
        score.changeScore(dto);
        return "redirect:/score/detail?stuNum=" + stuNum;
    }

}
