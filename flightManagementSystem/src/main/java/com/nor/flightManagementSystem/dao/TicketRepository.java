package com.nor.flightManagementSystem.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.nor.flightManagementSystem.bean.Ticket;

public interface TicketRepository extends JpaRepository<Ticket, Long> {
	@Query("select max(ticketNumber) from Ticket")
	public Long findLastTicketNumber();
//	@Modifying
//    @Query("delete from Ticket t where t.ticketNumber = ?1")
//    void deleteByTicketNumber(Long ticketNumber);

//	public void deleteByTicketNumber(Long ticketNumber);
}
