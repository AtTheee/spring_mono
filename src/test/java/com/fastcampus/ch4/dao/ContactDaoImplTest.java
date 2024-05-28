package com.fastcampus.ch4.dao;

import com.fastcampus.ch4.domain.BoardDto;
import com.fastcampus.ch4.domain.ContactDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ContactDaoImplTest {

    @Autowired
    ContactDao contactDao;

    @Test
    public void insert() throws Exception{
        contactDao.deleteAll();
        for (int i = 1; i <= 25; i++) {
            ContactDto contactDto = new ContactDto("제목" + i, "contents","asdf","1년이내","30평대","서울");
            contactDao.insert(contactDto);
        }
    }
}