<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UploadFor.jsp</title>
</head>
<body>
	<fieldset>
		<legend>파일 업로드 폼<span style="color: red; font-size: 1.8em; font-weight: bold;">${error}</span>
		</legend>
		<a href="FileList.jsp">[파일목록으로 가기]</a>
		<!-- 파일전송 post방식인 이유:get(요청헤더에 포함)/요청헤더는 크기 제한 있음 -->
		<form method="post" enctype="multipart/form-data"
			action="UploadComplete.jsp">
			<table cellspacing="1" bgcolor="gray">
				<tr bgcolor="white">
					<td>올린이</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr bgcolor="white">
					<td>제목</td>
					<td><input type="text" name="title" /></td>
				</tr>
				<tr bgcolor="white">
					<td>관심사항</td>
					<td><input type="checkbox" name="inter" value="정치" />정치 <input
						type="checkbox" name="inter" value="경제" />경제 <input
						type="checkbox" name="inter" value="스포츠" />스포츠</td>
				</tr>
				<tr bgcolor="white">
					<td>첨부파일1</td>
					<td><input type="file" name="attachedFile1" /></td>
				</tr>
				<tr bgcolor="white">
					<td>첨부파일2</td>
					<td><input type="file" name="attachedFile2" /></td>
				</tr>
				<tr bgcolor="white" align="center">
					<td colspan="2"><input type="submit" value="파일업로드" /></td>
				</tr>
			</table>
		</form>
	</fieldset>
</body>
</html>