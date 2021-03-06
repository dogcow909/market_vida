package kr.co.vida.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.vida.dao.CrewPointsDAO;
import kr.co.vida.dto.CrewPointsDTO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("CrewPointService")
public class CrewPointsImple implements VidaService<CrewPointsDTO> {

	@Autowired
	CrewPointsDAO dao;

	@Override
	public List<CrewPointsDTO> selectAllList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CrewPointsDTO selectOne(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertOne(CrewPointsDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateOne(CrewPointsDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void dropOne(int no) {
		// TODO Auto-generated method stub
		
	}

	public List<CrewPointsDTO> selectAllList(int no , int startNo , int endNo ) {
		return dao.getListAll(no, startNo, endNo);
	}
	
	public int getTotal() {
		return dao.getTotal();
		
	}

}
