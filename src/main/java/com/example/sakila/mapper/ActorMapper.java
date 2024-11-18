package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Actor;

@Mapper
public interface ActorMapper {
	// filmOne에서 배우 검색할 때
	List<Actor> selectActorListByActor(String searchName);
	
	// 삭제
	int deleteActor(int actorId);
	
	// 수정
	int updateActor(Actor actor);
	
	// filmOne에서 배우리스트 출력
	List<Actor> selectActorListByFilm(int filmId);
	
	// actorOne
	Actor selectActorOne(int actorId); 
	
	// actorList
	List<Actor> selectActorList(Map<String, Object> map);
	int selectActorCount(); // 페이징
	
	int insertActor(Actor actor);
}
