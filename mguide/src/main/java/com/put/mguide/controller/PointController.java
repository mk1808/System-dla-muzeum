package com.put.mguide.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.put.mguide.model.Point;
import com.put.mguide.service.AppUserService;
import com.put.mguide.service.PointService;

@RestController
@RequestMapping("/api/points")
public class PointController {
	private final PointService pointService;
	
	@Autowired
	public PointController(PointService pointService) {
		super();
		this.pointService = pointService;
	}

	@PostMapping()
	ResponseEntity<Point> createPoint(@RequestParam Point point) {
		return ResponseEntity.ok(pointService.create(point));
	}
	
	@GetMapping()
	ResponseEntity<List<Point>> getPoints() {
		return ResponseEntity.ok(pointService.getAll());
	}
}
