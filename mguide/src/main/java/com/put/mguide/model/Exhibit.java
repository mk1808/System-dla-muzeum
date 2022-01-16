package com.put.mguide.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity

public class Exhibit {
	@Id
	@GeneratedValue
	private Long id;
	
	private String number;
	private String name;
	private String description;
	@ManyToOne(fetch = FetchType.LAZY)
	private Room room;
	private String photo;
}