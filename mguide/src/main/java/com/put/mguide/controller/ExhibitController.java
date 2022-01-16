package com.put.mguide.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.put.mguide.model.Exhibit;
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
	ResponseEntity<String> getFIlteredList(@RequestParam Long pageNo, @RequestParam String name ) {

		return ResponseEntity.ok(exhibitService.getFIlteredList(pageNo, name));
	}
	
	@GetMapping
	ResponseEntity<String> getFIlteredListType(@RequestParam Long pageNo, @RequestParam String name, @RequestParam Boolean disconnected, @RequestParam String connected) {

		return ResponseEntity.ok(exhibitService.getFIlteredListWithType(pageNo, name, disconnected,connected ));
	}
	
	@DeleteMapping("/{id}")
	ResponseEntity<String> delete (@PathVariable Long id ) {

		return ResponseEntity.ok(exhibitService.delete(id));
	}
	
	@PostMapping
	ResponseEntity<String> create(@RequestBody Exhibit exhibit) {

		return ResponseEntity.ok(exhibitService.create(exhibit));
	}
	
	@GetMapping("/{id}")
	ResponseEntity<String> getSingle( @RequestParam String id ) {

		return ResponseEntity.ok(exhibitService.getSingle());
	}
	
	@PostMapping
	ResponseEntity<String> update(@RequestBody Exhibit exhibit) {

		return ResponseEntity.ok(exhibitService.update());
	}
	
}
