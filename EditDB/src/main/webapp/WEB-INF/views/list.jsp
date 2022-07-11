<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<h4>테이블 추가하기</h4><br>
동적 자료형(varchar, number등)의 경우 크기를 수정하여 사용하세요.
<c:if test="${ database eq 'Oracle' }">
<input type="text" class="form-control" value="ALTER TABLE ${fn:toUpperCase(tablename)} ADD ${fn:toUpperCase(columnname)} ${ datatype }"><br>
<input type="checkbox">완료<br><br>

<c:if test="${ constraint eq 'PRIMARY KEY' }">
<h4>제약조건 추가하기</h4>

<textarea style="resize: none;" class="form-control" rows="3">
ALTER TABLE ${fn:toUpperCase(tablename)} 
ADD CONSTRAINT PK_${fn:toUpperCase(tablename)}_${fn:toUpperCase(columnname)} ${constraint}(${fn:toUpperCase(columnname)});
</textarea><br>
<input type="checkbox">완료
</c:if>
<c:if test="${ constraint eq 'FOREIGN KEY' }">
<h4>제약조건 추가하기</h4>

<textarea style="resize: none;" class="form-control" rows="3">
ALTER TABLE ${fn:toUpperCase(tablename)} 
ADD CONSTRAINT FK_${fn:toUpperCase(tablename)}_${fn:toUpperCase(columnname)} ${constraint}(${fn:toUpperCase(columnname)});
</textarea><br>
<input type="checkbox">완료
</c:if>
</c:if>
<c:if test="${ database eq 'MySQL' }">
<input type="text" class="form-control" value="ALTER TABLE ${fn:toUpperCase(tablename)} ADD COLUMN ${fn:toUpperCase(columnname)} ${ datatype };"><br>
<c:if test="${ constraint eq 'PRIMARY KEY' }">
<h4>제약조건 추가하기</h4>
<textarea style="resize: none;" class="form-control" rows="3">
ALTER TABLE ${fn:toUpperCase(tablename)} 
ADD CONSTRAINT PK_${fn:toUpperCase(tablename)}_${fn:toUpperCase(columnname)} ${constraint}(${fn:toUpperCase(columnname)});
</textarea><br>
<input type="checkbox">완료
</c:if>
<c:if test="${ constraint eq 'FOREIGN KEY' }">
<h4>제약조건 추가하기</h4>
<textarea style="resize: none;" class="form-control" rows="3">
ALTER TABLE ${fn:toUpperCase(tablename)} 
ADD CONSTRAINT FK_${fn:toUpperCase(tablename)}_${fn:toUpperCase(columnname)} ${constraint}(${fn:toUpperCase(columnname)});
</textarea><br>
<input type="checkbox">완료
</c:if>

</c:if>

<hr>
<h4>VO 추가하기</h4>
<input type="checkbox"> 생성자에 ${columnname} 추가했나요?<br>
<textarea style="resize: none;" class="form-control" rows="9">
	${ javaDatatype } ${fn:toLowerCase(columnname)};

	public ${javaDatatype} get${columnname}(){ 
	return ${fn:toLowerCase(columnname)}; 
}
	public void set${columnname}(){
	this.${fn:toLowerCase(columnname)} = ${fn:toLowerCase(columnname)};
}
</textarea><br>
<input type="checkbox">완료
<hr>
<h4>MyBatis 매퍼 추가하기</h4>
<input type="checkbox"> INSERT 쿼리에 ${fn:toUpperCase(columnname)} 추가했나요?
<h4>클라이언트</h4>
<input type="checkbox"> 객체명이 일치하나요?
<br>
<br>
<br>

<h4>
여기까지 전부 해내셨다면...<br>
축하합니다! 프로젝트에 컬럼이 추가되었습니다. <br>
성공적인 프로젝트를 기원합니다.
</h4>

<br>
<br>
<br>
</body>
</html>