package com.huidi.cruise.controller;

import com.huidi.cruise.VO.RecordsVO;
import com.huidi.cruise.VO.ResultVO;
import com.huidi.cruise.constant.BerthConstant;
import com.huidi.cruise.constant.RecordConstant;
import com.huidi.cruise.converter.Record2RecordDto;
import com.huidi.cruise.domain.Record;
import com.huidi.cruise.dto.RecordDto;
import com.huidi.cruise.enums.CommonEnums;
import com.huidi.cruise.enums.RecordEnums;
import com.huidi.cruise.exception.CommonException;
import com.huidi.cruise.exception.RecordException;
import com.huidi.cruise.form.RecordRequestForm;
import com.huidi.cruise.service.RecordService;
import com.huidi.cruise.utils.CacheUtils;
import com.huidi.cruise.utils.PageVOUtils;
import com.huidi.cruise.utils.RecordsVOutils;
import com.huidi.cruise.utils.ResultVOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("/records")
public class RecordController {

    @Autowired
    private RecordService recordService;

/*    @Autowired
    private RedisTemplate redisTemplate;*/

    //create record list
    //return go island list default
    @PostMapping("/create")
    public ResultVO<RecordsVO> create(@Valid RecordRequestForm form, BindingResult bindingResult) {
        //校验
        if (bindingResult.hasErrors()) {
            throw new CommonException(CommonEnums.PARAM_INVALID.getId()
                    , bindingResult.getFieldError().getDefaultMessage());
        }


        ArrayList<Record> goIslandList = (ArrayList<Record>) CacheUtils.getObject(RecordConstant.GOISLANDRECORDS);
        ArrayList<Record> goBackList = (ArrayList<Record>) CacheUtils.getObject(RecordConstant.GOBACKRECORDS);

        //load data from cache
        List<Record> records = new ArrayList<>();
        ArrayList<ArrayList<Record>> recordsList = new ArrayList<>();
        if (Objects.isNull(goIslandList) || goIslandList.isEmpty() || Objects.isNull(goBackList) || goBackList.isEmpty()) {
            //load data from database
            records = recordService.listRecords(form.getDate());
            if (Objects.nonNull(records) && !records.isEmpty()) {
                for (Record record : records) {
                    if (record.getStartBerth() <= BerthConstant.DEVIDED) {
                        goIslandList.add(record);
                    } else {
                        goBackList.add(record);
                    }
                }

                goIslandList.sort((o1, o2) -> o1.getStartTime().after(o2.getStartTime()) ? 1 : -1);
                goBackList.sort((o1, o2) -> o1.getStartTime().after(o2.getStartTime()) ? 1 : -1);
                recordsList.add(0, goIslandList);
                recordsList.add(0, goBackList);
            }

        }




        //generate records
        if (Objects.isNull(records) || records.isEmpty()) {
            recordsList = recordService.drainage(form);
        } else {
            recordsList.add(0, new ArrayList<>());
            recordsList.add(1, new ArrayList<>());
            for (Record record : records) {
                if (record.getStartBerth() <= BerthConstant.DEVIDED) {
                    recordsList.get(0).add(record);
                } else {
                    recordsList.get(1).add(record);
                }
            }
        }
        CacheUtils.setObject(RecordConstant.GOISLANDRECORDS, recordsList.get(0));
        CacheUtils.setObject(RecordConstant.GOBACKRECORDS, recordsList.get(1));
        //default the first page
        return ResultVOUtils.success(RecordsVOutils.getRecordsVO(form, recordsList.get(0)));
    }


    @GetMapping("/list")
    public ResultVO<RecordDto> list(@RequestParam("date") String date, @RequestParam(value = "pageSize", defaultValue = "10", required = false) Integer pageSize, @RequestParam(name = "pageNum", defaultValue = "1", required = false) Integer pageNum, @RequestParam(name = "isBack", defaultValue = "0", required = false) Integer isBack) {
        List<Record> records;
        if (isBack == 1) {
            records = (List<Record>) CacheUtils.getObject(RecordConstant.GOBACKRECORDS);
        } else {
            records = (List<Record>) CacheUtils.getObject(RecordConstant.GOISLANDRECORDS);
        }

        //load data from database
        if (Objects.isNull(records) || records.isEmpty()) {
            records = recordService.listRecords(date);
            List<Record> tempList = new ArrayList<>();
            for (Record record : records) {
                if (isBack == 1 && record.getStartBerth() <= BerthConstant.DEVIDED) {
                    tempList.add(record);
                } else if (isBack == 0 && record.getStartBerth() > BerthConstant.DEVIDED) {
                    tempList.add(record);
                }
            }
            records = tempList;
            records.sort((o1, o2) -> o1.getStartTime().after(o2.getStartTime()) ? 1 : -1);
        }

        if (Objects.isNull(records) || records.isEmpty()) {
            throw new RecordException(RecordEnums.RECORD_NOT_CREATE.getId(), RecordEnums.RECORD_NOT_CREATE.getMessage());
        } else {
            if (isBack == 1) {
                CacheUtils.setObject(RecordConstant.GOBACKRECORDS, records);
            } else {
                CacheUtils.setObject(RecordConstant.GOISLANDRECORDS, records);
            }
        }

        return ResultVOUtils.success(PageVOUtils.page(pageNum, pageSize, Record2RecordDto.convert(records)));
    }


