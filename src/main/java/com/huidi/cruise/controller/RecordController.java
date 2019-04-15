package com.huidi.cruise.controller;

import com.huidi.cruise.VO.RecordsVO;
import com.huidi.cruise.VO.ResultVO;
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
import com.huidi.cruise.utils.RecordsVOutil;
import com.huidi.cruise.utils.ResultVOUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("/records")
@Api(value = "RecordController", description = "the api of records")
public class RecordController {

    @Autowired
    private RecordService recordService;

/*    @Autowired
    private RedisTemplate redisTemplate;*/

    //create record list
    @PostMapping("/create")
    public ResultVO<RecordsVO> create(@Valid RecordRequestForm form, BindingResult bindingResult) {
        //校验
        if (bindingResult.hasErrors()) {
            throw new CommonException(CommonEnums.PARAM_INVALID.getId()
                    , bindingResult.getFieldError().getDefaultMessage());
        }


        List<Record> records = (List<Record>) CacheUtils.getObject(RecordConstant.RECORDS);
        //load data from cache
        if (Objects.isNull(records) || records.isEmpty()) {
            records = recordService.listRecords(new Date(System.currentTimeMillis()).toString());
        }

        //load data from database
        if (Objects.isNull(records) || records.isEmpty()) {
            records = recordService.listRecords(new Date(System.currentTimeMillis()).toString());
        }
        //generate records
        if (Objects.isNull(records) || records.isEmpty()) {
            records = recordService.drainage(form);
        }
        CacheUtils.setObject(RecordConstant.RECORDS, records);
        //default the first page
        return ResultVOUtil.success(RecordsVOutil.getRecordsVO(form, records.subList(0,10<records.size()?10:records.size())));
    }


    @GetMapping("/list")
    @ApiOperation(value = "list records by date", notes = "list records by date", httpMethod = "GET", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", dataType = "String", name = "date", value = "date", required = true),
    })
    public ResultVO<RecordDto> list(@RequestParam("date") String date,@RequestParam(value = "pageSize",defaultValue = "10")Integer pageSize,@RequestParam(name="pageNum",defaultValue="1")Integer pageNum) {

        List<Record> records = (List<Record>) CacheUtils.getObject(RecordConstant.RECORDS);
        if (Objects.isNull(records) || records.isEmpty()) {
            records = recordService.listRecords(date);
        }
        //load data from database
        if (Objects.isNull(records) || records.isEmpty()) {
            throw new RecordException(RecordEnums.RECORD_NOT_CREATE.getId(), RecordEnums.RECORD_NOT_CREATE.getMessage());
        } else {
            CacheUtils.setObject(RecordConstant.RECORDS, records);
        }

        records=records.subList((pageNum-1)*pageSize,pageNum*pageSize<=records.size()?pageNum*pageSize:records.size());
        return ResultVOUtil.success(Record2RecordDto.convert(records));
    }


    @GetMapping("/delete")
    @ApiOperation(value = "list records by id", notes = "list records by id", httpMethod = "GET", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", dataType = "String", name = "id", value = "id", required = true),
    })
    public ResultVO delete(@RequestParam("id") String id) {
        //recordService.deleteRecord(id);
        List<Record> records = (List<Record>) CacheUtils.getObject(RecordConstant.RECORDS);
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
            CacheUtils.setObject(RecordConstant.RECORDS, records);
        } else {
            //缓存中不存在该记录
            throw new RecordException(RecordEnums.RECORD_NOT_EXIST.getId(), RecordEnums.RECORD_NOT_EXIST.getMessage());
        }
        return ResultVOUtil.success();
    }

    @GetMapping("/excel")
    public ResultVO excel(HttpServletResponse response) {
        //only when cache contains data can be used
        List<Record> records = (List<Record>) CacheUtils.getObject(RecordConstant.RECORDS);
        if (Objects.isNull(records) || records.isEmpty()) {
            throw new RecordException(RecordEnums.RECORD_NOT_CREATE.getId(), RecordEnums.RECORD_NOT_CREATE.getMessage());
        }

        response.setContentType("multipart/form-data");
        String fileName = new Date(System.currentTimeMillis()).toString() + ".xls";
        response.addHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
        try {
            recordService.getExcel(Record2RecordDto.convert(records), response.getOutputStream());
        } catch (IOException e) {
            throw new CommonException(CommonEnums.OBJECT_NULL.getId(), CommonEnums.OBJECT_NULL.getMessage());
        }
        return ResultVOUtil.success();
    }

    @GetMapping("/publish")
    public ResultVO publish(){
        List<Record> records= (List<Record>) CacheUtils.getObject(RecordConstant.RECORDS);
        if(Objects.isNull(records)||records.isEmpty()){
            throw new RecordException(RecordEnums.RECORD_NOT_CREATE.getId(),RecordEnums.RECORD_NOT_CREATE.getMessage());
        }else{
            recordService.saveRecord(records);
        }
        return ResultVOUtil.success();
    }
}
