package com.put.mguide.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.put.mguide.model.Exhibit;

@Repository
public interface ExhibitRepository extends JpaRepository<Exhibit, Long>{
	List<Exhibit> getByName(String name);
	List<Exhibit> getByNameContaining(String name);
	List<Exhibit> getByNumber(String number);
	List<Exhibit> getByNumberAndNameContaining(String number, String name);
	
	
	List<Exhibit> getByNameAndConnected(String name, Boolean connected);

}
