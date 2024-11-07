package com.example.sakila.vo;

import lombok.Data;

@Data
public class Film {
	private int filmId;
	private String title;
	private String description;
	private int releaseYear;
	private int languageId;
	private int originalLanguageId;
	private int rentalDuration;
	private Double rentalRate;
	private int length;
	private Double replacementCost;
	private String rating;
	private String specialFeatures;
	private String lastUpdate;
}
