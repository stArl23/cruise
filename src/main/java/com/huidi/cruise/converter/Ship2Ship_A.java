package com.huidi.cruise.converter;

import com.huidi.cruise.algorithm.Ship;

import java.util.List;
import java.util.stream.Collectors;

public class Ship2Ship_A {

    public static Ship convert(com.huidi.cruise.domain.Ship ship){
        Ship ship1=new Ship(ship.getSNumber(),ship.getCapability());
        return ship1;
    }

    public static List<Ship> convert(List<com.huidi.cruise.domain.Ship> ships) {
        return ships.stream().map(e -> convert(e)).collect(Collectors.toList());
    }
}
