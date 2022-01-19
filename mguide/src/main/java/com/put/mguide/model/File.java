package com.put.mguide.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;

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
public class File {
	public File(String name, String type, byte[] data) {
		this.name = name;
		this.type = type;
		this.data = data;
	}

	@Id
	@GeneratedValue
	private Long id;

	private String name;

	private String type;

	@Lob
	private byte[] data;

	

}
