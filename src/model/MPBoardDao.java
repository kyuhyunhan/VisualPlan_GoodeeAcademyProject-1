package model;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.MPBoardMapper;

public class MPBoardDao {
	private Class<MPBoardMapper> cls = MPBoardMapper.class;
	private Map<String, Object> map = new HashMap<>();
	
	public int maxnum(MPBoard mpboard) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxnum(mpboard);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	public boolean insert(MPBoard mpboard) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).insert(mpboard);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}
	public List<MPBoard> list(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("id",id);
			List<MPBoard> list = session.getMapper(cls).list(map);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
}