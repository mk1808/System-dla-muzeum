package com.put.mguide.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.put.mguide.model.Room;

@Repository
public interface RoomRepository extends JpaRepository<Room, Long>{

}
