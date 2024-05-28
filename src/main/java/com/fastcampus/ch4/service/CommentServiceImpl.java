package com.fastcampus.ch4.service;

import com.fastcampus.ch4.dao.*;
import com.fastcampus.ch4.domain.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import java.util.*;

@Service
public class CommentServiceImpl implements CommentService {
//    @Autowired // 필드 주입으로 하면 @Repository를 까먹고 안붙여도 티가 안남
    ContactDao contactDao;
//    @Autowired
    CommentDao commentDao;

//    @Autowired // 하지만 생성자 주입으로 해놓으면 없다는걸 컴파일 할 때 알 수 있음
    public CommentServiceImpl(CommentDao commentDao, ContactDao contactDao) {
        this.commentDao = commentDao;
        this.contactDao = contactDao;
    }

    @Override
    public int getCount(Integer bno) throws Exception {
        return commentDao.count(bno);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int remove(Integer cno, Integer bno, String commenter) throws Exception {
        contactDao.updateCommentCnt(bno, -1);
//        System.out.println("updateCommentCnt - rowCnt = " + rowCnt);
//        throw new Exception("test");
//        commentDao.delete(cno, commenter);
//        System.out.println("rowCnt = " + rowCnt);
        return commentDao.delete(cno, commenter);
    }

    @Override
    public int removePcno(Integer cno, Integer bno) throws Exception {
        contactDao.updateCommentCnt(bno, -1);
        return commentDao.deletePcno(cno);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int write(CommentDto commentDto) throws Exception {
        contactDao.updateCommentCnt(commentDto.getBno(), 1);
//                throw new Exception("test"); // 일부러 예외 발생시키기 update 성공했는데 insert 실패했으니 rollback돼서 cnt가 0이 됨
        return commentDao.insert(commentDto);
    }

    @Override
    public List<CommentDto> getList(Integer bno) throws Exception {
//        throw new Exception("test");
        return commentDao.selectAll(bno);
    }

    @Override
    public CommentDto read(Integer cno) throws Exception {
        return commentDao.select(cno);
    }

    @Override
    public int modify(CommentDto commentDto) throws Exception {
        return commentDao.update(commentDto);
    }

    @Override
    public int countByPcno(Integer cno) throws Exception {
        return commentDao.countByPcno(cno);
    }
}