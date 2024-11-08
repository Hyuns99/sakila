package com.example.sakila.vo;

import java.util.List;

import lombok.Builder;
import lombok.Data;

@Data
// @Builder 자동으로 빌드를 만들어줌
public class FilmForm {
	private String title;
	private String description;
	private Integer releaseYear;
	private int languageId;
	private Integer originalLanguageId;
	private int rentalDuration;
	private double rentalRate;
	private Integer length;
	private double replacementCost;
	private String rating;
	private List<String> specialFeatures;
	// private String[] specialFeatures;
	
	// 빌드 패턴
//	public Film changeFilm() {
//		Film f = new Film();
//		f.setTitle(this.title);
//		return f;
//	}
	
}
