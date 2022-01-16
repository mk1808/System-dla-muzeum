package com.put.mguide.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.put.mguide.model.AppUser;
import com.put.mguide.other.Login;
import com.put.mguide.service.AppUserService;

@RestController
@RequestMapping("/api/users")
public class AppUserController {
	private final AppUserService appUserService;
	
	@Autowired
	public AppUserController(AppUserService appUserService) {
		super();
		this.appUserService = appUserService;
	}

	@PostMapping("/login")
	ResponseEntity<AppUser> login(@RequestBody Login login) {
		return ResponseEntity.ok(appUserService.login(login));
	}
	
	@PostMapping("/register")
	ResponseEntity<AppUser> register(@RequestBody AppUser user) {
		return ResponseEntity.ok(appUserService.register(user));
	}

}