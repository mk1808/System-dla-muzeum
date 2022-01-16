package com.put.mguide.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.put.mguide.model.Room;

@Service
public interface RoomService {

	List<Room> getAll();

}
