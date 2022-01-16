package com.put.mguide.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.put.mguide.model.Point;

@Service
public interface PointService {

	Point create(Point newPoint);
	List<Point> getAll();
}
