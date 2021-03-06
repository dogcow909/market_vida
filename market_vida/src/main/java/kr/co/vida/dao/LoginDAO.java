package kr.co.vida.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.vida.dto.CrewDTO;

@Repository
public class LoginDAO implements LDao{

	@Autowired
	private SqlSession ss;

	public void setSs(SqlSession ss) {
		this.ss = ss;
	}

	@Override
	public int loginCheck(CrewDTO crdto) { 
		return ss.selectOne("kr.co.vida.crew.logincheck", crdto);
	}

	@Override
	public void register(CrewDTO crdto) {	
		ss.insert("kr.co.vida.crew.insertcrew",crdto);
	}

	@Override
	public String findId(CrewDTO crdto) {
		return ss.selectOne("kr.co.vida.crew.findid", crdto);
	}

	@Override
	public int idcheck(String crew_id) {
		return ss.selectOne("kr.co.vida.crew.idcheck",crew_id);
	}

	@Override
	public CrewDTO selectAll_id(String crew_id) {
		
		return ss.selectOne("kr.co.vida.crew.selectAll_id",crew_id);
	}

	@Override
	public String findname(String crew_id) {
		
		return ss.selectOne("kr.co.vida.crew.selectName",crew_id);
	}
	

}
