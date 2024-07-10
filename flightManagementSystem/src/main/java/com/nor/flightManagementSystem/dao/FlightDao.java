package com.nor.flightManagementSystem.dao;

import java.util.List;

import com.nor.flightManagementSystem.bean.Flight;

public interface FlightDao {
	public void save(Flight flight);
	public List<Flight> findAllFlights();
	public List<Flight> findFlightsByRouteId(Long routeId);
	public Flight findFlightById(Long id);
}
