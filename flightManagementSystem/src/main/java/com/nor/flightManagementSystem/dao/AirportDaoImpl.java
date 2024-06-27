package com.nor.flightManagementSystem.dao;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.nor.flightManagementSystem.bean.Airport;
@Service
@Repository
public class AirportDaoImpl implements AirportDao {
	@Autowired
	private AirportRepository airportrepo;

	@Override
	public Airport saveAirport(Airport airport) {
		 
		return airportrepo.save(airport);
	}

	@Override
	public List<Airport> findAllAirports() {
		 return airportrepo.findAll();
	}
//
//	@Override
//	public Airport findAirportById(String id) {
//		// TODO Auto-generated method stub
//		return airportrepo.getById(id).get();
//
 

	@Override
	public List<String> findAllAirportCodes() {
		 
		return airportrepo.findAllAirportCodes();
	}

	@Override
	public String findAirportCodeByLocation(String AirportLocation) {
		// TODO Auto-generated method stub
		return airportrepo.findAirportCodeByLocation(AirportLocation);
	}

	@Override
	public Airport findAirportById(String id) {
		// TODO Auto-generated method stub
		return airportrepo.findById(id).get();
	}
	 
	 

}
