package com.example.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Language;


@Mapper
public interface LanguageMapper {
	// on/addlanguage
	int insertLanguage(Language language);
	
	// on/languageList
	List<Language> selectLanguageList();
}
