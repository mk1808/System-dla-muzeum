package com.put.mguide.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.put.mguide.model.Room;
import com.put.mguide.service.ExhibitService;
import com.put.mguide.service.RoomService;

@RestController
@RequestMapping("/api/dictionaries")
public class DictionaryController {
	
	private final RoomService roomService;
	
	@Autowired
	public DictionaryController(RoomService roomService) {
		super();
		this.roomService = roomService;
	}
	
	@GetMapping("/rooms")
	ResponseEntity<List<Room>> getRooms() {

		return ResponseEntity.ok(roomService.getAll());
	}
	
	@PostMapping("/rooms")
	ResponseEntity<Room> create(@RequestBody Room room) {

		return ResponseEntity.ok(roomService.create(room));
	}

}
