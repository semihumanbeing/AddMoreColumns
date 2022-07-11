<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database TODO LIST</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
#inputs{
	margin-left: 10px;
	margin-top: 20px;
}
#disp{
	margin-left: 10px;
	margin-top: 20px;
	width: 800px;
}
</style>

<script type="text/javascript">
function send(f){
	
	var tablename = f.tablename.value.trim();
	var columnname = f.columnname.value.trim();
	var datatype = f.datatype.value;
	var database = f.database.value;
	var constraint = f.constraint.value;
	
	if(tablename == ''){
		alert("테이블명을 입력하세요");
		f.tablename.value = '';
		f.tablename.focus();
		return;
	}
	
	if(columnname == ''){
		alert("컬럼명을 입력하세요");
		f.columnname.value = '';
		f.columnname.focus();
		return;
	}
	
	$.ajax({
		type : "GET",
		url : "todolist.do",
		data : {
			'tablename' : tablename,
			'columnname' : columnname,
			'datatype' : datatype,
			'database' : database,
			'constraint' : constraint
		},
		success : function(resData){
			$("#disp").html(resData);
		},
		error : function(err){
			alert(err.responseText);
		}
	
	});
}
</script>

</head>
<body>
<div id="inputs">
<h1>
	프로젝트를 만드는 중인데<br>
	데이터베이스에 컬럼을 추가해야해!!!
</h1>
<h4>이 웹사이트는 Java, MyBatis에 최적화 되어있습니다.</h4>
<form>
추가할 테이블과 컬럼명<br>
<input type="text" name="tablename" placeholder="테이블명"><br>
<input type="text" name="columnname" placeholder="컬럼명"><br>
<label for="datatype">추가할 컬럼의 자료형을 고르세요</label>
  <select name="datatype" id="datatype">
    <option value="INT">INT</option>
    <option value="NUMBER">NUMBER</option>
    <option value="VARCHAR">VARCHAR</option>
    <option value="CLOB">CLOB</option>
    <option value="DATE">DATE</option>
  </select><br>
<label for="database">내가 사용하는 데이터베이스는?</label>
  <select name="database" id="database">
    <option value="Oracle">Oracle</option>
    <option value="MySQL">MySQL</option>
  </select>
<label for="constraint">제약조건</label>
  <select name="constraint" id="constraint">
    <option value="">없음</option>
    <option value="PRIMARY KEY">PRIMARY KEY</option>
    <option value="FOREIGN KEY">FOREIGN KEY</option>
  </select>
<br><br>
<input class="btn" type="button" value="추가하기" onclick="send(this.form)">
</form>
</div>
<div id="disp">

</div>
</body>
</html>