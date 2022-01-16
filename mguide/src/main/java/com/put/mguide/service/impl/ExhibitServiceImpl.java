package com.put.mguide.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.put.mguide.model.Exhibit;
import com.put.mguide.repository.ExhibitRepository;
import com.put.mguide.service.ExhibitService;

public class ExhibitServiceImpl implements ExhibitService{

	private final ExhibitRepository exhibitRepository;
	
	@Autowired
	public ExhibitServiceImpl(ExhibitRepository exhibitRepository) {
		super();
		this.exhibitRepository = exhibitRepository;
	}
	
	public String getFIlteredList(Long pageNo, String name) {
		// TODO Auto-generated method stub
		return null;
	}

	public String delete(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	public String create(Exhibit exhibit) {
		// TODO Auto-generated method stub
		return null;
	}

	public String getSingle() {
		// TODO Auto-generated method stub
		return null;
	}

	public String update() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getFIlteredListWithType(Long pageNo, String name, Boolean disconnected, String connected) {
		// TODO Auto-generated method stub
		return null;
	}

}
