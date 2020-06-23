package model;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.BoardMapper;
import model.mapper.StageMapper;

public class StageDao {
	private Class<StageMapper> cls = StageMapper.class;
	private Map<String, Object> map = new HashMap<>();
	
	public int maxnum(Stage stage) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxnum(stage);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	public boolean insert(Stage stage) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).insert(stage);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}
}
