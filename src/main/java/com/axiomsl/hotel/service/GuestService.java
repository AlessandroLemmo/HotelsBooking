package com.axiomsl.hotel.service;

import com.axiomsl.hotel.model.Guest;


public interface GuestService {
    /* Basic CRUD operations */
    Guest findByLogin(String login);
    Guest save(Guest guest);
    void delete(Long id);
}
