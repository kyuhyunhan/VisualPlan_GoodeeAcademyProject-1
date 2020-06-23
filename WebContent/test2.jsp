<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%

   String[] paramarr = request.getParameterValues("name");
   for(String s : paramarr) {
	   out.println(s);
   }
%>