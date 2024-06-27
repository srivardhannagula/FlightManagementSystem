package com.nor.flightManagementSystem.dao;

 

import java.util.List;

import com.nor.flightManagementSystem.bean.Airport;

 

public interface AirportDao {
 
public Airport saveAirport(Airport airport);
public List<Airport> findAllAirports();
public Airport findAirportById(String id);
public List<String> findAllAirportCodes();
public String findAirportCodeByLocation(String AirportLocation);
}
