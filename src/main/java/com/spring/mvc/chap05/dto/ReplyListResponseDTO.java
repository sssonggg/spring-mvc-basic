package com.spring.mvc.chap05.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.spring.mvc.chap05.dto.page.Page;
import com.spring.mvc.chap05.dto.page.PageMaker;
import com.spring.mvc.chap05.entity.Reply;
import lombok.*;

import java.time.LocalDateTime;
import java.util.List;
@Setter @Getter @ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReplyListResponseDTO {

    // 언터티를 DTO로 변환하는 생성자
    private int count;  // 총 댓글 수
    private PageMaker pageInfo;  // 페이지 정보
    private List<ReplyDetailResponseDTO> replies; // 댓글 리스트


}
