package com.nor.flightManagementSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.nor.flightManagementSystem.bean.Airport;
import com.nor.flightManagementSystem.bean.Flight;
import com.nor.flightManagementSystem.bean.Route;
import com.nor.flightManagementSystem.dao.AirportDao;
import com.nor.flightManagementSystem.dao.FlightDao;
import com.nor.flightManagementSystem.dao.RouteDao;
import com.nor.flightManagementSystem.exception.RouteException;
import com.nor.flightManagementSystem.exception.RouteNotFoundException;
import com.nor.flightManagementSystem.service.RouteService;
@ControllerAdvice
@RestController
public class RouteController {
	@Autowired 
	private RouteDao routedao;
	@Autowired
	private AirportDao airportdao;
	@Autowired
	private FlightDao flightdao;
	@Autowired
	private RouteService routeservice;
	@GetMapping("/routes")
	public ModelAndView routeEntery() {
		Route route=new Route();
		ModelAndView mv=new ModelAndView("routeEntry");
		route.setRouteId(routedao.generateRouteId());
		mv.addObject("routeDetails", route);
		return mv;
	}
	@PostMapping("/routes")
	public ModelAndView showAllRoutes(@ModelAttribute("routeDetails")Route route) {
		String destinationcode=airportdao.findAirportCodeByLocation(route.getDestinationAirportCode()).toUpperCase();
		String sourcecode=airportdao.findAirportCodeByLocation(route.getSourceAirportCode()).toUpperCase();
		route.setDestinationAirportCode(destinationcode);
		route.setSourceAirportCode(sourcecode);
		Route route1=routeservice.createReturnRoute(route);
		routedao.saveRoute(route);
		routedao.saveRoute(route1);
		return new ModelAndView("index");
	}
	@GetMapping("/showroutes")
	public ModelAndView showAllRoutes() {
		List<Route> listroute=routedao.findAllRoutes();
		System.out.println(listroute);
		ModelAndView mv=new ModelAndView("showAllRoutes");
		mv.addObject("routesdata",listroute);
		return mv;
	}
	@GetMapping("/availableflights")
	public ModelAndView showRoutes() {
		List<String> airportslist=airportdao.findAllAirportLocations();
		ModelAndView mv=new ModelAndView("routeSelect");
		mv.addObject("airportlist", airportslist);
		return mv;
	}
	@PostMapping("/availableflights")
	public ModelAndView showselectRoutes(@RequestParam("from_city")String fromcity,@RequestParam("to_city")String tocity) {
		String fromAirport=airportdao.findAirportCodeByLocation(fromcity);
		String toAirport=airportdao.findAirportCodeByLocation(tocity);
		if(fromAirport.equalsIgnoreCase(toAirport)) {
			throw new RouteException();
		}
		Route route=routedao.findRouteBySourceAndDestination(fromAirport, toAirport);
		 
		if(route==null) {
			throw new RouteNotFoundException();
		}
		List<Flight> flightList= flightdao.findFlightsByRouteId(route.getRouteId());
		ModelAndView mv=new ModelAndView("routeFlightShowPage");
		mv.addObject("flightList",flightList);
		mv.addObject("fromAirport", fromAirport);
		mv.addObject("toAirport", toAirport);
		mv.addObject("fair",route.getFair());
		return mv;
		
	}
	@ExceptionHandler(value=RouteException.class)
	public ModelAndView handlingRouteException(RouteException exception) {
		String message="From -City & To-City cannnot be the same....";
		ModelAndView mv=new ModelAndView("routeErrorPage");
		mv.addObject("errorMessage", message);
		return mv;
	}
	@ExceptionHandler(value=RouteNotFoundException.class)
	public ModelAndView handlingRouteNotFoundException(RouteNotFoundException exception) {
		String message="From -City & To-City  No flights....";
		ModelAndView mv=new ModelAndView("routeNotFoundPage");
		mv.addObject("errorMessage", message);
		return mv;
	}
}
