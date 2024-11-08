package com.example.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorFile;

@Mapper
public interface ActorFileMapper {
	// /on/removeActorFile : Service
	ActorFile selectActorFileOne(int actorFileId);
	
	// /on/removeActorFile
	// 이미지파일 개별 삭제
	int deleteActorFile(int actorFileId);
	
	// actorOne
	List<ActorFile> selectActorFileListByActor(int actorId);
	
	int insertActorFile(ActorFile actorFile);
}
