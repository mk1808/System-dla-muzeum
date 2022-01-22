package com.put.mguide.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.put.mguide.model.Exhibit;
import com.put.mguide.other.Message;
import com.put.mguide.service.ExhibitService;

@RestController
@RequestMapping("/api/exhibits")
public class ExhibitController {
	
	private final ExhibitService exhibitService;
	
	@Autowired
	public ExhibitController(ExhibitService exhibitService) {
		super();
		this.exhibitService = exhibitService;
	}
	
	
	@GetMapping
	ResponseEntity<List<Exhibit>> getFIlteredList(@RequestParam(required = false) Long pageNo, @RequestParam(required = false) String name, @RequestParam(required = false) String number ) {

		return ResponseEntity.ok(exhibitService.getFilteredList(pageNo, name, number));
	}
	
	@GetMapping("/common")
	ResponseEntity<List<Exhibit>> getFIlteredListCommon(@RequestParam(required = false) Long pageNo, @RequestParam(required = false) String nameOrNumber) {

		return ResponseEntity.ok(exhibitService.getFilteredListCommon(pageNo, nameOrNumber));
	}
	
	@GetMapping("/withConnections")
	ResponseEntity<List<Exhibit>> getFIlteredListType(@RequestParam Long pageNo, @RequestParam String name, @RequestParam Boolean disconnected, @RequestParam Boolean connected) {

		return ResponseEntity.ok(exhibitService.getFIlteredListWithType(pageNo, name, disconnected,connected ));
	}
	
	@DeleteMapping("/{id}")
	ResponseEntity<Message> delete (@PathVariable Long id ) {

		return ResponseEntity.ok(exhibitService.delete(id));
	}
	
	@PostMapping
	ResponseEntity<Exhibit> create(@RequestBody Exhibit exhibit) {

		return ResponseEntity.ok(exhibitService.create(exhibit));
	}
	
	@GetMapping("/{id}")
	ResponseEntity<Exhibit> getSingle( @PathVariable Long id ) {

		return ResponseEntity.ok(exhibitService.getSingle(id)); 
				//ResponseEntity.ok(exhibitService.getSingle(id).getId());
	}
	
	@PutMapping
	ResponseEntity<Exhibit> update(@RequestBody Exhibit exhibit) {

		return ResponseEntity.ok(exhibitService.update(exhibit));
	}
	
}
