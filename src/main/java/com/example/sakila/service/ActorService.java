package com.example.sakila.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.mapper.ActorFileMapper;
import com.example.sakila.mapper.ActorMapper;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;

@Service
@Transactional
public class ActorService {
	@Autowired ActorMapper actorMapper;
	@Autowired ActorFileMapper actorFileMapper;
	
	public int getListPage(int rowPerPage) {
		int count = actorMapper.selectActorCount();
		int lastPage = count / rowPerPage;
		if(lastPage % rowPerPage != 0) {
			lastPage++;
		}
		return lastPage;
	}
	
	public void addActor(ActorForm actorForm, String path) {
		 Actor actor = new Actor();
		 actor.setFirstName(actorForm.getFirstName());
		 actor.setLastName(actorForm.getLastName());
		 
		 int row = actorMapper.insertActor(actor); // actorId = 0
		 // mybatis selectkey값
		 int actorId = actor.getActorId(); // actorId = 1
		 
		 if(row == 1 && actorForm.getActorFile() !=null) {
			 // 파일 입력, actorFile 입력
			 List<MultipartFile> list = actorForm.getActorFile();
			 for(MultipartFile mf : list) {
				 ActorFile actorFile = new ActorFile();
				 actorFile.setActorId(actorId);
				 actorFile.setType(mf.getContentType());
				 actorFile.setSize(mf.getSize());
				 String filename = UUID.randomUUID().toString().replace("-", "");
				 actorFile.setFilename(UUID.randomUUID().toString().replace("-", ""));
				 int dotIdx = mf.getOriginalFilename().lastIndexOf(".");
				 String originname = mf.getOriginalFilename().substring(0, dotIdx);
				 String ext = mf.getOriginalFilename().substring(dotIdx + 1);
				 actorFile.setOriginname(originname);
				 actorFile.setExt(ext);
				 
				 int row2 = actorFileMapper.insertActorFile(actorFile);
				 if(row2 == 1) {
					 // 물리적 파일 저장
					 try {
						mf.transferTo(new File("path" + filename + "." + ext));
					} catch (Exception e) {
						// 예외 발생하고 예외처리 하지않아야지 @Transactional 작동한다 
						// RuntimeException을 인위적으로 발생
						e.printStackTrace();
						throw new RuntimeException();
					} // 예외 처리
				 }
			 }
		 }
	}
}
