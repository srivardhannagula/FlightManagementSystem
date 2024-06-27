package com.nor.flightManagementSystem.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.nor.flightManagementSystem.bean.Flight;

public interface FlightRepository extends JpaRepository<Flight, Long> {
@Query("SELECT a FROM Flight a WHERE routeId=?1")
public List<Flight> findFlightByRouteId(Long routeId);
}
