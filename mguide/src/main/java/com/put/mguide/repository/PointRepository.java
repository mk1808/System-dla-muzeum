package com.put.mguide.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.put.mguide.model.Point;

@Repository
public interface PointRepository extends JpaRepository<Point, Long>{
	

}
