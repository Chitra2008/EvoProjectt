<%@page import="com.mastek.demo.dao.EmpDao"%>
<jsp:useBean id="u" class="com.mastek.demo.model.Employee"></jsp:useBean>
<jsp:setProperty property="*" name="u" />

<%
int i=EmpDao.save(u);  
if(i>0){  
	out.println("record entered");
	response.sendRedirect("EmpDash.jsp");
}else{  
response.sendRedirect("addrequest-error.jsp");  
}
%>
