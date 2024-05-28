package com.fastcampus.ch4.dao;

import com.fastcampus.ch4.domain.CommentDto;

import java.util.List;

public interface CommentDao {
    int count(Integer bno) throws Exception;

    int deleteAll(Integer bno);

    int delete(Integer cno, String commenter) throws Exception;
    
    int deletePcno(Integer cno) throws Exception; // 이미 삭제한 답글이 있었던 부모 댓글이 답글도 다 삭제돼서 삭제될때

    int insert(CommentDto dto) throws Exception;

    List<CommentDto> selectAll(Integer bno) throws Exception;

    CommentDto select(Integer cno) throws Exception;

    int update(CommentDto dto) throws Exception;

    int countByPcno(Integer cno) throws Exception;

}
