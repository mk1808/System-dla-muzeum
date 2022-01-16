package com.put.mguide.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.put.mguide.model.Room;
import com.put.mguide.repository.RoomRepository;
import com.put.mguide.service.RoomService;

public class RoomServiceImpl implements RoomService{

	private final RoomRepository roomRepository;
	
	@Autowired
	public RoomServiceImpl(RoomRepository roomRepository) {
		super();
		this.roomRepository = roomRepository;
	}
	
	public List<Room> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
