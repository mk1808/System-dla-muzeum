package com.put.mguide.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.put.mguide.model.AppUser;
import com.put.mguide.other.Login;

@Repository
public interface AppUserRepository extends JpaRepository<AppUser, Long>
{

	AppUser getByMail(String mail);

}
