package com.example.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.FilmActorMapper;
import com.example.sakila.mapper.FilmCategoryMapper;
import com.example.sakila.mapper.FilmMapper;
import com.example.sakila.vo.Film;
import com.example.sakila.vo.FilmForm;

@Service
@Transactional
public class FilmService {
	@Autowired FilmMapper filmMapper;
	@Autowired FilmActorMapper filmActorMapper;
	@Autowired FilmCategoryMapper filmCategoryMapper;
	
	public Integer updateFilmByKey(Film film) {
		return filmMapper.updateFilm(film);
	}
	
	public void removeFilmByKey(Integer filmId) {
		// film_category, film_actor, film 삭제 하나라도 실패하면 안됨
		// film_category 삭제
		filmCategoryMapper.deleteFilmCategoryByFilm(filmId);
		// film_actor 삭제
		filmActorMapper.deleteFilmActorByFilm(filmId);
		
		// film 삭제
		filmMapper.deleteFilmByKey(filmId);
		
	}
	
	public int getFilmListByLastPage(Integer categoryId, int rowPerPage) {
		int count = filmMapper.selectFilmCount();
		int lastPage = count / rowPerPage;
		if(lastPage % rowPerPage != 0) {
			lastPage++;
		}
		return lastPage;
	}
	
	public List<Map<String, Object>> getFilmList(Integer categoryId, int currentPage, int rowPerPage) {
		Map<String, Object> paramMap = new HashMap<>();
		if(categoryId == null || categoryId == 0) {
			paramMap.put("categoryId", null);
		} else {
			paramMap.put("categoryId", categoryId);
		}
		int beginRow = (currentPage - 1) * rowPerPage;
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		if(paramMap.get("categoryId") == null) {
			return filmMapper.selectFilmList(paramMap);
		} else {
			return filmMapper.selectFilmListByCategory(paramMap);
		}
	}

	public List<Film> getFilmListByTitle(String searchWord) {
		return filmMapper.selectFilmListByTitle(searchWord);
	}
	
	public int addFilm(FilmForm filmForm) {
		Film film = new Film();
		// FilmForm -> Film
		
		film.setTitle(filmForm.getTitle());
		// film.setDescription(filmForm.getDescription().equals("") ? null : filmForm.getDescription());
		if(filmForm.getDescription().equals("")) {
			 film.setDescription(null);
		} else {
			film.setDescription(filmForm.getDescription());
		}
		
		// filmForm에 있던 데이터베이스를 film에 저장
		film.setReleaseYear(filmForm.getReleaseYear());
		film.setLanguageId(filmForm.getLanguageId());
		film.setOriginalLanguageId(filmForm.getOriginalLanguageId());
		film.setRentalDuration(filmForm.getRentalDuration());
		film.setRentalRate(filmForm.getRentalRate());
		film.setLength(filmForm.getLength());
		film.setReplacementCost(filmForm.getReplacementCost());
		film.setRating(filmForm.getRating());
		
		if(filmForm.getSpecialFeatures() == null) {
			film.setSpecialFeatures(null);
		} else {
			// specialFeatures 배열 -> ,문자열
			String specialFeatures = filmForm.getSpecialFeatures().get(0);
			
			for(int i=1; i < filmForm.getSpecialFeatures().size(); i++) {
				specialFeatures += "," + filmForm.getSpecialFeatures().get(i);
			}
			
			film.setSpecialFeatures(specialFeatures);
		}
		
		return filmMapper.insertFilm(film);
	}
	
	public Map<String, Object> getFilmOne(int filmId) {
		return filmMapper.selectFilmOne(filmId);
	}
	
	//on/actor
	public List<Film> getFilmTitleListByActor(int actorId) {
		return filmMapper.selectFilmTitleListByActor(actorId);
	}
}
