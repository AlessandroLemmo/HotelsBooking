package com.axiomsl.hotel.service;

import com.axiomsl.hotel.model.Hotel;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;


interface HotelRepository extends CrudRepository<Hotel, Long>, JpaSpecificationExecutor<Hotel> {
    /* Custom query with join */
    Hotel findByName(String name);
}
