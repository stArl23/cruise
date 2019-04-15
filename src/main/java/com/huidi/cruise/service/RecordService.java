package com.huidi.cruise.service;


import com.huidi.cruise.domain.Record;
import com.huidi.cruise.dto.RecordDto;
import com.huidi.cruise.form.RecordRequestForm;

import javax.servlet.ServletOutputStream;
import java.util.List;

public interface RecordService {

    /***
     *  get record list after auto drainage
     * @param form the request form to create record list
     * @return
     */
    List<Record> drainage(RecordRequestForm form);


    /***
     * save records
     * @param records save all records
     */
    void saveRecord(List<Record> records);

    /***
     * list all records by date
     * @param date date of records
     * @return records list by the date
     */
    List<Record> listRecords(String date);

    /***
     * delete record
     * @param id delete record by id
     */
    void deleteRecord(String id);

    /**
     *
     */
    void getExcel(List<RecordDto> recordDtos, ServletOutputStream outputStream);
}
