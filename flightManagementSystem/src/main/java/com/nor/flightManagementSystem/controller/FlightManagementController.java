package com.nor.flightManagementSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.nor.flightManagementSystem.bean.Airport;
import com.nor.flightManagementSystem.bean.Flight;
import com.nor.flightManagementSystem.dao.AirportDao;
import com.nor.flightManagementSystem.dao.AirportRepository;
import com.nor.flightManagementSystem.dao.FlightDao;
import com.nor.flightManagementSystem.dao.RouteDao;
import com.nor.flightManagementSystem.service.FlightService;
 

@RestController
public class FlightManagementController {
	 @Autowired
	 private AirportDao airportdao;
	 @Autowired
	 private AirportRepository airportrepo;
	 @Autowired
	 private FlightDao flightdao;
	 @Autowired
	 private RouteDao routeDao;
	 @Autowired
	 private FlightService flightService;
	 @GetMapping("/airport")
	 public ModelAndView showAddAirports() {
		 Airport airport=new Airport();
		 ModelAndView mv=new ModelAndView("airportEntry");
		 mv.addObject("AirportDetails", airport);
		 return mv;
	 }
	 @PostMapping("/airport")
	 public ModelAndView showAirport(@ModelAttribute("AirportDetails")Airport airport) {
	 String str=airport.getAirportCode().toUpperCase();
    airport.setAirportCode(str);
    String stg=airport.getAirportLocation().toUpperCase();
    airport.setAirportLocation(stg);
		 airportdao.saveAirport(airport);
		 //airportrepo.save(airport);
		 return new ModelAndView("index");
	 }
	 @GetMapping("showAllAirports")
	 public ModelAndView showAllAirports() {
		List<Airport>allairports= airportdao.findAllAirports();
		ModelAndView mv=new ModelAndView("showAllAirports");
		mv.addObject("airportsdata", allairports);
		return mv;
	 }
	 @GetMapping("/showAllAirportCodes")
	 public ModelAndView  showAllAirportCodes() {
		
		 List<String> apcodes=airportdao.findAllAirportCodes();
		 ModelAndView mv=new ModelAndView("showAllAirportCodes");
		 mv.addObject("airportcodes", apcodes);
		 return mv;
	 }
	/* @GetMapping("showAirport")
	 public ModelAndView showAllAirport() {
		List<String>allairports= airportdao.findAllAirportCodes();
		ModelAndView mv=new ModelAndView("airportSelect");
		mv.addObject("allairportcodes", allairports);
		return mv;
	 }*/
	 @GetMapping("/showAirport/{id}")
	 public ModelAndView showAiport(@PathVariable("id") String id) {
	        Airport str=airportdao.findAirportById(id);
	        //System.out.println(str.getAirportLocation());
	        ModelAndView mv=new ModelAndView("showSelectedAirport");
	        mv.addObject("airportLocation", str);
	        return mv;
	    }
	 
	 @GetMapping("/flight")
	 public ModelAndView AddFlights() {
		 List<Long>routeList=routeDao.findAllRoutesId();
		 Flight flight=new Flight();
		 ModelAndView mv=new ModelAndView("newflight");
		 mv.addObject("flightdetails", flight);
		 mv.addObject("routeList", routeList);
		  
		 return mv;
	 }
	 @PostMapping("/flight")
	 public ModelAndView showFlights(@ModelAttribute("flightdetails")Flight flight,@RequestParam("dtime")String dtime,@RequestParam("atime")String atime) {
		  
		 Flight flight2=flightService.createReturnFlight(flight, dtime, atime);
		 System.out.println(flight2);
		 
		 flightdao.save(flight);
		 flightdao.save(flight2);
		 return new ModelAndView("index");
	 }
	 @GetMapping("/showAllAddedFlights")
	 public ModelAndView  showAllFlights() {
		
		 List<Flight> flights=flightdao.findAllFlights();
		 ModelAndView mv=new ModelAndView("showAllAddedFlights");
		 mv.addObject("flightdetails", flights);
		 return mv;
	 }
	 
	 
    
}
