<%@page import="com.mastek.demo.dao.EmpDao"%>
<jsp:useBean id="e" class="com.mastek.demo.model.Employee"></jsp:useBean>
<jsp:setProperty property="*" name="e" />

<%
int i=EmpDao.saveDetails(e);
if(i>0){
response.sendRedirect("EmpDash.jsp");
return;
}else{
response.sendRedirect("loginPage.jsp");
}
%>/html>