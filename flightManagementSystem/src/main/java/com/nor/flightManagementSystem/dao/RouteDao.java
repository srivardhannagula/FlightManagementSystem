package com.nor.flightManagementSystem.dao;

import java.util.List;
import com.nor.flightManagementSystem.bean.Route;

public interface RouteDao {
	public void saveRoute(Route route);
	public List<Route>  findAllRoutes();
	public Route findRouteById(Long Id);
	public Route findRouteBySourceAndDestination(String source,String destination);
	public Long generateRouteId();
	public List<Long> findAllRoutesId();
}
