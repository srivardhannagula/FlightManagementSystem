package com.nor.flightManagementSystem.dao;


import java.util.List;

import com.nor.flightManagementSystem.bean.Passenger;

public interface PassengerDao {
public void savePassenger(Passenger passenger);
public List<Passenger> getAllPassengers();
//public Passenger findByTicketNumber(Long ticketNumber);
}
