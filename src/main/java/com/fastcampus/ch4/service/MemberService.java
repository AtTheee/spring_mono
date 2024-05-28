package com.fastcampus.ch4.service;

import com.fastcampus.ch4.domain.User;

public interface MemberService {
    int login(String id, String pw) throws Exception;
    int join(User user) throws Exception;
    int idCheck(String id) throws Exception;
    boolean pwCheck(String id, String pw) throws Exception;
    User getUser(String id) throws Exception;
    int modify(User user) throws Exception;
    int remove(String id) throws Exception;
    User findId(String name, String email) throws Exception;

}
