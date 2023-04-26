package com.spring.mvc.etc;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

@Component
@Slf4j // 로그 라이브러리
public class LogService {

    /**
    *  - 로그 : 발생시간이 중요!, 로그레벨, 파일저장 필요
    *  - 로그 라이브러리 : logback, log4j, slf4j
     *
     *  - 로그레벨
     *   1. trace : 애플리케이션 실행흐름 세부정보
     *   2. debug
     *   3. info
     *   4. warn
     *   5. error
     *   6. fatal
    * */
    public void showLog() {
        System.out.println("hello log!");

        log.trace("hello trace!");
        log.debug("hello debug!");
        log.info("hello info!");
        log.warn("hello warn!");
        log.error("hello error!");
    }

}
