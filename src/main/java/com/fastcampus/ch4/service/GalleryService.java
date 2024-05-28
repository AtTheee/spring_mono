package com.fastcampus.ch4.service;

import com.fastcampus.ch4.domain.GalleryDto;
import com.fastcampus.ch4.domain.ImgFileDto;
import com.fastcampus.ch4.domain.SearchCondition;

import java.util.List;

public interface GalleryService {
    int write(GalleryDto galleryDto) throws Exception;

    List<ImgFileDto> searchSelectList(SearchCondition sc) throws Exception;

    int totalCnt() throws Exception;

    GalleryDto read(Integer gno) throws Exception;

    List<ImgFileDto> readFile(Integer gno) throws Exception;

    int deleteExistFile(List<ImgFileDto> imgFileDtos) throws Exception;

    int modify(GalleryDto galleryDto) throws Exception;

    int delete(Integer gno) throws Exception;

    List<String> searchSelectTitleList(SearchCondition sc) throws Exception;
}
