package com.huidi.cruise.VO;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

//empty or null field are not presented
@Data
@JsonInclude(JsonInclude.Include.NON_EMPTY)
public class PageVO<T> implements Serializable {
    private static final long serialVersionUID = 3068637394742385883L;
    private int pageNum;
    private int pageSize;
    private int totalPage;
    private int firstPage;
    private int lastPage;
    private List<T> data;

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
