package com.fastcampus.ch4.service;

import com.fastcampus.ch4.domain.ContactDto;
import com.fastcampus.ch4.domain.SearchCondition;

import java.util.List;

public interface ContactService {
    int write(ContactDto contactDto) throws Exception;

    List<ContactDto> getList() throws Exception;

    List<ContactDto> searchSelectList(SearchCondition sc) throws Exception;

    int totalCnt() throws Exception;

    ContactDto read(Integer bno) throws Exception;

    int modify(ContactDto contactDto) throws Exception;

    int remove(Integer bno) throws Exception;

    int searchSelectCnt(SearchCondition sc) throws Exception;

    List<ContactDto> userSelectList(SearchCondition sc, String id) throws Exception;

    int userSelectCnt(SearchCondition sc, String id) throws Exception;


}
