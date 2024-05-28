package com.fastcampus.ch4.service;

import com.fastcampus.ch4.dao.GalleryDao;
import com.fastcampus.ch4.domain.GalleryDto;
import com.fastcampus.ch4.domain.ImgFileDto;
import com.fastcampus.ch4.domain.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.List;

@Service
public class GalleryServiceImpl implements GalleryService {

    @Autowired
    GalleryDao galleryDao;

    @Override
    public int write(GalleryDto galleryDto) throws Exception {
        int result = galleryDao.insert(galleryDto);
        galleryDao.fileInsert(galleryDto);

        return result;
    }

    @Override
    public List<ImgFileDto> searchSelectList(SearchCondition sc) throws Exception {
        return galleryDao.searchSelectList(sc);
    }

    @Override
    public int totalCnt() throws Exception {
        return galleryDao.totalCnt();
    }

    @Override
    public GalleryDto read(Integer gno) throws Exception {
        return galleryDao.select(gno);
    }

    @Override
    public List<ImgFileDto> readFile(Integer gno) throws Exception {
        return galleryDao.selectFile(gno);
    }

    @Override
    public int deleteExistFile(List<ImgFileDto> imgFileDtos) throws Exception {

        for(ImgFileDto file : imgFileDtos){
            String filePath = "D:/Gallery/" + file.getSave_folder() + "/" + file.getSave_name();
            File f = new File(filePath);
            if(f.exists()) f.delete();
        }

        return galleryDao.deleteExistFile(imgFileDtos);
    }

    @Override
    public int modify(GalleryDto galleryDto) throws Exception {
        int result = galleryDao.update(galleryDto);

        // 추가해야될게 있을떄만 insert
        if(!galleryDto.getImgFileDtos().isEmpty())
            galleryDao.fileInsert(galleryDto);

        return result;
    }

    @Override
    public int delete(Integer gno) throws Exception {
        // 실제 폴더에서 파일 삭제
        List<ImgFileDto> fileList = galleryDao.selectFile(gno);

        for(ImgFileDto file : fileList){
            String filePath = "D:/Gallery/" + file.getSave_folder() + "/" + file.getSave_name();
            File f = new File(filePath);
            if(f.exists()) f.delete();
        }

        int result = galleryDao.delete(gno);
        galleryDao.deleteFile(gno);
        return result;
    }

    @Override
    public List<String> searchSelectTitleList(SearchCondition sc) throws Exception {
        return galleryDao.searchSelectTitleList(sc);
    }
}
