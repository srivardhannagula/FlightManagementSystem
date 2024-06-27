package com.nor.flightManagementSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.nor.flightManagementSystem.bean.Route;
import com.nor.flightManagementSystem.dao.AirportDao;
import com.nor.flightManagementSystem.dao.RouteDao;
import com.nor.flightManagementSystem.service.RouteService;

@RestController
public class RouteController {
	@Autowired 
	private RouteDao routedao;
	@Autowired
	private AirportDao airportdao;
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
}
