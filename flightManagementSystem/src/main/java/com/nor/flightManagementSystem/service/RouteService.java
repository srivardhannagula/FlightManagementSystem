package com.nor.flightManagementSystem.service;

import org.springframework.stereotype.Service;

import com.nor.flightManagementSystem.bean.Route;

@Service
public class RouteService {
	public Route createReturnRoute(Route route) {
		Long newID=route.getRouteId()+1;
		String sourcecode=route.getDestinationAirportCode();
		String destinationcode=route.getSourceAirportCode();
		return new Route(newID,sourcecode,destinationcode,route.getFair());
	}
}
