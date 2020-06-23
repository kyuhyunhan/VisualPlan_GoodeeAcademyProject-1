package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.BoardMapper;
import model.mapper.ReplyMapper;

public class ReplyDao {
	private Class<ReplyMapper> cls = ReplyMapper.class;
	private Map<String, Object> map = new HashMap<>();
	
	public int maxnum(Reply reply) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).maxnum(reply);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	public boolean insert(Reply reply) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).insert(reply);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return false;
	}
	public int replyCount(int btype, int boardno) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).replyCount(btype, boardno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	public List<Reply> replylist(int btype, int boardno) {
		SqlSession session = MyBatisConnection.getConnection();
		List<Reply> replylist = new ArrayList<Reply>();	//순서가 유지되기 때문에 index로 조회 가능.
		try { 
			map.clear();
			map.put("btype",btype);
			map.put("boardno",boardno);
			return session.getMapper(cls).select(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
}
