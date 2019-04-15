package com.huidi.cruise.repository;

import com.huidi.cruise.domain.Berth;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BerthRepository extends JpaRepository<Berth, String> {

    //岛内可用港口数
    Long countBerthsBySNumberGreaterThanAndAndIsAvailable(Integer divide, Boolean isAvailable);

    //总共可用港口数
    Long countBerthsByIsAvailable(Boolean isAvailable);

    List<Berth> findBerthByIsAvailableTrue();
}
