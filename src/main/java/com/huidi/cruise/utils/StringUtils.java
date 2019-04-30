package com.huidi.cruise.utils;

import com.huidi.cruise.constant.BerthConstant;
import com.huidi.cruise.constant.ShipConstant;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class StringUtils extends org.springframework.util.StringUtils {
    private static final String SPLIT = "&";

    /**
     * convert questions id list to string to store in database
     * for example
     * {a,b,c,d} .... a list to a&b&c&.....
     *
     * @param questions
     * @return
     */
    public static String list2String(List<String> questions) {
        return getString(questions);
    }

    /***
     * convert questions id string to list
     * @param questions
     * @return
     */
    public static List<String> string2List(String questions) {
        List<String> configList = new ArrayList<>();
        if (!StringUtils.isEmpty(questions)) {
            configList = Arrays.asList(questions.split(SPLIT));
        }
        return configList;
    }

    /**
     * 添加一个item
     *
     * @param ids
     * @param id
     * @return
     */
    public static String appendItem(String ids, String id) {
        if (ids == null ||
                StringUtils.isEmpty(id) ||
                ids.contains(id))
            return ids;
        if (ids.contains(id)) {
            return ids;
        }
        //ids为""
        if ("".equals(ids))
            ids = id;
        else if (ids.length() > 0) {
            ids = ids.concat(SPLIT + id);
        }
        return ids;
    }

    /**
     * 删除一个item
     *
     * @param ids
     * @param id
     * @return
     */
    public static String deleteItem(String ids, String id) {
        if (StringUtils.isEmpty(ids) ||
                StringUtils.isEmpty(id) ||
                !ids.contains(id))
            return ids;
        int index = ids.indexOf(id);

        if (ids.length() == 1)
            ids = "";
        else if (id.equals(ids.charAt(0) + ""))
            ids = ids.replace(id + SPLIT, "");
        else if ((SPLIT + id).equals(SPLIT + ids.charAt(index)))
            ids = ids.replace(SPLIT + id, "");
        else
            ids = ids.replace(id, "");
        return ids;
    }

    /**
     * 生成items id列表
     *
     * @param ids
     * @return
     */
    public static String items(String... ids) {
        StringBuilder sb = new StringBuilder();
        for (String s : ids)
            sb.append(s).append(SPLIT);
        return sb.substring(0, sb.length() - 1);
    }

    public static String items(List<String> ids) {
        return getString(ids);
    }

    public static String getString(List<String> ids) {
        StringBuilder sb = new StringBuilder();
        for (String s : ids)
            sb.append(s).append(SPLIT);
        return sb.substring(0, sb.length() - 1);
    }


    public static String getShipName(Integer sNumber) {
        String name = "";
        if (sNumber >= ShipConstant.DEVIDED) {
            name = ShipConstant.BIGSHIP + (sNumber - ShipConstant.DEVIDED);
        } else {
            name = ShipConstant.SMALLSHIP + sNumber;
        }
        return name;
    }


    public static int getShipId(String name) {
        int result = 0;
        if (ShipConstant.BIGSHIP.equals(name.substring(0, 1))) {
            result = Integer.parseInt(name.substring(1));
        } else {
            result = Integer.parseInt(name.substring(1)) + ShipConstant.DEVIDED;
        }
        return result;
    }

    public static String getBerthName(Integer sNumber) {
        String name = "";
        if (sNumber > BerthConstant.DEVIDED) {
            name = BerthConstant.INISLAND + (sNumber - BerthConstant.DEVIDED)
                    + BerthConstant.SUFFIX;
        } else {
            name = BerthConstant.OFFISLAND + sNumber
                    + BerthConstant.SUFFIX;
        }
        return name;
    }


    public static Integer getBerthId(String name){
        String constant=name.substring(0,2);
        String num=name.substring(2,3);
        if(constant.equals(BerthConstant.INISLAND )){
            return BerthConstant.DEVIDED+Integer.parseInt(num);
        }else{
            return Integer.parseInt(num);
        }
    }
}
