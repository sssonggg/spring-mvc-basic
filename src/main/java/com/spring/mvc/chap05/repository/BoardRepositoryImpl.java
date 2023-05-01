package com.spring.mvc.chap05.repository;

import com.spring.mvc.chap05.dto.BoardListResponseDTO;
import com.spring.mvc.chap05.entity.Board;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.*;

import static java.util.Comparator.comparing;
import static java.util.stream.Collectors.toList;

@Repository
public class BoardRepositoryImpl
        implements BoardRepository {

    private final static Map<Integer, Board> boardMap;
    private static int sequence;

    static {
        boardMap = new HashMap<>();
        Board board1 = new Board(++sequence, "ENFP 45문답", "일상생활에서 찾는 의미 활동가는 친절하고 사교적인 성격으로 다른 사람과의 관계를 맺는 일과 사교 활동을 즐깁니다. 하지만 사교적이고 느긋해 보이는 겉모습과 달리 깊은 내면을 지니고 있으며 상상력과 창의력이 풍부하고 호기심이 많은 성격입니다.");
        Board board2 = new Board(++sequence, "INTJ 인상", "최고가 되는 것은 외로운 일입니다. 매우 희귀한 성격이면서도 뛰어난 능력을 지닌 전략가(INTJ)는 이러한 말의 의미를 잘 알고 있습니다. 전략가는 이성적이면서도 두뇌 회전이 빠른 성격으로, 자신의 뛰어난 사고 능력을 자랑스러워하며 거짓말과 위선을 꿰뚫어 보는 능력이 있습니다.");
        Board board3 = new Board(++sequence, "같은 ISFJ끼리 만나면 어떨까?", "책임감이 강하고 침착한 성격인 ISFJ 유형은 신뢰를 기반으로 한 연애 관계와 결혼에서 안정감을 느끼는 사람들이 많습니다. 이들은 혼자 있는 것을 좋아하면서도 다른 사람과 1:1로 깊은 관계를 형성하는 것을 좋아합니다. 또한 한번 사랑을 시작하면 헌신적이고 가정적인 면모를 보여줍니다.");


        boardMap.put(board1.getBoardNo(), board1);
        boardMap.put(board2.getBoardNo(), board2);
        boardMap.put(board3.getBoardNo(), board3);
    }

    @Override
    public List<Board> findAll() {
        return boardMap.values()
                .stream()
                .sorted(comparing(Board::getBoardNo).reversed())
                .collect(toList())
                ;
    }

    @Override
    public Board findOne(int boardNo) {
        return boardMap.get(boardNo);
    }

    @Override
    public boolean save(Board board) {
        board.setBoardNo(++sequence);
        LocalDateTime regDateTime = board.getRegDateTime();
        Date ddd = Date.from(regDateTime.atZone(ZoneId.systemDefault()).toInstant());
        System.out.println("ddd = " + ddd);

        LocalDateTime eee = new Timestamp(ddd.getTime()).toLocalDateTime();
        System.out.println("eee = " + eee);

        boardMap.put(board.getBoardNo(), board);
        return true;
    }

    @Override
    public boolean deleteByNo(int boardNo) {
        boardMap.remove(boardNo);
        return true;
    }
}