package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.MPBoard;
import model.Stage;
import model.ToDo;

public interface MPBoardMapper {
	@Select("select * from plan where binary id=#{id}")
	List<MPBoard> list(Map<String,Object> map);
}
