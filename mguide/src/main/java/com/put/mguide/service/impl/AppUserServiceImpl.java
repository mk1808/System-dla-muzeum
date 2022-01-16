package com.put.mguide.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.put.mguide.model.AppUser;
import com.put.mguide.other.Login;
import com.put.mguide.repository.AppUserRepository;
import com.put.mguide.service.AppUserService;
import com.put.mguide.service.RoomService;

public class AppUserServiceImpl implements AppUserService{

	private final AppUserRepository appUserRepository;
	
	@Autowired
	public AppUserServiceImpl(AppUserRepository appUserRepository) {
		super();
		this.appUserRepository = appUserRepository;
	}
	
	public AppUser login(Login login) {
		// TODO Auto-generated method stub
		return null;
	}

	public AppUser register(AppUser user) {
		// TODO Auto-generated method stub
		return null;
	}

}
