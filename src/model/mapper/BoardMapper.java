package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;
import model.Member;

public interface BoardMapper {

	@Select("select ifnull(max(boardno),0) from board where btype=#{btype}")
	int maxnum(Board board);
	
	@Insert("insert into board "
			+ "(btype, boardno, id, title, boarddate, content, readcnt) "
			+ "values (#{btype},#{boardno},#{id},#{title},now(),#{content},0)")
	void insert(Board board);
	
	@Select("select count(*) from board where btype=#{btype}")
	int boardCount(@Param("btype") int btype);

	@Select({"<script>"
			+ "select * from board "
			+ "<choose> "
			+ "<when test='boardno!=null'>where boardno = #{boardno} </when>"
			+ "<otherwise>where btype=#{btype} order by boardno desc limit #{start}, #{limit} </otherwise> "
			+ "</choose>"
			+ "</script>"})
	List<Board> select(Map<String, Object> map);
	
	@Select("select * from board where btype=#{btype} and boardno=#{boardno}")
	List<Board> selectOne(Map<String, Object> map);
	
	@Update("update board set readcnt=readcnt+1 where boardno=#{value}")
	void readcntAdd(int boardno);
	
	@Update("update board set id=#{id}, title=#{title}, content=#{content} where boardno=#{boardno}")
	void edit(Board b);
	
	@Delete("DELETE FROM board WHERE boardno=#{value}")
	int delete(int boardno);
}


