package com.blog.entity;


import org.springframework.stereotype.Component;


@Component
public class PageBean {
    /*当前页*/
    private int page;
    /*总记录数*/
    private int totalRecord;
    /*每页记录数*/
    private int pageSize;
    /*总页数*/
    private int totalPage;

    public PageBean(){}

    public PageBean(int page, int totalRecord, int pageSize) {
        this.page = page;
        this.totalRecord = totalRecord;
        this.pageSize = pageSize;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "page=" + page +
                ", totalRecord=" + totalRecord +
                ", pageSize=" + pageSize +
                ", totalPage=" + totalPage +
                '}';
    }
}
