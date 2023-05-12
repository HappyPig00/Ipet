<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE HTML>
		<!--
	Arcana by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
		<html>


		<head>
			<title>동물병원 리스트</title>
			<meta charset="utf-8" />
			<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
			<link rel="stylesheet" href="../resources/assets/css/main.css" />
			<link rel="shortcut icon" type="image/x-icon" href="../resources/images/favicon.jpg">
		</head>
		<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
		<script>
			$(document).ready(function () {
				if ("${address}" != "") {
					$("input[name='address'][value=${ address }]").prop("checked", true);
				}

				$(".pageClass").click(function (e) {
					e.preventDefault()
					let pageNum = $(this).data("page")
					$("input[name='pageNum']").val(pageNum)
					console.log(pageNum)
					$("#frm").submit()
				})
				$("#chkbtn").click(function () {
					$("input[name='searchAddress']").val('N')
					$("input[name='searchName']").val('N')
					$("#frm").submit()
				})
				$(".a_map").click(function (e) {
					e.preventDefault()
					$("iframe").remove()
					let str = ""
					let url = e.target.href
					console.log(url)
					$.ajax({
						url: url
					})

					/* str += "<iframe src =" + e.target.href + " width = '600' height = '500' ></iframe>" */
					/*  $("#mapTd").append(str) */
					window.open(e.target.href,'_blank','width=500,height=300')
				})
				
				$("#searchBtn").click(function () {
					if ($("#searchName").prop("selected")) {
						$("input[name='searchAddress']").val('N')
						$("input[name='searchName']").val($("input[type=search]").val())
					} else if($("#searchAddress").prop("selected")) {
						$("input[name='searchName']").val('N')
						$("input[name='searchAddress']").val($("input[type=search]").val())
					}
					 $("#frm").submit();
				})
			})
		</script>
		<style>
			#hospitalList ul {
				list-style: none;
				width: 30%;
				display: inline-block;
			}

			#hospitalList ul li {
				float: left;
				margin-left: 5px;
			}
		</style>

		<body class="is-preload">
			<div id="page-wrapper">

				<%@include file="header.jsp" %>

					<!-- Main -->
					<section class="wrapper style1">
						<div class="container">
							<div class="row gtr-200">
								<div class="col-8 col-12-narrower">
									<div id="content">

										<!-- Content -->

										<article>
											<header>
												<h2>동물병원 탐색</h2>
												<p>지역을 체크해 주세요</p>
											</header>
											<form id="frm" action="/hospital/check_hos" method="get">
												<label for='add'>지역</label>
												<ul style="list-style-type: none;" id="hospitalList">
													<li>서울<input type="radio" value="서울" name="address">
													</li>
													<li>부산<input type="radio" value="부산" name="address"></li>
													<li>대구<input type="radio" value="대구" name="address"></li>
													<li>인천<input type="radio" value="인천" name="address"></li>
													<li>광주<input type="radio" value="광주" name="address"></li>
													<li>대전<input type="radio" value="대전" name="address"></li>
													<li>울산<input type="radio" value="울산" name="address"></li>
													<li>세종<input type="radio" value="세종" name="address"></li>
													<li>경기<input type="radio" value="경기" name="address"></li>
													<li>강원<input type="radio" value="강원" name="address"></li>
													<li>충북<input type="radio" value="충청북도" name="address"></li>
													<li>충남<input type="radio" value="충청남도" name="address"></li>
													<li>전북<input type="radio" value="전라북도" name="address"></li>
													<li>전남<input type="radio" value="전라남도" name="address"></li>
													<li>경북<input type="radio" value="경상북도" name="address"></li>
													<li>경남<input type="radio" value="경상남도" name="address"></li>
													<li>제주<input type="radio" value="제주" name="address"></li>
												</ul>
												<input type="hidden" name="pageNum" />
												<input type="hidden" name="searchName" value="${searchName}"/>
												<input type="hidden" name="searchAddress" value="${searchAddress}"/>
											</form>
										</article>

									</div>
								</div>
							</div>
							<div class="col-8 col-12-narrower">
								<button id="chkbtn">검색</button>
							</div>

							<c:if test="${not empty voList }">
								<br />
								<div>
									<select>
										<option id="searchName">이름 검색</option>
										<option id="searchAddress">주소 검색</option>
									</select>
									<input type="search" style="width:230px; height:26px" />
									<input type="button" value="검색" style="all: unset;" id="searchBtn" />
								</div>
							</c:if>

							<table>
								<tr>
									<th>동물병원 이름 (이름을 누르면 지도가 나옵니다.)</th>
									<th>동물병원 주소</th>
								</tr>
								<c:if test="${not empty voList}">
									<c:forEach var="vo" items="${voList}">
										<tr>
											<td><a class='a_map'
													href="http://localhost:5500/hospital/map/${vo.address}">
													${vo.name}</a></td>

											<td>${vo.address}</td>
											<td id="mapTd"></td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
							<c:if test="${address != null}">
								<%@include file="paging.jsp" %>
							</c:if>

						</div>

					</section>

					<%@include file="footer.jsp" %>
			</div>
			<!-- Scripts -->
			<script src="../resources/assets/js/jquery.min.js"></script>
			<script src="../resources/assets/js/jquery.dropotron.min.js"></script>
			<script src="../resources/assets/js/browser.min.js"></script>
			<script src="../resources/assets/js/breakpoints.min.js"></script>
			<script src="../resources/assets/js/util.js"></script>
			<script src="../resources/assets/js/main.js"></script>

		</body>

		</html>