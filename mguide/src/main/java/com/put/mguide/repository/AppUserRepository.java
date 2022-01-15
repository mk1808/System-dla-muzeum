package com.put.mguide.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.put.mguide.model.AppUser;

@Repository
public interface AppUserRepository extends JpaRepository<AppUser, Long>
{

}
