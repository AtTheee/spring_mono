package com.fastcampus.ch4.service;

import com.fastcampus.ch4.dao.UserDao;
import com.fastcampus.ch4.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    UserDao userDao;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public int login(String id, String pw) throws Exception {

        User user = null;
        user = userDao.selectUser(id);

        if(user == null){
            return 0;
        } else if(!passwordEncoder.matches(pw,user.getPw())){
            return 1;
        }
        return 2;
    }

    @Override
    public int join(User user) throws Exception {
        String encodePw = passwordEncoder.encode(user.getPw());
        user.setPw(encodePw);
        return userDao.insertUser(user);
    }

    @Override
    public int idCheck(String id) throws Exception {
        User user = userDao.selectUser(id);
        return (user == null) ? 0 : 1;
    }

    @Override
    public boolean pwCheck(String id, String pw) throws Exception {
        User user = userDao.selectUser(id);
        return passwordEncoder.matches(pw,user.getPw());
    }

    @Override
    public User getUser(String id) throws Exception {
        User user = userDao.selectUser(id);
        return user;
    }

    @Override
    public int modify(User user) throws Exception {
//        System.out.println(user);
        return userDao.updateUser(user);
    }

    @Override
    public int remove(String id) throws Exception {
        return userDao.deleteUser(id);
    }

    @Override
    public User findId(String name, String email) throws Exception {
        return userDao.findId(name, email);
    }
}
