package com.example.sakila.service;

import java.io.File;
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
public class ActorFileService {
	@Autowired ActorFileMapper actorFileMapper;
	
	// /on/removeActorFile
	// 1) actor_file 삭제 2) 물리 파일 삭제(이름 필요, 경로 PATH 필요)
	public void removeActorFile(int actorFileId, String path) {
		// 1) 파일 이름 select
		ActorFile actorFile = actorFileMapper.selectActorFileOne(actorFileId);
		int row = actorFileMapper.deleteActorFile(actorFileId);
		if(row == 1) { // actorFile정보를 삭제했다면 물리적 파일도 삭제
			String fullname = path + actorFile.getFilename() + "." + actorFile.getExt(); // 삭제할 파일의 경로까지 합친 파일 풀네임
			File f = new File(fullname); 
			f.delete();
		}
	}
	
	// /on/addActorFile (파일 추가)
	public void addActorFile(ActorForm actorForm, String path) {
		if(actorForm.getActorFile() != null) {
			 // 파일 입력, ActorFile 입력
			 List<MultipartFile> list = actorForm.getActorFile();
			 for(MultipartFile mf : list) {
				 ActorFile actorFile = new ActorFile();
				 
				 actorFile.setActorId(actorForm.getActorId());
				 actorFile.setType(mf.getContentType());
				 actorFile.setSize(mf.getSize());
				 String filename = UUID.randomUUID().toString().replace("-", "");
				 actorFile.setFilename(filename);
				 int dotIdx = mf.getOriginalFilename().lastIndexOf(".");
				 String originname = mf.getOriginalFilename().substring(0, dotIdx);
				 String ext = mf.getOriginalFilename().substring(dotIdx+1);
				 actorFile.setOriginname(originname);
				 actorFile.setExt(ext);
				 
				 int row2 = actorFileMapper.insertActorFile(actorFile);
				 if(row2 == 1) {
					 // 물리적 파일 저장
					 try {
						mf.transferTo(new File(path + filename +"."+ ext));
					 } catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						// 예외 발생하고 예외처리 하지 않아야지 @Transactional 작동한다
						// so... RuntimeException을 인위적으로 발생
						throw new RuntimeException();
					 }	 
				 }
			 }
		 }
	}
	
	// /on/actorOne (파일 리스트)
	public List<ActorFile> getActorFileListByActor(int actorId) {
		return actorFileMapper.selectActorFileListByActor(actorId);
	}
}