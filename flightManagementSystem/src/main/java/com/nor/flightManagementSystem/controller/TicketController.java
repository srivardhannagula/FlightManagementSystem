package com.nor.flightManagementSystem.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.nor.flightManagementSystem.bean.Flight;
import com.nor.flightManagementSystem.bean.Passenger;
import com.nor.flightManagementSystem.bean.Route;
import com.nor.flightManagementSystem.bean.Ticket;
import com.nor.flightManagementSystem.bean.TicketPassengerEmbed;
import com.nor.flightManagementSystem.dao.AirportDao;
import com.nor.flightManagementSystem.dao.FlightDao;
import com.nor.flightManagementSystem.dao.PassengerDao;
import com.nor.flightManagementSystem.dao.RouteDao;
import com.nor.flightManagementSystem.dao.TicketDao;
import com.nor.flightManagementSystem.exception.RouteException;
import com.nor.flightManagementSystem.exception.SeatNotFoundException;
import com.nor.flightManagementSystem.service.TicketService;

@ControllerAdvice
@RestController
public class TicketController {
	@Autowired
	private TicketDao ticketDao;
	
	@Autowired
	private FlightDao flightDao;
	
	@Autowired
	private RouteDao routeDao;
	 
	@Autowired
	private TicketService ticketService;
	
	@Autowired
	private PassengerDao passengerDao;
	
	
	@GetMapping("/ticket/{id}")
	public ModelAndView showTicketBookingPage(@PathVariable Long id) {
		Flight flight=flightDao.findFlightById(id);
		Route route=routeDao.findRouteById(flight.getRouteId());
		Long newTicketId=ticketDao.findLastTicketNumber();
		Ticket ticket=new Ticket();
		ticket.setTicketNumber(newTicketId);
		ticket.setFlightNumber(flight.getFlightNumber());
		ticket.setCarrierName(flight.getCarrierName());
		ModelAndView mv=new ModelAndView("ticketBookingPage");
		mv.addObject("ticketRecord", ticket);
		mv.addObject("flightRecord", flight);
		mv.addObject("routeRecord", route);
	
		return mv;
	}
	@PostMapping("/ticket")
	public ModelAndView showTicketPage(@ModelAttribute("ticketRecord")Ticket ticket,HttpServletRequest request) {
		String fromCity=request.getParameter("fromLocation");
		
		String toCity=request.getParameter("toLocation");
		String fair=request.getParameter("fair");
		Flight flight=flightDao.findFlightById(ticket.getFlightNumber());
		ticket.setRouteId(flight.getRouteId());
		Double fare=Double.parseDouble(fair);
		List<Passenger> passengerList=new ArrayList<>();
		Double totalfare=0.0;
		for(int i=1;i<=6;i++) {
			String pname=request.getParameter("name"+i);
			if(!pname.equals("--")) {
				String pdob=request.getParameter("dob"+i);
				System.out.println(pdob);
				TicketPassengerEmbed embed=new TicketPassengerEmbed(ticket.getTicketNumber(),i);
				Passenger passenger=new Passenger(embed,pname,pdob);
				passenger.setFare(fare);
				fare=ticketService.discountedFareCalculation(passenger);
				totalfare+=fare;
				passenger.setFare(fare);
				passengerList.add(passenger);
			}
			else {
				break;
			}
		}
		//System.out.println(passengerList.size());
		ticket.setTotalAmount(totalfare);
		if(ticketService.capacityCalculation(passengerList.size(), ticket.getFlightNumber())) {
			ticketDao.save(ticket);
			 
			for(Passenger passenger:passengerList) {
				passengerDao.savePassenger(passenger);
				 
			}
			 
		}
		else {
			throw new SeatNotFoundException();
		}
		
		ModelAndView mv=new ModelAndView("showTicketPage");
		mv.addObject("ticketNum", ticket.getTicketNumber());
		mv.addObject("carrierName",ticket.getCarrierName());
		mv.addObject("flightNum", ticket.getFlightNumber());
		mv.addObject("fromLoc", fromCity);
		mv.addObject("toLoc", toCity);
		mv.addObject("totalfare", totalfare);
		mv.addObject("passengerData",passengerList);
		
		
		return mv;
	}
	@ExceptionHandler(value=SeatNotFoundException.class)
	public ModelAndView handlingSeatNotFoundException(SeatNotFoundException exception) {
		String message="Seats Not Available";
		System.out.println(message);
		ModelAndView mv=new ModelAndView("seatNotFoundPage");
		mv.addObject("errorMessage", message);
		return mv;
	}
	@GetMapping("/viewBooking")
	public ModelAndView showTicketBooking( ) {
		 ModelAndView mv=new ModelAndView("viewBooking");
	
		return mv;
	}
	@GetMapping("/showTicketsPage")
	public ModelAndView showTicket( ) {
		 ModelAndView mv=new ModelAndView("showTicketsPage");
		 
		return mv;
	}
	@PostMapping("/showTicketsPage")
	public ModelAndView showPostTicket(@RequestParam("ticketNumber")Long ticketNumber) {
		  
		 
		 Ticket ticketdd= ticketDao.findTicketByTicketNumber(ticketNumber);
		 List<Passenger> passenger=passengerDao.findByTicketNumber(ticketNumber);
		 List<Passenger>passengerList=new ArrayList<>();
		 for(int i=0;i<passenger.size();i++) {
			 Long ticket=passenger.get(i).getEmbeddedId().getTicketNumber();
			 if((ticketNumber+"").equals(ticket+"")){
				 passengerList.add(passenger.get(i));
 
		 }
		 }
		 
		 //System.out.println("hii");
		 ModelAndView mv=new ModelAndView("showTicketPage");
			mv.addObject("ticketNum",ticketdd.getTicketNumber());
			mv.addObject("carrierName",ticketdd.getCarrierName());
			mv.addObject("flightNum", ticketdd.getFlightNumber());
			Flight flight=flightDao.findFlightById(ticketdd.getFlightNumber());
			mv.addObject("fromLoc", flight.getDeparture());
			mv.addObject("toLoc", flight.getArrival());
			mv.addObject("totalfare", ticketdd.getTotalAmount());
			mv.addObject("passengerData",passengerList);
			return mv;
	}
	
