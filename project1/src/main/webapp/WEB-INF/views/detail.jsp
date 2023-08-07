<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
<link rel="stylesheet" href="./css/detail.css">
<script src="./js/jquery-3.7.0.min.js"></script>


<script type="text/javascript">
	function del() {
		let chk = confirm("삭제하시겠습니까?");
		if (chk) {
			location.href = "./delete?bno=${dto.bno }";
		}

	}
	function edit() {
		if (confirm("수정하시겠습니까?")) {
			location.href = "./edit?bno=${dto.bno }";
		}

	}
	function cdel(cno){
		if(confirm("댓글을 삭제하시겠습니까?")){
			location.href="./cdel?bno=${dto.bno }&cno="+cno;
		}
	}

	
	
	$(function() {
		$(".commentBox").hide();
		$("#openComment").click(function() {
			$(".commentBox").show('slow');
			$("#openComment").remove();

		})
		      //댓글 삭제 다른 방법
      $(".cdel").click(function(){
    		if(confirm("댓글을 삭제하시겠습니까?")){
        		 //alert("삭제합니다."+ $(this).parent().siblings(".cid").text()   );
        		 let cno = $(this).parent().siblings(".cid").text();
        		 //location.href="./cdel?bno=${dto.bno }&cno="+cno;
        		 let cno_comments = $(this).parents(".comment");
        		 $.ajax({
        			url : "./cdelR",
        		 	type : "post",
        		 	data : {bno: ${dto.bno}, cno: cno},
        		 	dataType: "json",
        			success: function(data){
        				if(data.result==1){

        				cno_comments.remove();
							alert("hi");
        				}else{
        					alert("통신에 문제가 발생")
        				}
        			},
        		 	
        		 	error:function(error){
        		 		alert("error: " +error );
        		 		
        		 	}
        		 
        			
        		 });
        		 
        		 
        		 
    		}
      });

		//댓글삭제 버튼 만들기 = 반드시 로그인하고, 자신의 글인지 확인하는 검사 구문 필요
		
		
		//댓글수정 버튼 만들기 = 반드시 로그인하고, 자신의 글인지 확인하는 검사 구문 필요
		
		
	});
</script>

</head>
<body>

	<%@ include file="menu.jsp"%>

	<br>
	<br>
	<div class="neontitle" style="font-size: 30pt;">${dto.m_name }님의
		게시글</div>
	<br>

	<table border="1">
		<tr>
			<td class="neonText">no.${dto.bno }</td>
			<c:if test="${sessionScope.mid eq dto.m_id }">
				<td><img alt="edit" src="./img/delete.png" onclick="edit()"></td>
				<td><img alt="delete" src="./img/edit.png" onclick="del()"></td>
			</c:if>
		</tr>
	</table>

	<div class="wrapper">
		<div class="neonText" style="float: left">제목 : ${dto.btitle }</div>
		<div class="neonText" style="text-align: right">좋아요 :
			${dto.blike }</div>
		<br>
		<div class="neonText" style="float: left">${dto.m_name }님</div>
		<div class="neonText" style="text-align: right">날짜 : ${dto.bdate }</div>
		<div class="neonText" style="text-align: right;">${dto.bip }</div>
		<hr>
		<div style="color: white;">

			<div>
				내용 : ${dto.bcontent } <br> <br> <br>
				<hr>
				댓글달기
				<hr>
				<c:if test="${sessionScope.mid ne null }">
					<button type="button" id="openComment">댓글창 열기</button>
					<div class="commentBox">
						<form action="./comment" method="post">
							<textarea name="comment" id="commenttextarea"></textarea>
							<button type="submit" id="comment">글쓰기</button>
							<input type="hidden" name="bno" value="${dto.bno }">

						</form>
					</div>
				</c:if>

				<hr>
				<c:choose>
					<c:when test="${fn:length(commentsList) gt 0 }">
						<div class="comm" style="font-size: small;">
							<div>댓글</div>
							<hr>
							<c:forEach items="${commentsList }" var="c">
								<div class="comment" >
								
									<div class="commentsT">
									${c.m_id }/${c.m_name }
										<c:if
											test="${sessionScope.mid ne null && sessionScope.mid eq c.m_id }">
											<img alt="edit" src="./img/delete.png"
												onclick="cedit()">
											<img alt="delete" src="./img/edit.png" class="cdel"
												onclick="cdel1(${c.c_no })">
										</c:if>
									</div>
									
									<div class="commentsTR">${c.c_date }</div>
									<div class="cid">${c.c_no }</div>
								</div>
								<br>
								<div class="commentsT">${c.c_comment }</div>
								<br>
								<hr>
							</c:forEach>
						</div>

					</c:when>
					<c:otherwise>
						<div>
							<h2>댓글이 없어요</h2>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<div class="neonText" style="text-align: center; font-size: xx-large;">
		<a href="./board" style="text-decoration: none;">BACK</a>
	</div>
</body>
</html>