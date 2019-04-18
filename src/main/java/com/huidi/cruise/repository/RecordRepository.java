package com.huidi.cruise.repository;

import com.huidi.cruise.domain.Record;
import org.springframework.data.jpa.repository.JpaRepository;

import java.sql.Date;
import java.util.List;

public interface RecordRepository extends JpaRepository<Record, String> {
    List<Record> findAllByDate(Date date);

    Integer countRecordsByDateBetween(Date start, Date after);
}
