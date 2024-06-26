package com.fastcampus.ch4.service;

import com.fastcampus.ch4.dao.*;
import com.fastcampus.ch4.domain.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import java.util.*;

@Service
public class BoardServiceImpl implements BoardService {
//    @Autowired
//    BoardDao boardDao;

    private final BoardDao boardDao;
    public BoardServiceImpl(BoardDao boardDao){
        this.boardDao = boardDao;
    }

    @Override
    public List<BoardDto> getSearchResultPage(SearchCondition sc) throws Exception {
        return boardDao.searchSelectPage(sc);
    }

    @Override
    public int getSearchResultCnt(SearchCondition sc) throws Exception {
        return boardDao.searchResultCnt(sc);
    }

    @Override
    public int getCount() throws Exception {
        return boardDao.count();
    }

    @Override
    public int remove(Integer bno, String writer) throws Exception {
        return boardDao.delete(bno, writer);
    }

    @Override
    public int write(BoardDto boardDto) throws Exception {
        return boardDao.insert(boardDto);
//        throw new Exception("test"); // 게시물 등록 실패했을경우 테스트
    }

    @Override
    public List<BoardDto> getList() throws Exception {
        return boardDao.selectAll();
    }

    @Override
    public BoardDto read(Integer bno) throws Exception {
        BoardDto boardDto = boardDao.select(bno); // bno에 맞는 게시글을 찾아옴
        boardDao.increaseViewCnt(bno);

        return boardDto;
    }

    @Override
    public int modify(BoardDto boardDto) throws Exception {
        return boardDao.update(boardDto);
    }

    @Override
    public List<BoardDto> getPage(Map map) throws Exception {
        return boardDao.selectPage(map);
    }


}