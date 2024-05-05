<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

안녕하세요
<div class="review-table">
				<table class="table">
	  				<thead class="thead-light">
					    <tr>
					      <th>NO.</th>
					      <th>후기내용</th>
					      <th>작성자</th>
					      <th>작성시간</th>
					      <th>조회수</th>
					    </tr>
				  	</thead>
				  	<tbody>
				  	<c:forEach items="${postList}" var="review">
					    <tr>
					      <td>${post.id}</td>				
					      <td>${post.userId}</td>
					    </tr>
					 </c:forEach>
				 	 </tbody>
				</table>
			</div>
{$post.userId}


</body>
</html>