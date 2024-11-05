package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Actor;

@Mapper
public interface ActorMapper {
	int selectActorCount();
	
	int insertActor(Actor actor);
}
