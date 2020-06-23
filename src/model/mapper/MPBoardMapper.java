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
	
	@Select("select * from plan where binary id=#{id}")
	List<MPBoard> list(Map<String,Object> map);
}
