package com.huidi.cruise.VO;

import lombok.Data;

import java.util.List;

@Data
public class PageVO<T> {
    Integer pageNum;
    Integer pageSize;
    Integer totalPage;
    Integer firstPage;
    Integer lastPage;
    List<T> data;

    public PageVO(List<T> data) {
        this.pageNum = 1;
        this.pageSize = 10;
        this.totalPage = data.size() % this.pageSize == 0 ? data.size() / this.pageSize : data.size() / this.pageSize + 1;
        this.firstPage = 1;
        this.lastPage = data.size() % this.pageSize == 0 ? data.size() / this.pageSize : data.size() / this.pageSize + 1;
        this.data = data.subList(0, 10 < data.size() ? 10 : data.size());
    }

    public PageVO(Integer pageNum, Integer pageSize, List<T> data) {
        this.pageNum = pageNum;
        this.pageSize = pageSize;
        this.totalPage = data.size() % this.pageSize == 0 ? data.size() / this.pageSize : data.size() / this.pageSize + 1;
        this.firstPage = 1;
        this.lastPage = data.size() % this.pageSize == 0 ? data.size() / this.pageSize : data.size() / this.pageSize + 1;
        this.data = data.subList((pageNum - 1) * pageSize, pageNum * pageSize <= data.size() ? pageNum * pageSize : data.size());
    }
}
