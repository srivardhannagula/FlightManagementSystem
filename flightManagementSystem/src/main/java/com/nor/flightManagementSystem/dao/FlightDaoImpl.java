package com.nor.flightManagementSystem.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.nor.flightManagementSystem.bean.Flight;
@Service
@Repository
public class FlightDaoImpl implements FlightDao {
	@Autowired
	private FlightRepository flightrepo;
	@Override
	public void save(Flight flight) {
		 flightrepo.save(flight);
	}

	@Override
	public List<Flight> findAllFlights() {
		// TODO Auto-generated method stub
		return flightrepo.findAll();
	}
	
}
