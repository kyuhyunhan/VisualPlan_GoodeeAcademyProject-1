package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
	public List<Stage> loaddetail(String id, int planno){
		SqlSession session = MyBatisConnection.getConnection();
		List<Stage> stagelist = new ArrayList<Stage>();
		try {
			map.clear();
			map.put("id", id);
			map.put("planno",planno);
			return session.getMapper(cls).loaddetail(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	public boolean delete(String id, int planno) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			int cnt = session.getMapper(cls).delete(id, planno);
			if(cnt > 0)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}
	public boolean edit(Stage stage) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).edit(stage);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}
}
