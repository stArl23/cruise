package com.huidi.cruise.repository;

import com.huidi.cruise.domain.Ship;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ShipRepository extends JpaRepository<Ship, String> {
    Ship getBySNumber(String sNumber);

    List<Ship> findShipsByIsAvailableIsTrue();
}
