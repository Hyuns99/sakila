package com.example.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorFile;

@Mapper
public interface ActorFileMapper {
	
	// actorOne
	List<ActorFile> selectActorFileListByActor(int actorId);
	
	int insertActorFile(ActorFile actorFile);
}
