package com.axiomsl.hotel.service;

import com.axiomsl.hotel.model.Room;
import com.axiomsl.hotel.model.RoomDirection;
import com.axiomsl.hotel.model.RoomType;

import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;


interface RoomRepository extends CrudRepository<Room, Long>, JpaSpecificationExecutor<Room> {
    /* Custom queries with join */
    Room findByNumber(String number);
    List<Room> findAllByCriteriaAndCity(@Param("city") String city, @Param("number") String number, @Param("type") RoomType type, @Param("direction") RoomDirection direction);
}
