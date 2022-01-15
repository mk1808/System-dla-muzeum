package com.put.mguide.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/exhibits")
public class ExhibitController {
	@GetMapping("/")
	ResponseEntity<String> getNewest(@RequestParam Long number) {

		return ResponseEntity.ok("");
	}
}
