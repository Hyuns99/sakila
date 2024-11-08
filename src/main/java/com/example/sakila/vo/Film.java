package com.example.sakila.vo;

import lombok.Data;

@Data
public class Film {
	private int filmId;
	private String title;
	private String description; // 기본값 null
	private Integer releaseYear; // 기본값 null
	private int languageId;
	private Integer originalLanguageId; // 기본값 null
	private int rentalDuration;
	private double rentalRate;
	private Integer length; // 기본값 null
	private double replacementCost;
	private String rating;
	private String specialFeatures; // 기본값 null
	private String lastUpdate;
}
