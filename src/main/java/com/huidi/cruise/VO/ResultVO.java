package com.huidi.cruise.VO;

import lombok.Data;

import java.io.Serializable;

/**
 * http请求返回的最外层对象
 * http request wrapped object
 * Created by 廖师兄
 * 2017-05-12 14:13
 */
@Data
public class ResultVO<T> implements Serializable {

    private static final long serialVersionUID = 3068837394742385883L;

    /**
     * 错误码.
     */
    //error code
    private Integer code;

    /**
     * 提示信息.
     */
    //message
    private String msg;

    /**
     * 具体内容.
     */
    //data provided
    private T data;
}
