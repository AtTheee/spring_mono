package com.fastcampus.ch4.domain;

import java.util.List;

public class GalleryDto {
    private Integer gno;
    private String title;
    private String sub_title;
    private String explanation;
    private String location;
    private String type;
    private String area;
    private String year;
    private List<ImgFileDto> imgFileDtos;

    public Integer getGno() {
        return gno;
    }

    public void setGno(Integer gno) {
        this.gno = gno;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSub_title() {
        return sub_title;
    }

    public void setSub_title(String sub_title) {
        this.sub_title = sub_title;
    }

    public String getExplanation() {
        return explanation;
    }

    public void setExplanation(String explanation) {
        this.explanation = explanation;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public List<ImgFileDto> getImgFileDtos() {
        return imgFileDtos;
    }

    public void setImgFileDtos(List<ImgFileDto> imgFileDtos) {
        this.imgFileDtos = imgFileDtos;
    }

    @Override
    public String toString() {
        return "GalleryDto{" +
                "gno=" + gno +
                ", title='" + title + '\'' +
                ", sub_title='" + sub_title + '\'' +
                ", explanation='" + explanation + '\'' +
                ", location='" + location + '\'' +
                ", type='" + type + '\'' +
                ", area='" + area + '\'' +
                ", year='" + year + '\'' +
                ", imgFileDtos=" + imgFileDtos +
                '}';
    }
}
