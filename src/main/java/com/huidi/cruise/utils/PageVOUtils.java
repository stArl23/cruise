package com.huidi.cruise.utils;

import com.huidi.cruise.VO.PageVO;

import java.util.List;

public class PageVOUtils {
    public static PageVO page(Integer pageNum, Integer pageSize, List data) {
        return new PageVO(pageNum, pageSize, data);
    }

    public static PageVO page(List data) {
        return new PageVO(data);
    }
}
