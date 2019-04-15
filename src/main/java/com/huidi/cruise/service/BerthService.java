package com.huidi.cruise.service;


import com.huidi.cruise.domain.Berth;

import java.util.List;

public interface BerthService {

    List<Berth> listAllBerth();

    /***
     * 启用泊位
     * enable berth
     * @param id
     */
    void enableBerth(String id);

    /***
     * 停用泊位
     * disable berth
     * @param id
     */
    void disableBerth(String id);
}
