package com.huidi.cruise.utils;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

public class MathUtils {

    public static String encode(String source) {
        StringBuffer sb = new StringBuffer(32);

        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] array = md.digest(source.getBytes(StandardCharsets.UTF_8));

            for (byte b : array) {
                sb.append(Integer.toHexString((b & 0xFF) | 0x100).toUpperCase(), 1, 3);
            }
        } catch (Exception e) {
            System.out.println("Can not encode the string '" + source + "' to MD5!");
            return null;
        }

        return sb.toString().toLowerCase();

    }
}
