<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pichill.post.model.*"%>

<html>
<head>
<title>IBM Post: Home</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>IBM Post: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Post: Home</p>

<h3>��Ƭd��:</h3>
	
<%-- ���~���C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='listAllPost.jsp'>List</a> all Posts.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="post.do" >
        <b>��J�峹���D:</b>
        <input type="text" name="postTitle" >
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="post" scope="page" class="com.pichill.post.service.PostServiceImpl" />
   
  <li>
     <FORM METHOD="post" ACTION="post.do" >
       <b>��ܰQ�שδ��Ϊ�:</b>
       <select size="1" name="postType">
         <c:forEach var="post" items="${postSvc.all}" > 
          <option value="${post.postType}">${post.postType}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
<!--   <li> -->
<!--      <FORM METHOD="post" ACTION="emp.do" > -->
<!--        <b>��ܭ��u�m�W:</b> -->
<!--        <select size="1" name="empno"> -->
<%--          <c:forEach var="empVO" items="${empSvc.all}" >  --%>
<%--           <option value="${empVO.empno}">${empVO.ename} --%>
<%--          </c:forEach>    --%>
<!--        </select> -->
<!--        <input type="hidden" name="action" value="getOne_For_Display"> -->
<!--        <input type="submit" value="�e�X"> -->
<!--      </FORM> -->
<!--   </li> -->
<!-- </ul> -->


<h3>�峹�޲z</h3>

<ul>
  <li><a href='addPost.jsp'>Add</a> a new Post.</li>
</ul>

</body>
</html>