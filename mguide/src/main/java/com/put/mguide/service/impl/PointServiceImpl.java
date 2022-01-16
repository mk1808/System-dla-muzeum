package com.put.mguide.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.put.mguide.model.Exhibit;
import com.put.mguide.model.Point;
import com.put.mguide.model.Room;
import com.put.mguide.repository.ExhibitRepository;
import com.put.mguide.repository.PointRepository;
import com.put.mguide.service.PointService;

@Service
public class PointServiceImpl implements PointService{

	private final ExhibitRepository exhibitRepository;
	private final PointRepository pointRepository;
	
	@Autowired
	public PointServiceImpl(PointRepository pointRepository, ExhibitRepository exhibitRepository) {
		super();
		this.pointRepository = pointRepository;
		this.exhibitRepository=exhibitRepository;
	}
	
	public Point create(Point newPoint) {
		Exhibit exhibit = exhibitRepository.getById(newPoint.getExhibit().getId());
		newPoint.setExhibit(exhibit);
		return pointRepository.save(newPoint);
	}
	
	public Point update(Point newPoint) {
		Point old = pointRepository.getById(newPoint.getId());
		old.setX(newPoint.getX());
		old.setY(newPoint.getY());
		old.setZ(newPoint.getZ());
		
		Exhibit exhibit = exhibitRepository.getById(old.getExhibit().getId());
		old.setExhibit(exhibit);
		return pointRepository.save(old);
	}

	public List<Point> getAll() {
		return this.pointRepository.findAll();
	}

}
