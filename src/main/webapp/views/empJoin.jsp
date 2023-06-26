<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet"
	href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<link rel="stylesheet" href="dist/css/adminlte.min.css">
</head>
<body>
	<jsp:include page="GroupFit_gnb.jsp"></jsp:include>

	<div class="content-wrapper" style="margin-top: 57.08px">
		<h3>신규직원 인적 정보 작성</h3>
		<form action="empJoin.do" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<input type="file" name="emp_photo"/>
				</tr>
				<tr>
					<th>*사내번호</th>
					<td><input type="text" name="emp_no"/></td>
				</tr>
				<tr>
					<th>*비밀번호</th>
					<td><input type="password" name="pw"/></td>
				</tr>
				<tr>
					<th>*이름</th>
					<td><input type="text" name="name"/></td>
				</tr>
				<tr>
					<th>*성별</th>
					<td>
						<input type="radio" value="남" name="gender"/>남
						<input type="radio" value="여" name="gender"/>여
					</td>
				</tr>
				<tr>
					<th>*생년월일</th>
					<td><input type="date" name="birth"/></td>
				</tr>
				<tr>
					<th>*연락처</th>
					<td><input type="text" name="phone"/></td>
				</tr>
				<tr>
					<th>*이메일</th>
					<td><input type="email" name="email"/></td>
				</tr>
				<tr>
					<th>*지점</th>
					<td>
						<select name="b_idx">
						    <option value="1">서초</option>
						    <option value="2">방배</option>
						    <option value="3">역삼</option>
						    <option value="4">논현</option>
						</select>			
					</td>
				</tr>
				<tr>
					<th>*직급</th>
					<td>
						<select name="position">
						    <option value="직원">직원</option>
						    <option value="지점장">지점장</option>
						    <option value="대표">대표</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>*계약기간</th>
					<td>
						<input type="date" id="start_conterm" name="start_conterm"/>부터
						<input type="date" id="end_conterm" name="end_conterm"/>까지
					</td>
				</tr>
				<tr>
					<th>*재직상태</th>
					<td>
						<select name="status">
						    <option value="재직">재직</option>
						    <option value="휴직">휴직</option>
						    <option value="퇴직">퇴직</option>
						</select>			
					</td>
				</tr>
				<tr>
					<th>*입사일자</th>
					<td><input type="date" id="join_year" name="join_year"/></td>
				</tr>
				<input type="submit" value="등록"/>
				<button type="button" onclick="location.href='./empList.go'">목록</button>	
			</table>
		</form>
	</div>
</body>
<script>
var now = new Date();

document.getElementById('start_conterm').valueAsDate = now;
document.getElementById('end_conterm').valueAsDate = new Date(now.setFullYear(now.getFullYear() + 1));
document.getElementById('join_year').valueAsDate = now;

</script>
</html>