package com.nor.flightManagementSystem.dao;


import java.util.List;

import com.nor.flightManagementSystem.bean.Passenger;
import com.nor.flightManagementSystem.bean.TicketPassengerEmbed;

public interface PassengerDao {
public void savePassenger(Passenger passenger);
public List<Passenger> getAllPassengers();
public List<Passenger> findByTicketNumber(Long ticketNumber);
public void deleteByTicketNumber(TicketPassengerEmbed ticketNumber);
 
}
