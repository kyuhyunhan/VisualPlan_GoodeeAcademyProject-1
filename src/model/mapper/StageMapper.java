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

public interface StageMapper {

	@Select("select ifnull(max(stageno),0) from stage where id=#{id} and planno=#{planno}")
	int maxnum(Stage stage);
	
	@Insert("insert into stage "
			+ "(id, planno, stageno, stagetitle, percentage, memo, checked) "
			+ "values (#{id}, #{planno},#{stageno},#{stagetitle},#{percentage},#{memo},#{checked})")
	void insert(Stage stage);
	
	@Select("select * from stage where id=#{id} and planno=#{planno} order by planno asc")
	List<Stage> loaddetail(Map<String, Object> map);
}
