package com.spring.admin;

import lombok.Data;

@Data
public class ChartModel {
	
	private String key;
	private String item;
	private int value;
	
	@Override
	public String toString() {
		return "[key"+key+", value="+value+"]";
	}
}
