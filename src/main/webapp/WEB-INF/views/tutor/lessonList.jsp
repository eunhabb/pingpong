<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/header.jsp" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=521d781cfe9fe7597693f2dc29a10601&libraries=services"></script>
<style>
.profile{width:50px; height:100px;}
.wrapper{border: 1px solid black; float: left; width: 25%;}
.listWrapper{overflow:hidden;}
#keyword{width: 80%;}
</style>
<script>

	$(function() {
		$('#start_date').datepicker({ dateFormat: 'yy-mm-dd'});
		$('#end_date').datepicker({ dateFormat: 'yy-mm-dd'});

		$("#listClick>section").each(function() {
			var text = $(this).find(".title").text();
			var seq = $(this).data("seq");
			console.log(seq);
			$(this).children("article").wrap(
					'<a href="/tutor/lessonView?seq=' + seq + '">')
		})
		
		var orderBy = '${orderBy}';
		if (orderBy != null) {
			$('#orderBy').val(orderBy);
		} else {
			$('#orderBy').val('seq');
		}
				
		$("#orderBy").on("change",function(){
			var orderbyVal = $("#orderBy").val();
			
			location.href="/tutor/lessonList?orderBy="+orderbyVal;
		})
		
		$(".ing").on("click", function(){
			console.log($(this).attr('id'));
			var orderbyVal = $("#orderBy").val();
			var period = $(this).attr('id');
			
			if(period == 'all'){
				location.href="/tutor/lessonList?orderBy="+orderbyVal;
				return false;
			}
			location.href="/tutor/lessonListPeriod?orderBy="+orderbyVal+"&period="+period;

		})

		//키워드로 검색
		$("#searchkeyword").on("click", function(){
			//여기서
			var selectVal = $("#keywordSelect").val();
			//검색바 내용
			var keywordVal = $("#keyword").val();
			//조회순 최신순 ...
			var orderbyVal = $("#orderBy").val();
			
			location.href="/tutor/searchKeword?keywordSelect="+selectVal+"&keyword="+keywordVal+"&orderBy="+orderbyVal;
		})
		
		//달력으로 검색
		$("#searchcalendar").on("click", function(){
			var start_dateVal = $("#start_date").val();
			var end_dateVal = $("end_date").val();
			console.log(start_dateVal);
			console.log(end_dateVal);
		})
		
	})
</script>



<div id="subWrap" class="hdMargin">
	<section id="subContents">
		<article id="lessonList" class="inner1200">

			<div class="tit_s1">
				<h2>강의 목록</h2>
				<p>전문적으로 배워보고싶나요?<br>전문 튜터를 통해 강의를 들어보세요.</p>
			</div>
			
			<div class="btnS1 right">
				<c:choose>
					<c:when test="${loginInfo.grade == 'tutor' }">
						<p>
							<a href="/tutor/lessonApp" class="on">강의 신청</a>
						</p>
					</c:when>
				</c:choose>
				
			</div>
			<!-- 검색 3가지 -->
			<div class="tab_s1">
				<ul class="clearfix">
					<li class="on"><a href="#;">키워드 검색</a></li>
					<li><a href="#;">달력 검색</a></li>
					<li><a href="#;">지도 검색</a></li>
				</ul>
			</div>

			<div id="tabContWrap">
				<article id="tab_1" class="kewordSch">
					<select id="keywordSelect">
						<option value="name">튜터</option>
						<option value="title">글제목</option>
						<option value="curriculum">글내용</option>
					</select>
					<input type="text" id="keyword" name="keyword">
					<input type="button" id="searchkeyword" value="검색하기">
				</article>
				
				<article id="tab_2" class="calendarSch">
					수업기간으로  검색하기 : 
					<input type="text" id="start_date" name="start_date" size="12">
					<label for="start_date" class="calendar_icon"> 
						<i class="fa fa-calendar" aria-hidden="true"></i>
					</label> ~ 
					
					<input type="text" id="end_date" name="end_date" size="12"> 
					<label for="end_date" class="calendar_icon"> 
						<i class="fa fa-calendar" aria-hidden="true"></i>
					</label>
					
					<input type="button" id="searchcalendar" value="검색하기">
				</article>
				
				<article id="tab_3" class="mapSch">
					<select name="sido1" id="sido1"></select> 
					<select name="gugun1" id="gugun1"></select>
					<div id="map" style="width:500px;height:400px;"></div>
				
				</article>
			</div>

			<!-- 정렬 전체 모집중 진행중 마감 -->
			<div class="btnS1 left">
				<div><button type="button" id="all" class="ing">전체</button></div>
				<div><button type="button" id="applying" class="ing">모집중</button></div>
				<div><button type="button" id="proceeding" class="ing">진행중</button></div>
				<div><button type="button" id="done" class="ing">마감</button></div>
			</div>
			<div>
				<select id="orderBy">
					<option value="seq">최신순</option>
					<option value="view_count">조회순</option>
					<option value="like_count">추천순</option>
					<option value="review_point">평점순</option>
				</select>
			</div>
			
			<div class="listWrapper">
				<c:choose>
					<c:when test="${empty lessonlist}">
						<div class="row">
							<div class='col-12'>강의가 없습니다.</div>
						</div>
					</c:when>
					<c:otherwise>
						<div id="listClick">
							<c:forEach var="i" items="${lessonlist}">
								<section data-seq="${i.seq}">
									<article class="wrapper">
										<div class="profile">
											<img src="/upload/member/${i.id}/${i.sysname}">
											<div class="name">${i.name }</div>
										</div>
										<div class="title">${i.title}</div>
										<div class="language">언어 : ${i.language}</div>
										<div class="price">
											가격 : ${i.price}
											<!-- <span class="badge badge-danger">New</span> -->
										</div>
										<div class="apply_date">모집기간 : ${i.apply_start}~${i.apply_end }</div>
										<div class="view_count">조회 : ${i.view_count}</div>
										<div class="like_count">추천 : ${i.like_count}</div>
										<div class="review_point">리뷰 평점 : ${i.review_point}</div>
										<div class="review_count">리뷰 갯수 : ${i.review_count}</div>
										<br>
										<c:if test="${i.applying == 'Y'}">
											<span>모집중</span>  
										</c:if>
										<c:if test="${i.proceeding == 'Y'}">
											<span>진행중</span>
										</c:if>
										<c:if test="${i.proceeding == 'N' && i.applying == 'N'}">
											<span>마감</span>
										</c:if>
									</article>
								</section>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			
			<div>
				<div class="navi">${navi}</div>
			</div>
		</article>
	</section>
	
	<script>
		new sojaeji('sido1', 'gugun1');
		
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

		var sidogugun;
		$("#gugun1").change(function() {
			var sido = $("#sido1").val();
			var gugun = $("#gugun1").val();
			sidogugun = sido + ' ' + gugun;
			
			$(this).wrap('<input type="text" name="location" value="'+sidogugun+'">');
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(sidogugun, function(result, status) {
				// 정상적으로 검색이 완료됐으면 
				if (status === kakao.maps.services.Status.OK) {

					var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

					// 결과값으로 받은 위치를 마커로 표시합니다
					var marker = new kakao.maps.Marker({
						map : map,
						position : coords
					});

					// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					map.setCenter(coords);
				}
			});
		})

	</script>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp" />