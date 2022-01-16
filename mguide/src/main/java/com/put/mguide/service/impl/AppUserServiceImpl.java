package com.put.mguide.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.put.mguide.model.AppUser;
import com.put.mguide.other.Login;
import com.put.mguide.repository.AppUserRepository;
import com.put.mguide.service.AppUserService;

@Service
public class AppUserServiceImpl implements AppUserService{

	private final AppUserRepository appUserRepository;
	
	@Autowired
	public AppUserServiceImpl(AppUserRepository appUserRepository) {
		super();
		this.appUserRepository = appUserRepository;
	}
	
	public AppUser login(Login login) {
		AppUser user = appUserRepository.getByMail(login.getMail());
		return user;
	}

	public AppUser register(AppUser user) {
		return appUserRepository.save(user);
	}

}
