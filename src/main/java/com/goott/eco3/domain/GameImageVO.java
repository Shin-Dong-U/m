package com.goott.eco3.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GameImageVO {
	
	private Long game_level;
	private String level_name; 
	private String img_src;
	
}
