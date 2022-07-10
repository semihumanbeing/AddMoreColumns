<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<h4>테이블 추가하기</h4>
<input type="text" class="form-control" value="ALTER TABLE ${ tablename } ADD ${ columnname } ${ datatype }"><br>
<hr>
<h4>VO 추가하기</h4>
<input type="checkbox"> 생성자에 ${columnname} 추가했나요?
<textarea class="form-control" rows="10">
	${ javaDatatype } ${columnname};

	public ${javaDatatype} get${columnname}(){ 
	return ${columnname}; 
}
	public void set${columnname}(){
	this.${columnname} = ${columnname};
}
</textarea>
<h4>DAO 추가하기</h4>

<h4>MyBatis 매퍼 추가하기</h4>
<input type="checkbox"> DML 명령에 ${columnname} 추가했나요?
<h4></h4>
<h4></h4>
 
</body>
</html>