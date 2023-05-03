package com.spring.mvc.chap05.repository;

import com.spring.mvc.chap05.dto.page.Page;
import com.spring.mvc.chap05.dto.page.Search;
import com.spring.mvc.chap05.entity.Board;
import com.spring.mvc.chap05.entity.Reply;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class ReplyMapperTest {

    @Autowired
    BoardMapper boardMapper;
    @Autowired
    ReplyMapper replyMapper;

   /* @Test
    @DisplayName("게시물 300개를 등록하고 " +
            "각 게시물에 랜덤으로 1000개의 " +
            "댓글을 나눠서 등록해야 한다.")
    void bulkInsertTest() {

        for (int i = 1; i <= 300; i++) {
            Board b = Board.builder()
                    .title("재밌는 게시물 " + i)
                    .content("노잼 게시물 내용 " + i)
                    .build();
            boardMapper.save(b);
        }
        assertEquals(300, boardMapper.count(new Search()));

        for (int i = 1; i <= 1000; i++) {
            Reply r = Reply.builder()
                    .replyWriter("잼민이 " + i)
                    .replyText("말똥이~~~" + i)
                    .boardNo((long) (Math.random() * 300 + 1))
                    .build();
            replyMapper.save(r);
        }

    }*/

    @Test
    void bulkReplyInsert() {
        for (int i = 0; i < 300; i++) {
            Reply reply = Reply.builder()
                    .replyText("페이지댓글" + i)
                    .replyWriter("잼순이")
                    .boardNo(298L)
                    .build();
            replyMapper.save(reply);
        }
    }

    @Test
    @DisplayName("댓글을 3번 게시물에 등록하면 3번 게시물의 총 댓글 수는 5개여야 한다.")
    @Transactional
    @Rollback
    void saveTest() {
        //given
        long boardNo = 3L;
        Reply newReply = Reply.builder()
                .replyText("포켓몬스터")
                .replyWriter("피카츄")
                .boardNo(boardNo)
                .build();
        //when
        boolean flag = replyMapper.save(newReply);

        //then
        assertTrue(flag); // 세이브가 성공할거라고 단언
        assertEquals(5, replyMapper.count(boardNo));
    }

    @Test
    @DisplayName("999번 댓글의 내용을 수정한 후 " +
            "다시 조회했을 때 제목이 수정된 제목이어야 한다.")
    @Transactional
    @Rollback
    void modifyTest() {
        //given
        long replyNo = 999L;
        String newReplyText = "수정댓그을";
        Reply r = Reply.builder()
                .replyText(newReplyText)
                .replyNo(replyNo)
                .build();
        //when
        boolean flag = replyMapper.modify(r);
        //then
        assertTrue(flag);
        assertEquals(newReplyText, replyMapper.findOne(replyNo).getReplyText());
    }


    @Test
    @DisplayName("댓글 번호가 1001번인 댓글을 삭제하면 3번 게시물의 총 댓글 수는 3이어야 한다.")
    @Transactional
    @Rollback
    void removeTest() {
        //given
        long boardNo = 3L;
        long replyNo = 1001L;

        //when
        boolean flag = replyMapper.deleteOne(replyNo);

        //then
        assertTrue(flag); // 세이브가 성공할거라고 단언
        assertEquals(3, replyMapper.count(boardNo));
    }

    @Test
    @DisplayName("댓글 번호가 223번인 댓글을 상세조회하면 말똥이~~~223이라는 글이 나와야한다.")
    void findOneTest() {
        //given
        long replyNo = 223L;

        //when
        Reply r = replyMapper.findOne(replyNo);

        //then
        System.out.println("r = " + r);
        assertEquals("잼민이 223", r.getReplyWriter());
    }

    @Test
    @DisplayName("게시물번호 10번을 조회하면 4개의 댓글이 조회되어야 한다.")
    void findAllTest() {
        //given
        long boardNo = 10L;

        //when
        List<Reply> all = replyMapper.findAll(boardNo, new Page());

        //then
        assertEquals(4, all.size());
        assertEquals("잼민이 611", all.get(2).getReplyWriter());
    }


}