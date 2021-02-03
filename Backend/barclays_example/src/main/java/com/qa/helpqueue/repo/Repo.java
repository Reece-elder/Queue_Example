package com.qa.helpqueue.repo;

import java.util.List;

import org.springframework.data.domain.Sort;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.qa.helpqueue.ticket.Ticket;


@Repository
public interface Repo extends JpaRepository<Ticket, Long> {
	
}
