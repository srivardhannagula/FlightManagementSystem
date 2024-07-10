package com.nor.flightManagementSystem.service;

import java.time.LocalDate;
import java.time.Period;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nor.flightManagementSystem.bean.Flight;
import com.nor.flightManagementSystem.bean.Passenger;
import com.nor.flightManagementSystem.dao.FlightDao;
import com.nor.flightManagementSystem.dao.RouteDao;

@Service
public class TicketService {
	@Autowired 
	private FlightDao flightDao;
	@Autowired 
	private RouteDao routeDao;
	private int ageCalculation(String dob) {
		LocalDate today=LocalDate.now();
		String dateArr[]=dob.split("-");
		LocalDate birthDay=LocalDate.of(Integer.parseInt(dateArr[0]),Integer.parseInt(dateArr[1]), Integer.parseInt(dateArr[2]));
		Period period=Period.between(birthDay, today);
		int age=period.getYears();
		return age;
	}
	public Double discountedFareCalculation(Passenger passenger) {
		int age=ageCalculation(passenger.getPassengerDOB());
		double finalFare=0.0;
		if(age<=14) {
		finalFare=passenger.getFare();
		}
		else if(age>=60) {
			finalFare=passenger.getFare()-passenger.getFare()*0.30;
			
		}
		else {
			finalFare=passenger.getFare();
			 
		}
		return finalFare;
	}
	public boolean capacityCalculation(int numberOfSeatBooking,long flightNumber) {
		Flight flight=flightDao.findFlightById(flightNumber);
		int bookedSeat=flight.getSeatBooked()+numberOfSeatBooking;
		int balance=flight.getSeatCapacity()-bookedSeat;
		if(balance<0) {
			return false;
		}
		else {
			flight.setSeatBooked(bookedSeat);
			//flight.setSeatCapacity(balance);
			flightDao.save(flight);
			return true;
		}
	}
//discount()
//ageCalculation()
//capacityCalculation()
	
	
	}
