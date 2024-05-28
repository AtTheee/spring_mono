package com.fastcampus.ch4.dao;

import com.fastcampus.ch4.domain.ContactDto;
import com.fastcampus.ch4.domain.SearchCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ContactDaoImpl implements ContactDao {

    @Autowired
    private SqlSession session;

    private String namespace = "com.fastcampus.ch4.dao.ContactMapper."; // SQL문을 식별하기 위함

    @Override
    public int insert(ContactDto contactDto) throws Exception {
        return session.insert(namespace + "insert", contactDto);
    }

    @Override
    public List<ContactDto> selectAll() throws Exception {
        return session.selectList(namespace + "selectAll");
    }

    @Override
    public List<ContactDto> searchSelectList(SearchCondition sc) throws Exception {
        return session.selectList(namespace + "searchSelectList", sc);
    }

    @Override
    public int totalCnt() throws Exception {
        return session.selectOne(namespace + "count");
    }

    @Override
    public int deleteAll() throws Exception {
        return session.delete(namespace + "deleteAll");
    }

    @Override
    public ContactDto select(Integer bno) throws Exception {
        return session.selectOne(namespace + "select" , bno);
    }

    @Override
    public int update(ContactDto contactDto) throws Exception {
        return session.update(namespace + "update", contactDto);
    }

    @Override
    public int delete(Integer bno) throws Exception {
        return session.delete(namespace + "delete", bno);
    }

    @Override
    public int updateCommentCnt(Integer bno, int cnt) throws Exception {
        Map map = new HashMap();
        map.put("cnt", cnt);
        map.put("bno", bno);
        return session.update(namespace + "updateCommentCnt", map);
    }

    @Override
    public int searchSelectCnt(SearchCondition sc) throws Exception {
        return session.selectOne(namespace + "searchSelectCnt", sc);
    }

    @Override
    public List<ContactDto> userSelectList(SearchCondition sc, String id) throws Exception {
        Map map = new HashMap();
        map.put("sc", sc);
        map.put("id", id);
        return session.selectList(namespace+ "userSelectList", map);
    }

    @Override
    public int userSelectCnt(SearchCondition sc, String id) throws Exception {
        Map map = new HashMap();
        map.put("sc", sc);
        map.put("id", id);
        return session.selectOne(namespace + "userSelectCnt", map);
    }
}
