package com.axiomsl.hotel.service;

import com.axiomsl.hotel.model.Room;
import com.axiomsl.hotel.model.RoomDirection;
import com.axiomsl.hotel.model.RoomType;

import java.util.List;


public interface RoomService {
    /* Basic CRUD operations */
    List<Room> findAllByCriteria(String number, RoomType type, RoomDirection direction);
    List<Room> findAllByCriteriaAndCity(String city, String name, Integer numBeds, RoomType type, RoomDirection direction);
    Room findOne(Long id);
    Room findByNumber(String number);
    Room save(Room room);
    void delete(Long id);
}
