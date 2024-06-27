package com.nor.flightManagementSystem.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.nor.flightManagementSystem.bean.Route;
@Service
@Repository
public class RouteDaoImpl implements RouteDao {
	@Autowired
	private RouteRepository routerepo;

	@Override
	public void saveRoute(Route route) {
		 
		routerepo.save(route);
		
	}

	@Override
	public List<Route> findAllRoutes() {
		 
		return routerepo.findAll();
	}

	@Override
	public Route findRouteById(Long Id) {
		 
		return routerepo.findById(Id).get();
	}

	@Override
	public Long findRouteBySourceAndDestination(String source, String destination) {
		 
		return routerepo.findRouteBySourceAndDestination(source, destination);
	}

	@Override
	public Long generateRouteId() {
		Long value=routerepo.findLastRouteId();
		if(value==null) {
			value=101L;
		}
		else {
			value=routerepo.findLastRouteId()+1;
		}
		 
		return value;
	}

	@Override
	public List<Long> findAllRoutesId() {
		// TODO Auto-generated method stub
		return routerepo.findAllRoutesId();
	}
	
	 
}
