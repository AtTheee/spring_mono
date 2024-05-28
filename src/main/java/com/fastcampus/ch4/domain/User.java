package com.fastcampus.ch4.domain;

import java.util.Date;
import java.util.Objects;

public class User {
    private String id;
    private String pw;
    private String name;
    private int phone;
    private String email;
    private String roles;
    private Date reg_date;

    public User(){}

    public User(String id, String pw, String name, int phone, String email, String roles, Date reg_date) {
        this.id = id;
        this.pw = pw;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.roles = roles;
        this.reg_date = reg_date;
    }

//    public User(String id, String pw, String name, int phone, Date reg_date) {
//        this.id = id;
//        this.pw = pw;
//        this.name = name;
//        this.phone = phone;
//        this.reg_date = reg_date;
//    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", pw='" + pw + '\'' +
                ", name='" + name + '\'' +
                ", phone=" + phone +
                ", email='" + email + '\'' +
                ", roles='" + roles + '\'' +
                ", reg_date=" + reg_date +
                '}';
    }
}