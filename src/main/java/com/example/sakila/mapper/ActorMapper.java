package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Actor;

@Mapper
public interface ActorMapper {
	// actorOne
	Actor selectActorOne(int actorId); 
	
	// actorList
	List<Actor> selectActorList(Map<String, Object> map);
	int selectActorCount(); // 페이징
	
	int insertActor(Actor actor);
}
