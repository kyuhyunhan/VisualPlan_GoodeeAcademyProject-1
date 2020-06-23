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

	@Select("select ifnull(max(stageno),0) from stage where planno=#{planno}")
	int maxnum(Stage stage);
	
	@Insert("insert into stage "
			+ "(planno, stageno, stagetitle, percentage, memo, checked) "
			+ "values (#{planno},#{stageno},#{stagetitle},#{percentage},#{memo},#{checked})")
	void insert(Stage stage);
}
