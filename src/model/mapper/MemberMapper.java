package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Member;

public interface MemberMapper {
	@Insert("insert into member "
			+ "(id,password,name,email)"
			+ "values (#{id}, #{password}, #{name}, #{email})")
	int insert(Member mem);

	@Select({"<script>"
			+ "select * from member"
			+ "<if test='id!=null'> where binary id=#{id}</if>"
			+ "</script>"})
	List<Member> select(Map<String, Object> map);
	
	@Update("update member set name=#{name},email=#{email} where id=#{id}")
	int edit(Member m);
	
	@Update("update member set password=#{password} where id=#{id}")
	int editPw(@Param("id") String id, @Param("password") String password);
	
	@Delete("delete from member where id=#{id}")
	int delete(String id);
}