package com.fastcampus.ch4.service;

import com.fastcampus.ch4.dao.ContactDao;
import com.fastcampus.ch4.domain.ContactDto;
import com.fastcampus.ch4.domain.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContactServiceImpl implements ContactService {

//    @Autowired
//    ContactDao contactDao;

    private final ContactDao contactDao;
    public ContactServiceImpl(ContactDao contactDao){
        this.contactDao = contactDao;
    }

    @Override
    public int write(ContactDto contactDto) throws Exception {
        return contactDao.insert(contactDto);
    }

    @Override
    public List<ContactDto> getList() throws Exception {
        return contactDao.selectAll();
    }

    @Override
    public List<ContactDto> searchSelectList(SearchCondition sc) throws Exception {
        return contactDao.searchSelectList(sc);
    }

    @Override
    public int totalCnt() throws Exception {
        return contactDao.totalCnt();
    }

    @Override
    public ContactDto read(Integer bno) throws Exception {
        return contactDao.select(bno);
    }

    @Override
    public int modify(ContactDto contactDto) throws Exception {
        return contactDao.update(contactDto);
    }

    @Override
    public int remove(Integer bno) throws Exception {
        return contactDao.delete(bno);
    }

    @Override
    public int searchSelectCnt(SearchCondition sc) throws Exception {
        return contactDao.searchSelectCnt(sc);
    }

    @Override
    public List<ContactDto> userSelectList(SearchCondition sc, String id) throws Exception {
        return contactDao.userSelectList(sc, id);
    }

    @Override
    public int userSelectCnt(SearchCondition sc, String id) throws Exception {
        return contactDao.userSelectCnt(sc, id);
    }
}
