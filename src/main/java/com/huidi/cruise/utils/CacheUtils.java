package com.huidi.cruise.utils;

import java.util.HashMap;

public class CacheUtils {
    private static final HashMap<String,Object> cacheMap=new HashMap<>();


    public static void setObject(String key,Object object){
        cacheMap.put(key,object);
    }

    public static Object getObject(String key){
        return cacheMap.get(key);
    }
}
