package com.qa.helpqueue.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qa.helpqueue.repo.Repo;
import com.qa.helpqueue.ticket.Ticket;

@Service
public class Queue_Service {
	
	@Autowired
	private Repo repo;
	
	public Queue_Service(Repo repo) {
		super();
		this.repo = repo;
	}
	
	public Ticket createTicket(Ticket ticket) {
		return this.repo.save(ticket);
	}
	
	public List<Ticket> getTicket() {
		return this.repo.findAll();
	}
	
	public Ticket updateTicket(Ticket ticket, Long id) {
		Ticket oldTicket = this.repo.findById(id).orElseThrow();
		oldTicket.setAuthor(ticket.getAuthor());
		oldTicket.setDescription(ticket.getDescription());
		oldTicket.setTimestamp(ticket.getTimestamp());
		oldTicket.setTitle(ticket.getTitle());
		
		Ticket saved = this.repo.save(oldTicket);
		return saved;
	}
	
	public boolean deleteTicket(Long id) {
		this.repo.deleteById(id);
		return !this.repo.existsById(id);
	}

}
