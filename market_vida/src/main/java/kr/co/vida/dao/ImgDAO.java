package kr.co.vida.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.vida.dto.ImgDTO;
import kr.co.vida.dto.StartEnd;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ImgDAO implements Dao<ImgDTO> {
	
	@Autowired
	private SqlSession ss;
	
	public List<ImgDTO> readAll(int StartNo, int endNo){
		StartEnd se = new StartEnd(StartNo, endNo);
		return ss.selectList("kr.co.vida.img.readAll", se);
	}

	public List<ImgDTO> getListBySubCode(int no) {
		//log.info("list====>"+ss.selectList("kr.co.vida.img.getMainImgBySubCode", no));
		return ss.selectList("kr.co.vida.img.getMainImgBySubCode", no);
	}
	
	public List<ImgDTO> getListAll(int no) {
		return ss.selectList("kr.co.vida.img.getMainImg", no);
	}
	
	public List<ImgDTO> getAllImgbyGoods(int no){
		return ss.selectList("kr.co.vida.img.getGoodsImgs", no);
	}
	
	@Override
	public List<ImgDTO> getListAll() {
		return null;
	}

	@Override
	public ImgDTO getOne(int no) {
		return ss.selectOne("kr.co.vida.img.getMainImgOne" , no);
	}

	@Override
	public void addOne(ImgDTO dto) {
		ss.insert("kr.co.vida.img.insertImgOne" , dto);
	}

	@Override
	public void modifyOne(ImgDTO dto) {
		
	}

	@Override
	public void deleteOne(int no) {
		ss.delete("kr.co.vida.img.deleteOne", no);
		
	}





}