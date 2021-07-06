package com.axiomsl.hotel.service;

import com.axiomsl.hotel.model.Hotel;

import java.util.List;


public interface HotelService {
    /* Basic CRUD operations */
    List<Hotel> findAllByCriteria(String name, String author, String genre);
    Hotel findOne(Long id);
    Hotel findByName(String name);
    Hotel save(Hotel hotel);
    void delete(Long id);
}
