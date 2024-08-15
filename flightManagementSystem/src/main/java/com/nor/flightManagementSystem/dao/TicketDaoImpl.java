package com.nor.flightManagementSystem.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.nor.flightManagementSystem.bean.Ticket;
@Service
@Repository
public class TicketDaoImpl implements TicketDao {
	@Autowired
	private TicketRepository repository;
	@Override
	public void save(Ticket ticket) {
		 repository.save(ticket);
		
	}

	@Override
	public Long findLastTicketNumber() {
		 Long val=repository.findLastTicketNumber();
		 if(val==null) {
			 val=1000001L;
		 }
		 else {
			 val=val+1;
		 }
		return val;
	}

	@Override
	public List<Ticket> getAllTickets() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}

	@Override
	public Ticket findTicketByTicketNumber(Long ticketNumber) {
		// TODO Auto-generated method stub
		return repository.getById(ticketNumber);
	}

	@Override
	public void deleteByTicketNumber(Long ticketNumber) {
		// TODO Auto-generated method stub
		repository.deleteById(ticketNumber);
	}

	//@Override
//	public void deleteByTicketNumber(Long ticketNumber) {
//		// TODO Auto-generated method stub
//		repository.deleteByTicketNumber(ticketNumber);
//		
//	}

}
