package com.put.mguide.service;

import org.springframework.stereotype.Service;

import com.put.mguide.model.Exhibit;

@Service
public interface ExhibitService {

	String getFIlteredList(Long pageNo, String name);


	String delete(Long id);

	String create(Exhibit exhibit);

	String getSingle();

	String update();

	String getFIlteredListWithType(Long pageNo, String name, Boolean disconnected, String connected);

}