    @GetMapping("/delete")
    public ResultVO delete(@RequestParam("id") String id, @RequestParam(value = "isBack") Integer isBack) {
        //recordService.deleteRecord(id);
        List<Record> records = (List<Record>) (isBack == 1 ? CacheUtils.getObject(RecordConstant.GOBACKRECORDS) : CacheUtils.getObject(RecordConstant.GOISLANDRECORDS));
        if (Objects.isNull(records) || records.isEmpty()) {
            throw new RecordException(RecordEnums.RECORD_NOT_CREATE.getId(), RecordEnums.RECORD_NOT_CREATE.getMessage());
        }

        boolean flag = false;
        for (int i = 0; i < records.size(); i++) {
            if (id.equals(records.get(i).getId())) {
                flag = true;
                records.remove(i);
                break;
            }
        }

        if (flag) {
            recordService.deleteRecord(id);
            CacheUtils.setObject(isBack == 1 ? RecordConstant.GOBACKRECORDS : RecordConstant.GOISLANDRECORDS, records);
        } else {
            //缓存中不存在该记录
            throw new RecordException(RecordEnums.RECORD_NOT_EXIST.getId(), RecordEnums.RECORD_NOT_EXIST.getMessage());
        }
        return ResultVOUtils.success();
    }

    @GetMapping("/excel")
    public ResultVO excel(HttpServletResponse response) {
        //only when cache contains data can be used
        List<Record> goBackList = (List<Record>) CacheUtils.getObject(RecordConstant.GOBACKRECORDS);
        List<Record> goIslandList = (List<Record>) CacheUtils.getObject(RecordConstant.GOISLANDRECORDS);
        List<Record> records = new ArrayList<>();
        if (Objects.isNull(goIslandList) || goIslandList.isEmpty() || Objects.isNull(goBackList) || goBackList.isEmpty()) {
            throw new RecordException(RecordEnums.RECORD_NOT_CREATE.getId(), RecordEnums.RECORD_NOT_CREATE.getMessage());
        } else {
            records.addAll(goIslandList);
            records.addAll(goBackList);
        }

        response.setContentType("multipart/form-data");
        String fileName = new Date(System.currentTimeMillis()).toString() + ".xls";
        response.addHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
        try {
            recordService.getExcel(Record2RecordDto.convert(records), response.getOutputStream());
        } catch (IOException e) {
            throw new CommonException(CommonEnums.OBJECT_NULL.getId(), CommonEnums.OBJECT_NULL.getMessage());
        }
        return ResultVOUtils.success();
    }

    @GetMapping("/publish")
    public ResultVO publish(){

        List<Record> records = recordService.listRecords(new Date(System.currentTimeMillis()).toString());
        if (Objects.nonNull(records) && !records.isEmpty())
            throw new RecordException(RecordEnums.RECORD_ALREADY_PUBLISH.getId(), RecordEnums.RECORD_ALREADY_PUBLISH.getMessage());
        List<Record> goBackList = (List<Record>) CacheUtils.getObject(RecordConstant.GOBACKRECORDS);
        List<Record> goIslandList = (List<Record>) CacheUtils.getObject(RecordConstant.GOISLANDRECORDS);
        if (Objects.isNull(goIslandList) || goIslandList.isEmpty() || Objects.isNull(goBackList) || goBackList.isEmpty()) {
            throw new RecordException(RecordEnums.RECORD_NOT_CREATE.getId(),RecordEnums.RECORD_NOT_CREATE.getMessage());
        }else{
            records = new ArrayList<>();
            records.addAll(goIslandList);
            records.addAll(goBackList);
            recordService.saveRecord(records);
        }
        return ResultVOUtils.success();
    }
}
