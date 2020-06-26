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
import model.Reply;

public interface ReplyMapper {
	@Select("select ifnull(max(replyno),0) from reply where btype=#{btype} and boardno=#{boardno}")
	int maxnum(Reply reply);
	
	@Insert("insert into reply "
			+ "(btype, boardno, replyno, id, comment, replydate) "
			+ "values (#{btype},#{boardno},#{replyno},#{id},#{comment},now())")
	void insert(Reply reply);
	
	@Select("select count(*) from reply where btype=#{btype} and boardno=#{boardno}")
	int replyCount(@Param("btype") int btype, @Param("boardno") int boardno);
	
	@Select({"<script>"
			+ "select * from reply "
			+ "<choose> "
			+ "<when test='boardno!=null'>where boardno = #{boardno} </when>"
			+ "<otherwise>where btype=#{btype} and boardno=#{boardno} order by boardno desc </otherwise> "
			+ "</choose>"
			+ "</script>"})
	List<Reply> select(Map<String, Object> map);
	
	@Delete("DELETE FROM reply WHERE boardno=#{boardno} and replyno=#{replyno}")
	int delete(@Param("boardno") int boardno, @Param("replyno") int replyno);
}
