package com.nor.flightManagementSystem.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.nor.flightManagementSystem.bean.Passenger;
@Service
@Repository
public class PassengerDaoImpl implements PassengerDao{
	@Autowired
	PassengerRepository repository;
	 
	@Override
	public void savePassenger(Passenger passenger) {
		// TODO Auto-generated method stub
		 repository.save(passenger);
	}

	@Override
	public List<Passenger> getAllPassengers( ) {
		// TODO Auto-generated method stub
		return repository.findAll();
	}

//	@Override
//	public Passenger findByTicketNumber(Long ticketNumber) {
//		// TODO Auto-generated method stub
//		return repository.findById(ticketNumber);
//	}

}
