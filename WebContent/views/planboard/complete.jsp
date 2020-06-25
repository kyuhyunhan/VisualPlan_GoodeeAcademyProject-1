<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<fmt:requestEncoding value="UTF-8"/>
<sql:setDataSource var="conn" driver="org.mariadb.jdbc.Driver" url="jdbc:mariadb://localhost:3306/visualplan" user="scott" password="1234"/>
<sql:query var="rs" dataSource="${conn}">
	update stage set checked=1 where id=? and planno=? and stageno=?
	<sql:param>${sessionScope.login}</sql:param>
	<sql:param>${param.planno}</sql:param>
	<sql:param>${param.stageno}</sql:param>
</sql:query>