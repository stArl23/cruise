package com.huidi.cruise.utils;

import com.huidi.cruise.utils.interfaces.Excelable;
import org.apache.commons.lang3.reflect.MethodUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;


import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.sql.Date;
import java.util.List;
import java.util.stream.Collectors;

public class ExcelUtils {
    public static HSSFWorkbook generateHSSFWorkbook(List<Excelable> excelables, String title) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        //TODO
        //改为抛出异常交给service层处理
        if (excelables.size() < 1)
            throw new RuntimeException("excel表格为空");
        Field[] fields = (excelables.get(0)).getClass().getDeclaredFields();
        int columns = fields.length;

        HSSFWorkbook hssfWorkbook = new HSSFWorkbook();
        //生成行首
        HSSFSheet sheet = hssfWorkbook.createSheet(title);
        HSSFRow firstrow = sheet.createRow(0); // 下标为0的行开始
        List<String> names = Arrays.stream(fields)
                .map(e -> e.getName())
                .collect(Collectors.toList());
        int index = 0;
        for (String name : names) {
            HSSFCell hssfcell = firstrow.createCell(index++);
            hssfcell.setCellValue(name);
        }

        //给每一行拷贝属性
        int length = 1;
        for (Excelable ex : excelables) {
            HSSFRow row = sheet.createRow(length++);
            int i = 0;
            for (Field field : fields) {
                //TODO
                String type = field.getGenericType().toString();
                String name = field.getName();
                HSSFCell cell = row.createCell(i++);
                try {
                    //得到基础类型的值
                    if (type.contains("int")||type.contains(Integer.class.getName())) {
                        int temp = (Integer) excuteMethod(ex, name);
                        cell.setCellValue(temp);
                    }
                    //得到对象包括String
                    else if (type.contains(String.class.getName())) {
                        cell.setCellValue((String) excuteMethod(ex, name));
                    } else if (type.contains(Date.class.getName())) {
                        Date temp = (Date) excuteMethod(ex, name);
                        if (temp != null)
                            cell.setCellValue(sdf.format(temp));
                    }else if(type.contains(Time.class.getName())){
                        Time temp=(Time) excuteMethod(ex,name);
                        if(temp!=null)
                            cell.setCellValue(temp.toString());
                    }
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (NoSuchMethodException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                }

               /*MethodUtils.invokeExactMethod(excelables,"get"+name.substring(0,1).toUpperCase()+name.substring(1));*/
            }
        }

        //末尾行处理
        HSSFRow rowStatistics = sheet.createRow(length + 2);
        HSSFCell celStatistics = rowStatistics.createCell(0);
        celStatistics.setCellValue("统计结果:");
        // rowStatistics = sheet.createRow(i + 3);
        celStatistics = rowStatistics.createCell(2);
        celStatistics.setCellValue("共" + length + "条记录");

        return hssfWorkbook;
    }


    private static Object excuteMethod(Excelable excelable,String name) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException {
        return MethodUtils.invokeExactMethod(excelable,"get"+name.substring(0,1).toUpperCase()+name.substring(1));
    }
}
