package com.huidi.cruise.converter;

import com.huidi.cruise.algorithm.Berth;

import java.util.List;
import java.util.stream.Collectors;

public class Berth2Berth_A {
    public static Berth convert(com.huidi.cruise.domain.Berth berth){
        Berth berth1=new Berth(berth.getSNumber()+"",true,null,null);
        return berth1;
    }

    public static List<Berth> convert(List<com.huidi.cruise.domain.Berth> berths) {
        return berths.stream().map(e -> convert(e)).collect(Collectors.toList());
    }
}
