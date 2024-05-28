package com.fastcampus.ch4.dao;

import com.fastcampus.ch4.domain.GalleryDto;
import com.fastcampus.ch4.domain.ImgFileDto;
import com.fastcampus.ch4.domain.SearchCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class GalleryDaoImpl implements GalleryDao {

    @Autowired
    private SqlSession session;

    private String namespace = "com.fastcampus.ch4.dao.GalleryMapper."; // SQL문을 식별하기 위함

    @Override
    public int insert(GalleryDto galleryDto) throws Exception {
        return session.insert(namespace + "insert", galleryDto);
    }

    @Override
    public int fileInsert(GalleryDto galleryDto) throws Exception {
        return session.insert(namespace + "fileInsert", galleryDto);
    }

    @Override
    public List<ImgFileDto> searchSelectList(SearchCondition sc) throws Exception {
        return session.selectList(namespace + "searchSelectList", sc);
    }

    @Override
    public int totalCnt() throws Exception {
        return session.selectOne(namespace + "totalCnt");
    }

    @Override
    public GalleryDto select(Integer gno) throws Exception {
        return session.selectOne(namespace + "select", gno);
    }

    @Override
    public List<ImgFileDto> selectFile(Integer gno) throws Exception {
        return session.selectList(namespace+"selectFile", gno);
    }

    @Override
    public int deleteExistFile(List<ImgFileDto> imgFileDtos) throws Exception {
        return session.delete(namespace + "deleteExistFile", imgFileDtos);
    }

    @Override
    public int update(GalleryDto galleryDto) throws Exception {
        return session.update(namespace + "update", galleryDto);
    }

    @Override
    public int delete(Integer gno) throws Exception {
        return session.delete(namespace + "delete", gno);
    }

    @Override
    public int deleteFile(Integer gno) throws Exception {
        return session.delete(namespace + "deleteFile", gno);
    }

    @Override
    public List<String> searchSelectTitleList(SearchCondition sc) throws Exception {
        return session.selectList(namespace + "searchSelectTitleList", sc);
    }
}
