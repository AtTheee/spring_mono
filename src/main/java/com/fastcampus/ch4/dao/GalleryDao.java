package com.fastcampus.ch4.dao;

import com.fastcampus.ch4.domain.GalleryDto;
import com.fastcampus.ch4.domain.ImgFileDto;
import com.fastcampus.ch4.domain.SearchCondition;

import java.util.List;

public interface GalleryDao {
    int insert(GalleryDto galleryDto) throws Exception;

    int fileInsert(GalleryDto galleryDto) throws Exception;

    List<ImgFileDto> searchSelectList(SearchCondition sc) throws Exception;

    int totalCnt() throws Exception;

    GalleryDto select(Integer gno) throws Exception;

    List<ImgFileDto> selectFile(Integer gno) throws Exception;

    int deleteExistFile(List<ImgFileDto> imgFileDtos) throws Exception;

    int update(GalleryDto galleryDto) throws Exception;

    int delete(Integer gno) throws Exception;
    int deleteFile(Integer gno) throws Exception;

    List<String> searchSelectTitleList(SearchCondition sc) throws Exception;
}
