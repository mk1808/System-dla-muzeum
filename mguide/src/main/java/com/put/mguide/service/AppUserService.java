package com.put.mguide.service;

import org.springframework.stereotype.Service;

import com.put.mguide.model.AppUser;
import com.put.mguide.other.Login;

@Service
public interface AppUserService {
	AppUser login(Login login);
	AppUser register(AppUser user);

}
