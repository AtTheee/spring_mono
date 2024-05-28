package com.fastcampus.ch4.domain;

import org.springframework.web.util.UriComponentsBuilder;

public class SearchCondition {
    private Integer page = 1;
    private Integer pageSize = 10;
//    private Integer offset = 0;
    private String keyword = ""; // 검색 키워드
    private String option = ""; // 검색 옵션
    private String type = ""; // 게시물 유형
    private String userId;

    @Override
    public String toString() {
        return "SearchCondition{" +
                "page=" + page +
                ", pageSize=" + pageSize +
                ", offset=" + getOffset() +
                ", keyword='" + keyword + '\'' +
                ", option='" + option + '\'' +
                ", type='" + type + '\'' +
                '}';
    }

    // @ModelAttribute로 사용되는 객체가 요청 매개변수에서 받은 값들로 자동으로 채워지려면, 빈 생성자가 필요하다. ( + 정확한 getter, setter도 필요)
    public SearchCondition() {

    }

    public SearchCondition(Integer page, Integer pageSize, String keyword, String option) {
        this.page = page;
        this.pageSize = pageSize;
        this.keyword = keyword;
        this.option = option;
        this.type = type;
    }

    public String getQueryString(Integer page) {
//        URL 생성 시 queryString을 포함한 URL 생성
        return UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("pageSize", pageSize)
                .queryParam("option", option)
                .queryParam("keyword", keyword)
                .queryParam("type", type)
                .build().toString();
    }

    public String getQueryString() {
        //?page=1&pageSize=10&option=T&keyword="title"
        return getQueryString(page);
    }


    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getOffset() {
        return (page-1)*pageSize;
    } // 2번쨰 페이지 offset은 10이어야함(10개 건너뛰고 11번째부터 나오게)

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
