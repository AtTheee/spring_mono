package com.fastcampus.ch4.domain;

import java.util.Date;
import java.util.Objects;

public class ContactDto {
    private Integer bno;
    private String title;
    private String contents;
    private String writer;
    private Date reg_date;
    private String construct_date;
    private String area;
    private String address;

    private int comment_cnt;

    public ContactDto(){}

    public ContactDto(String title, String contents, String writer, String construct_date, String area, String address) {
        this.title = title;
        this.contents = contents;
        this.writer = writer;
        this.construct_date = construct_date;
        this.area = area;
        this.address = address;
    }

    public ContactDto(Integer bno, String title, String contents, String writer, Date reg_date) {
        this.bno = bno;
        this.title = title;
        this.contents = contents;
        this.writer = writer;
        this.reg_date = reg_date;
    }

    public Integer getBno() {
        return bno;
    }

    public void setBno(Integer bno) {
        this.bno = bno;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    public String getConstruct_date() {
        return construct_date;
    }

    public void setConstruct_date(String construct_date) {
        this.construct_date = construct_date;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getComment_cnt() {
        return comment_cnt;
    }

    public void setComment_cnt(int comment_cnt) {
        this.comment_cnt = comment_cnt;
    }

    @Override
    public String toString() {
        return "ContactDto{" +
                "bno=" + bno +
                ", title='" + title + '\'' +
                ", contents='" + contents + '\'' +
                ", writer='" + writer + '\'' +
                ", reg_date=" + reg_date +
                ", construct_date='" + construct_date + '\'' +
                ", area='" + area + '\'' +
                ", address='" + address + '\'' +
                ", comment_cnt=" + comment_cnt +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ContactDto that = (ContactDto) o;
        return Objects.equals(bno, that.bno) && Objects.equals(title, that.title) && Objects.equals(contents, that.contents) && Objects.equals(writer, that.writer);
    }

    @Override
    public int hashCode() {
        return Objects.hash(bno, title, contents, writer);
    }
}
