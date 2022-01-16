package com.put.mguide.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.put.mguide.model.Point;
import com.put.mguide.repository.PointRepository;
import com.put.mguide.service.PointService;

public class PointServiceImpl implements PointService{

	private final PointRepository pointRepository;
	
	@Autowired
	public PointServiceImpl(PointRepository pointRepository) {
		super();
		this.pointRepository = pointRepository;
	}
	
	public Point create(Point newPoint) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Point> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
