package com.put.mguide.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.put.mguide.model.Exhibit;
import com.put.mguide.model.Room;
import com.put.mguide.other.Message;
import com.put.mguide.repository.ExhibitRepository;
import com.put.mguide.repository.RoomRepository;
import com.put.mguide.service.ExhibitService;

@Service
public class ExhibitServiceImpl implements ExhibitService{

	private final ExhibitRepository exhibitRepository;
	private final RoomRepository roomRepository;
	
	@Autowired
	public ExhibitServiceImpl(ExhibitRepository exhibitRepository, RoomRepository roomRepository) {
		super();
		this.exhibitRepository = exhibitRepository;
		this.roomRepository = roomRepository;
	}
	

	public Message delete(Long id) {
		exhibitRepository.deleteById(id);
		return new Message("deleted");
	}

	public Exhibit create(Exhibit exhibit) {
		exhibit=setRoom(exhibit);
		
		return exhibitRepository.save(exhibit);
	}


	public List<Exhibit> getFilteredList(Long pageNo, String name, String number) {
		Boolean isNameEmpty = isEmpty(name);
		Boolean isNumberEmpty = isEmpty(number);
		
		
		if (!isNameEmpty&&!isNumberEmpty) {
			return exhibitRepository.getByNumberContainingAndNameContaining(number, name);	
		}else if(!isNameEmpty) {
			return exhibitRepository.getByNameContaining(name);
		}else if(!isNumberEmpty) {
			return exhibitRepository.getByNumberContaining(number);
		}
		
		return exhibitRepository.findAll();
	}

	public Exhibit getSingle(Long id) {
		return exhibitRepository.getById(id);
	}

	public Exhibit update(Exhibit exhibit) {
		Exhibit old = exhibitRepository.getById(exhibit.getId());
		old.setDescription(exhibit.getDescription());
		old.setName(exhibit.getName());
		old.setNumber(exhibit.getNumber());
		old.setPhoto(exhibit.getPhoto());
		old=setRoom(old);
		return exhibitRepository.save(old);
	}

	public List<Exhibit> getFIlteredListWithType(Long pageNo, String name, Boolean disconnected, Boolean connected) {

		List<Exhibit> all = new ArrayList<Exhibit>();
		if (connected && disconnected) {
			all.addAll(exhibitRepository.getByName(name));
		} else if (connected) {
			all.addAll(exhibitRepository.getByNameAndConnected(name, true));
		} else if (disconnected) {
			all.addAll(exhibitRepository.getByNameAndConnected(name, false));
		}

		return all;
	}
	
	private Boolean isEmpty(String string) {
		return string == null || string.isEmpty() || string.trim().isEmpty();
	}
	
	private Exhibit setRoom(Exhibit exhibit) {
		if (exhibit.getRoom()!=null&&exhibit.getRoom().getId()!=null) {
			Room room = roomRepository.getById(exhibit.getRoom().getId());
			exhibit.setRoom(room);
		}
		else {
			exhibit.setRoom(null);
		}
		return exhibit;
	}

}
