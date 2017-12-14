package com.spring.admin;

import java.text.SimpleDateFormat;
import java.util.Date;
import lombok.Data;

@Data
public class ChartModel {
	
	private String dayNo;
	private String item;
	private int item_C;
	
	@Override
	public String toString() {
		return "["+dayNo+","+item+","+item_C+"]";
	}

}
