package com.put.mguide.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.put.mguide.model.Exhibit;

@Repository
public interface ExhibitRepository extends JpaRepository<Exhibit, Long>{

}
