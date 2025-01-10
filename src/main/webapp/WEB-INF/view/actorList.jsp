<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <!-- bootstrap CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

		<!-- bootstrap JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- jQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        
        <!-- excel api : sheetjs-->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.15.5/xlsx.full.min.js"></script>
		<!-- file download api : FileServer saveAs-->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
		
    </head>
    <body class="container">
        <h1>ACTOR LIST</h1>
        <input type="hidden" id="currentPage" value="${currentPage }">
        <div>
        	<button type="button" id="btnExcel">결과</button>
        </div>
        
        <table class="table">
        	<tr>
        		<td>id</td>
        		<td>firstName</td>
        		<td>lastName</td>
        		<td>lastUpdate</td>
        	</tr>
        	<c:forEach var="a" items="${list }">
        		<tr>
        			<td>${a.actorId }</td>
        			<td>${a.firstName }</td>
        			<td>${a.lastName }</td>
        			<td>${a.lastUpdate }</td>
        		</tr>
        	</c:forEach>
        </table>
        
		<script type="text/javascript">
			//ajax 반환값 -> 엑셀객체()
			let table = []; // 엑셀 객체에 사용할 데이터
			
			$('#btnExcel').click(function(){
				$.ajax({
					async : false
					, url:'/rest/actorList/'+$('#currentPage').val()
					, type: 'get'
				}).done(function(result){
					console.log(result);
					$(result).each(function(index, item){
						let row = []; // 엑셀객체의 행에 사용할 데이터
						row.push(item.actorId);
						row.push(item.firstName);
						row.push(item.lastName);
						row.push(item.lastUpdate);
						
						// 엑셀객체 사용할 데이터
						table.push(row);
					});
				}).fail(function(result){
					alert('실패!');
				});
				
				// 엑셀객체에 사용할 데이터를 생성(ajax result -> 데이터로 사용)
				console.log(table)
				
				// 1) 엑셀 객체 생성
				let book = XLSX.utils.book_new(); // 엑셀객체 생성자 호출
				
				// 2) 엑셀객체에 빈 시트 생성
				book.SheetNames.push('one');
				
				// 3) 2)의 빈 시트에 엑셀객체 데이터에 시트객체 생성 후 book에 대입
				book.Sheets['one'] = XLSX.utils.aoa_to_sheet(table);
				
				// book객체를 엑셀파일로 변경 application/xlsx
				let bin = XLSX.write(book, {bookType: 'xlsx', type: 'binary'});
				
				// bin의 크기의 buffer(스트림)생성
				let buf = new ArrayBuffer(bin.length);
				let buf2 = new Uint8Array(buf);
				
				for(let i = 0; i < bin.length; i++) {
					buf2[i] = bin.charCodeAt(i) & 0xFF;
				}
				
				let f = new Blob([buf2], {type: 'application/octe-stream'}); // buf2를 이용하여 엑셀파일을 만드는 생성자
				saveAs(f, 'actor.xlsx');
			});
			
			
			
		</script>
    </body>
</html>