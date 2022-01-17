package com.put.mguide.service.impl;

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
		if (exhibit.getRoom()!=null) {
			Room room = roomRepository.getById(exhibit.getRoom().getId());
			exhibit.setRoom(room);
		}
		
		return exhibitRepository.save(exhibit);
	}


	public List<Exhibit> getFilteredList(Long pageNo, String name) {
		return exhibitRepository.getByName(name);
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
		old.setRoom( roomRepository.getById(exhibit.getRoom().getId()));
		return exhibitRepository.save(old);
	}

	public List<Exhibit> getFIlteredListWithType(Long pageNo, String name, Boolean disconnected, String connected) {
		// TODO Auto-generated method stub
		return null;
	}

}
