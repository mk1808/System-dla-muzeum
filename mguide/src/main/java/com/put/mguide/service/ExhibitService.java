package com.put.mguide.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.put.mguide.model.Exhibit;
import com.put.mguide.other.Message;

@Service
public interface ExhibitService {

	List<Exhibit> getFilteredList(Long pageNo, String name, String number);

	Message delete(Long id);

	Exhibit create(Exhibit exhibit);

	Exhibit getSingle(Long id);

	Exhibit update(Exhibit exhibit);

	List<Exhibit> getFIlteredListWithType(Long pageNo, String name, Boolean disconnected, Boolean connected);

	List<Exhibit> getFilteredListCommon(Long pageNo, String nameOrNumber);

}
