package com.spring.admin;

import java.util.Date;
import lombok.Data;

@Data
public class ChartModel {
	
	private Date dayNo;
	private String item;
	private int item_C;
	
	@Override
	public String toString() {
		return "AdminChartDto [number=" +dayNo+ ", item=" +item+ ", value=" +item_C+ "]";
	}

}
