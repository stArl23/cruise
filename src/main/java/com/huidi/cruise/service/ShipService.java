package com.huidi.cruise.service;

import com.huidi.cruise.domain.Ship;

import java.util.List;

public interface ShipService {
    /***
     * add new ship
     * @param ship ship object with information
     */
    void addShip(Ship ship);

    /***
     * enable ship
     * @param id
     */
    void enableShip(String id);

    /***
     * disable ship
     * @param id ship id
     */
    void disableShip(String id);

    /***
     * change ship information
     * @param ship ship object to change
     */
    void changeShip(Ship ship);

    /***
     * find ship detail
     * @param id id used to find ship
     * @return a ship object with detailed information
     */
    Ship showShipDetail(String id);

    /***
     * list all ships
     * @return a list collection of ships
     */
    List<Ship> listAllShips();
}