    @PostMapping("/viewBooking")
    public ModelAndView viewBooking(@RequestParam("ticketNumber") Long ticketNumber) {
    	 
        Ticket ticket = ticketDao.findTicketByTicketNumber(ticketNumber);
        ModelAndView mv = new ModelAndView("viewTicket");
        mv.addObject("ticket", ticket);
        //mv.addObject("passengers", passengerDao.findByTicketNumber(ticketNumber));
        return mv;
    }
    @GetMapping("/deleteTicket")
    public ModelAndView deleteTicket(@RequestParam("ticketNumber") String ticketNumber,@RequestParam("flightNumber") String flightNumber) {
    	System.out.println(ticketNumber);
    	int count=0;
    	Long flightNum=Long.parseLong(flightNumber);
    	Long ticket=Long.parseLong(ticketNumber);
    	List<Passenger> passenger=passengerDao.findByTicketNumber(ticket);
    	for(int i=0;i<passenger.size();i++) {
			 Long ticketNum=passenger.get(i).getEmbeddedId().getTicketNumber();
			 if((ticketNumber+"").equals(ticketNum+"")){
			passengerDao.deleteByTicketNumber(passenger.get(i).getEmbeddedId());
			count++;
		 }
    	
    	}
    	System.out.println(count);
    	//ticketDao.deleteByTicketNumber(ticket);
    	ticketDao.deleteByTicketNumber(ticket);
    	Flight flight=flightDao.findFlightById(flightNum);
    	System.out.println(flight.getSeatBooked());
    	flight.setSeatBooked(flight.getSeatBooked()-count);
    	System.out.println(flight.getSeatBooked());
    	flightDao.save(flight);
    	ModelAndView mv=new ModelAndView("redirect:/index");
        return mv;	
    }
	
}
