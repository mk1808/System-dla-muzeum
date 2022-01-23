package com.put.mguide.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Exhibit{
	

	@Id
	@GeneratedValue
	private Long id;
	
	private String number;
	private String name;
	@Column(length = 1000000)
	private String description;
	@ManyToOne(fetch = FetchType.LAZY)
	private Room room;
	private String photo;
	@Column(columnDefinition="boolean default false")
	private Boolean connected = false;
	private String link;
}