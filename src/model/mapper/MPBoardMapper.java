package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;
import model.MPBoard;
import model.Stage;

public interface MPBoardMapper {
	
	@Select("select ifnull(max(planno),0) from plan where id=#{id}")
	int maxnum(MPBoard mpboard);
	
	@Insert("insert into plan "
			+ "(planno, id, title, detail) "
			+ "values (#{planno},#{id},#{title},#{detail})")
	void insert(MPBoard mpboard);
	
	@Select("select * from plan p, (SELECT id, planno, MAX(percentage) as percentage FROM stage WHERE id=#{id} AND checked=1  GROUP BY id, planno) a "
			+ "WHERE p.id=a.id AND p.planno = a.planno AND p.id=#{id}")
	List<MPBoard> list(Map<String,Object> map);
	
	@Select("select * from plan p, (SELECT id, planno, MAX(percentage) as percentage FROM stage WHERE id=#{id} and checked=1  GROUP BY id, planno) a" 
			+ "WHERE p.id=a.id AND p.planno = a.planno AND p.id=#{id} AND planno=#{planno}")
	List<MPBoard> loaddetail(Map<String,Object> map);
}
