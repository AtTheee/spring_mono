package com.fastcampus.ch4.dao;

import com.fastcampus.ch4.domain.ContactDto;
import com.fastcampus.ch4.domain.SearchCondition;

import java.util.List;

public interface ContactDao {
    int insert(ContactDto contactDto) throws Exception;

    List<ContactDto> selectAll() throws Exception;

    List<ContactDto> searchSelectList(SearchCondition sc) throws Exception;

    int totalCnt() throws Exception;

    int deleteAll() throws Exception;

    ContactDto select(Integer bno) throws Exception;

    int update(ContactDto contactDto) throws Exception;

    int delete(Integer bno) throws Exception;

    int updateCommentCnt(Integer bno, int cnt) throws Exception;

    int searchSelectCnt(SearchCondition sc) throws Exception;

    List<ContactDto> userSelectList(SearchCondition sc, String id) throws Exception;

    int userSelectCnt(SearchCondition sc, String id) throws Exception;
}
