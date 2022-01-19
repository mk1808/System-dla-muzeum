package com.put.mguide.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.put.mguide.model.File;

@Repository
public interface FileRepository extends JpaRepository<File, Long>{

}
