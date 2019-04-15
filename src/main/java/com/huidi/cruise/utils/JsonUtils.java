package com.huidi.cruise.utils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Created by 廖师兄
 * 2017-07-04 01:30
 */
public class JsonUtils {

    public static String toJson(Object object) {
        GsonBuilder gsonBuilder = new GsonBuilder();
        gsonBuilder.setPrettyPrinting();
        Gson gson = gsonBuilder.create();
        return gson.toJson(object);
    }
}
