package com.put.mguide.other;

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
public class Message {
	
	public Message(String content){
		this.content=content;
	}
	private String content;
	private Long extraContent;

}
