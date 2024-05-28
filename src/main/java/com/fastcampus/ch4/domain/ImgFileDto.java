package com.fastcampus.ch4.domain;

public class ImgFileDto {
    private Integer fno;
    private Integer gno;
    private String save_folder;
    private String origin_name;
    private String save_name;

    public Integer getFno() {
        return fno;
    }

    public void setFno(Integer fno) {
        this.fno = fno;
    }

    public Integer getGno() {
        return gno;
    }

    public void setGno(Integer gno) {
        this.gno = gno;
    }

    public String getSave_folder() {
        return save_folder;
    }

    public void setSave_folder(String save_folder) {
        this.save_folder = save_folder;
    }

    public String getOrigin_name() {
        return origin_name;
    }

    public void setOrigin_name(String origin_name) {
        this.origin_name = origin_name;
    }

    public String getSave_name() {
        return save_name;
    }

    public void setSave_name(String save_name) {
        this.save_name = save_name;
    }

    @Override
    public String toString() {
        return "ImgFileDto{" +
                "fno=" + fno +
                ", gno=" + gno +
                ", save_folder='" + save_folder + '\'' +
                ", origin_name='" + origin_name + '\'' +
                ", save_name='" + save_name + '\'' +
                '}';
    }
}
