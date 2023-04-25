package com.spring.mvc.jdbc;


// 엔터티 : 이 클래스는 데이터베이스 테이블과 연동을 위한 객체
// DB table의 컬럼과 1:1로 매칭되는 필드를 적어주세요.

import lombok.*;

import java.sql.ResultSet;
import java.sql.SQLException;

@Setter @Getter
@ToString @EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class Person {
    private long id;  // int(10)은 10자리수-> 99억까지 가능: long타입
    private String personName;
    private int personAge;


    public Person(ResultSet rs) throws SQLException {
        this.id = rs.getLong("id");
        this.personName = rs.getString("person_name");
        this.personAge = rs.getInt("person_age");
    }
}
