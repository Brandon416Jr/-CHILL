<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pichill.owneruser.entity.OwnerUser"%>

<%
//見com.emp.controller.EmpServlet.java第238行存入req的empVO物件 (此為輸入格式有錯誤時的empVO物件)
OwnerUser ownerUser = (OwnerUser) request.getAttribute("ownerUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>查看會員資料 (企業)</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/backEnd-Website/vendor/bootstrap-4.1/bootstrap.min.css" />
<style type="text/css"></style>
<!-- Vendor CSS-->
<link
	href="<%=request.getContextPath()%>/backEnd-Website/vendor/animsition/animsition.min.css"
	rel="stylesheet" media="all" />
<link
	href="<%=request.getContextPath()%>/backEnd-Website/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet" media="all" />
<link
	href="<%=request.getContextPath()%>/backEnd-Website/vendor/wow/animate.css"
	rel="stylesheet" media="all" />
<link
	href="<%=request.getContextPath()%>/backEnd-Website/vendor/css-hamburgers/hamburgers.min.css"
	rel="stylesheet" media="all" />
<link
	href="<%=request.getContextPath()%>/backEnd-Website/vendor/slick/slick.css"
	rel="stylesheet" media="all" />
<link
	href="<%=request.getContextPath()%>/backEnd-Website/vendor/select2/select2.min.css"
	rel="stylesheet" media="all" />
<link
	href="<%=request.getContextPath()%>/backEnd-Website/vendor/perfect-scrollbar/perfect-scrollbar.css"
	rel="stylesheet" media="all" />
<!-- Main CSS-->
<link href="<%=request.getContextPath()%>/backEnd-Website/css/main.css"
	rel="stylesheet" media="all" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/backEnd-Website/css/set.css" />
	<link rel="stylesheet"
	href="<%=request.getContextPath()%>/backEnd-Website/css/header.css" />
<style>
.account-dropdown__footer {
	display: flex;
	justify-content: flex-end;
}

.btn {
	margin-left: auto;
	width: 100%;
	box-sizing: border-box;
}</style>
</head>
<body class="animsition">
	<!-- MENU SIDEBAR-->
	<div class="sidebar">
		<aside class="menu-sidebar d-none d-lg-block">
			<div class="menu-sidebar__content js-scrollbar1">
				<nav class="navbar-sidebar">
					<ul class="list-unstyled navbar__list expanded">
						<li class="has-sub"><a class="js-arrow" href="#"> <i
								class="fas fa-tachometer-alt"></i>員工管理
						</a>
							<ul class="list-unstyled navbar__sub-list js-sub-list">
								<li><a class="active"
									href="<%=request.getContextPath()%>/backstage/manage/all_manage.jsp">所有員工資料</a></li>
								<li><a
									href="<%=request.getContextPath()%>/backstage/manage/new_manage.jsp">新增員工資料</a></li>
							</ul></li>
						<li class="has-sub"><a class="js-arrow" href="#"> <i
								class="fas fa-tachometer-alt"></i>一般會員管理
						</a>
							<ul class="list-unstyled navbar__sub-list js-sub-list">
								<li><a
									href="<%=request.getContextPath()%>/backstage/generalUserBack/all_gUser.jsp">所有會員資料</a></li>
							</ul></li>
						<li class="has-sub"><a class="js-arrow" href="#"> <i
								class="fas fa-tachometer-alt"></i>企業會員管理
						</a>
							<ul class="list-unstyled navbar__sub-list js-sub-list">
								<li><a
									href="<%=request.getContextPath()%>/backstage/ownerUserBack/all_oUser.jsp">所有會員資料</a></li>
							</ul></li>
						<li class="has-sub"><a class="js-arrow" href="#"> <i
								class="fas fa-tachometer-alt"></i>最新消息管理
						</a>
							<ul class="list-unstyled navbar__sub-list js-sub-list">
								<li><a
									href="<%=request.getContextPath()%>/backstage/contactUsBack/all_form.jsp">表單管理</a></li>
								<li><a
									href="<%=request.getContextPath()%>/backstage/announcementBack/all_announcement.jsp">公告管理</a></li>
								<li><a
									href="<%=request.getContextPath()%>/backstage/announcementBack/new_announcement.jsp">新增公告</a></li>
							</ul></li>
						<li class="has-sub"><a class="js-arrow" href="#"> <i
								class="fas fa-tachometer-alt"></i>論壇管理
						</a>
							<ul class="list-unstyled navbar__sub-list js-sub-list">
								<li><a
									href="<%=request.getContextPath()%>/backstage/postBack/all_post.jsp">所有文章</a></li>
								<li><a
									href="<%=request.getContextPath()%>/backstage/commentBack/all_comment.jsp">所有留言</a></li>
								<li><a
									href="<%=request.getContextPath()%>/backstage/reportBack/all_report.jsp">檢舉管理</a></li>
							</ul></li>
						<li class="has-sub"><a class="js-arrow" href="#"> <i
								class="fas fa-tachometer-alt"></i>球館管理
						</a>
							<ul class="list-unstyled navbar__sub-list js-sub-list">
								<li><a
									href="<%=request.getContextPath()%>/backstage/courtBack/all_court.jsp">所有球館</a></li>
								<li><a
									href="<%=request.getContextPath()%>/backstage/placeBack/all_place.jsp">所有場地</a></li>
							</ul></li>
						<li class="has-sub"><a class="js-arrow" href="#">
									<i class="fas fa-tachometer-alt"></i>預約管理
							</a>
							<ul class="list-unstyled navbar__sub-list js-sub-list">
									<li><a
										href="<%=request.getContextPath()%>/backstage/reserveOrderBack/all_reserveOrder.jsp">所有預約訂單</a></li>
								</ul></li>
					</ul>
				</nav>
			</div>
		</aside>
		<!-- END MENU SIDEBAR-->
	</div>

	<!-- PAGE CONTAINER-->
	<div class="page-container">
		<!-- HEADER DESKTOP-->
		<header class="header-desktop">
			<div class="section__content section__content--p30">
				<div class="container-fluid">
					<div class="header-wrap">
						<div class="header-logo">
							<a href="<%=request.getContextPath()%>/backstage/login/index.jsp"><img
								class="img-logo"
								src="<%=request.getContextPath()%>/image/bigLogo.png" alt="" /></a>
							<!-- 							<a href="index.html"><img class="img-logo"  -->
							<%-- 								src="<%=request.getContextPath()%>/image/bigLogo.png" alt="" /></a> --%>
						</div>
						
						<div class="welcome">
								<div class="flex">
									<div class="s-logo">
										<img src="${pageContext.request.contextPath }/backEnd-Website/pic/smallLogo.png" alt="">
									</div>
									<p class="welcome">π Chill後臺管理系統</p>
									<div class="s-logo">
										<img src="${pageContext.request.contextPath }/backEnd-Website/pic/smallLogo.png" alt="">
									</div>
								</div>
							</div>
						
						<div class="header-button">
							<div class="account-wrap">
								<div class="account-item clearfix js-item-menu">
									<div class="image">
										<!-- 										<img -->
										<%-- 											src="<%=request.getContextPath()%>/manage/DBGifReader?manageID=<%=manage.getManageID()%>" --%>
										<!-- 											alt="使用者頭像" />  -->
										<img src="<%=request.getContextPath()%>/image/Group 115.png"
											alt="使用者頭像" />
									</div>
									<div class="content">
										<a class="js-acc-btn" href="#">管理員羅裕鵬，您好</a>
										<%-- 										<a class="js-acc-btn" href="#">管理員<%=manage.getmName() %>，您好</a> --%>
									</div>
									<div class="account-dropdown js-dropdown">
										<div class="info clearfix">
											<div class="image">
												<a href="#"> <!-- 												<img --> <%-- 											src="<%=request.getContextPath()%>/manage/DBGifReader?manageID=<%=manage.getManageID()%>" --%>
													<!-- 											alt="使用者頭像" />  --> <img
													src="<%=request.getContextPath()%>/image/Group 115.png"
													alt="John Doe" />
												</a>
											</div>
											<div class="content">
												<h5 class="name">
													<a href="#">羅裕鵬</a>
													<%-- 													<a href="<%=request.getContextPath()%>/manage/manage.do?action=getOne_For_Update&manageID=<%=manage.getManageID()%>"><%=manage.getmName() %></a> --%>
												</h5>
												<span class="email">brandon416jr@gmail.com</span>
												<%-- 												<span class="email"><%=manage.getmEmail() %></span> --%>
											</div>
										</div>
										<div class="account-dropdown__footer">
											<form method="POST"
													action="<%=request.getContextPath()%>/manage/manage.do">
													<button class="btn btn-danger">登出</button>
													<input type="hidden" name="action" value="logout">
												</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<!-- END HEADER DESKTOP-->
	</div>

	<div class="main-content">
		<div class="section__content2 section__content--p30">
			<div class="container-fluid2">
				<div class="card">
					<div class="card-header">
						<strong>修改 ${ownerUser.oName} 企業會員資料</strong>
						<h4>
							<a
								href="<%=request.getContextPath()%>/backstage/ownerUserBack/all_oUser.jsp"><img
								src="<%=request.getContextPath()%>/image/smallLogo.png"
								width="20" height="20" border="0">回所有員工</a>
						</h4>
					</div>

					<%-- 錯誤表列 --%>
					<c:if test="${not empty errorMsgs}">
						<font style="color: red">請修正以下錯誤:</font>
						<ul style="list-style-type: none">
							<c:forEach var="message" items="${errorMsgs}">
								<li style="color: red">${message}</li>
							</c:forEach>
						</ul>
					</c:if>
					<form action="" method="post" enctype="multipart/form-data"
						class="form-horizontal">
						<div class="card-body">
							<div class="row">
								<div class="col-lg-6">
									<div class="left-card-body card-block">

										<div class="row form-group">
											<div class="col col-md-3">
												<label for="disabled-input" class="form-control-label">企業會員編號</label>
											</div>
											<div class="col-10 col-md-8">
												<input type="text" id="disabled-input" name="oUserID"
													value="<%=ownerUser.getoUserID()%>" disabled="disabled"
													class="form-control" />
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class="form-control-label">帳號</label>
											</div>
											<div class="col-10 col-md-8">
												<input type="text" id="text-input" name="oUserName"
													value="<%=ownerUser.getoUserID()%>" disabled="disabled"
													class="form-control" />
												<!-- <small class="form-text text-muted">This is a help text</small> -->
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class="form-control-label">密碼</label>
											</div>
											<div class="col-10 col-md-8">
												<input type="text" id="text-input" name="oPassword"
													value="<%=ownerUser.getoPassword()%>" disabled="disabled"
													class="form-control" />
												<!-- <small class="form-text text-muted">This is a help text</small> -->
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class="form-control-label">身份證字號</label>
											</div>
											<div class="col-10 col-md-8">
												<input type="text" id="text-input" name="oIDNum"
													value="<%=ownerUser.getoIDNum()%>" disabled="disabled"
													class="form-control" />
												<!-- <small class="form-text text-muted">This is a help text</small> -->
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class="form-control-label">統編</label>
											</div>
											<div class="col-10 col-md-8">
												<input type="text" id="text-input" name="compiled"
													value="<%=ownerUser.getcompiled()%>" disabled="disabled"
													class="form-control" />
												<!-- <small class="form-text text-muted">This is a help text</small> -->
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="disabled-input" class="form-control-label">姓名</label>
											</div>
											<div class="col-10 col-md-8">
												<input type="text" id="disabled-input" name="oName"
													value="<%=ownerUser.getoName()%>" disabled="disabled"
													class="form-control" />
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label class="form-control-label">性別</label>
											</div>
											<div class="col col-md-8">
												<div class="form-check">
													<div class="radio">
														<%
														int gender = ownerUser.getoGender();
														%>
														<select name="oGender" disabled="disabled">
															<option value="0" <%=gender == 0 ? "selected" : ""%>>男</option>
															<option value="1" <%=gender == 1 ? "selected" : ""%>>女</option>
														</select>
													</div>
												</div>
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class="form-control-label">生日</label>
											</div>
											<div class="col-10 col-md-8">
												<input type="text" id="text-input" name="oBirth"
													value="<%=ownerUser.getoBirth()%>" disabled="disabled"
													class="form-control" />
												<!-- <small class="form-text text-muted">This is a help text</small> -->
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class="form-control-label">連絡電話</label>
											</div>
											<div class="col-10 col-md-8">
												<input type="text" id="text-input" name="oTelephone"
													value="<%=ownerUser.getoTelephone()%>" disabled="disabled"
													class="form-control" />
												<!-- <small class="form-text text-muted">This is a help text</small> -->
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class="form-control-label">聯絡地址</label>
											</div>
											<div class="col-10 col-md-8">
												<input type="text" id="text-input" name="oAddress"
													value="<%=ownerUser.getoAddress()%>" disabled="disabled"
													class="form-control" />
												<!-- <small class="form-text text-muted">This is a help text</small> -->
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class="form-control-label">銀行代號</label>
											</div>
											<div class="col-10 col-md-8">
												<input type="text" id="text-input" name="bankCode"
													value="<%=ownerUser.getoAddress()%>" disabled="disabled"
													class="form-control" />
												<!-- <small class="form-text text-muted">This is a help text</small> -->
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-6">
									<div class="right-card-body card-block">
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class="form-control-label">銀行帳號</label>
											</div>
											<div class="col-10 col-md-8">
												<input type="text" id="text-input" name="bankAccount"
													value="<%=ownerUser.getoAddress()%>" disabled="disabled"
													class="form-control" />
												<!-- <small class="form-text text-muted">This is a help text</small> -->
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="file-input" class="form-control-label">上傳大頭貼</label>
											</div>
											<div class="col-10 col-md-8">
												<input type="file" id="file-input" name="oProfilePic"
													disabled="disabled" multiple="multiple"
													onclick="previewImage()" class="form-control-file" /> <img
													id="imagePreview" src="#" alt="Preview" width="100px" />
												<div id="blob_holder">
													<img
														src="<%=request.getContextPath()%>/owneruser/DBGifReader?oUserID=${ownerUser.oUserID}"
														width="100px">
												</div>
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class="form-control-label">註冊日期</label>
											</div>
											<div class="col-10 col-md-8">
												<input type="text" id="text-input" name="oRegisterDate"
													value="<%=ownerUser.getoRegisterDate()%>"
													disabled="disabled" class="form-control" />
												<!-- <small class="form-text text-muted">This is a help text</small> -->
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class="form-control-label">討論版文章數</label>
											</div>
											<div class="col-10 col-md-8">
												<input type="text" id="text-input" name="oPostAmount"
													value="<%=ownerUser.getoPostAmount()%>" disabled="disabled"
													class="form-control" />
												<!-- <small class="form-text text-muted">This is a help text</small> -->
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class="form-control-label">文章被檢舉數</label>
											</div>
											<div class="col-10 col-md-8">
												<input type="text" id="text-input" name="oReportCnt"
													value="<%=ownerUser.getoReportCnt()%>" disabled="disabled"
													class="form-control" />
												<!-- <small class="form-text text-muted">This is a help text</small> -->
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class="form-control-label">上架球館次數</label>
											</div>
											<div class="col-10 col-md-8">
												<input type="text" id="text-input" name="courtArriveCnt"
													value="<%=ownerUser.getCourtArriveCnt()%>"
													disabled="disabled" class="form-control" />
												<!-- <small class="form-text text-muted">This is a help text</small> -->
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class="form-control-label">被預約次數</label>
											</div>
											<div class="col-10 col-md-8">
												<input type="text" id="text-input" name="rsvdCnts"
													value="<%=ownerUser.getRsvdCnts()%>" disabled="disabled"
													class="form-control" />
												<!-- <small class="form-text text-muted">This is a help text</small> -->
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class="form-control-label">電子信箱</label>
											</div>
											<div class="col-10 col-md-8">
												<input type="text" id="text-input" name="oEmail"
													value="<%=ownerUser.getoEmail()%>" disabled="disabled"
													class="form-control" />
												<!-- <small class="form-text text-muted">This is a help text</small> -->
											</div>
										</div>
										<div class="row form-group">
											<div class="col-12 col-md-8">
												<input type="hidden" name="action" value="update"> <input
													type="hidden" name="oUserID"
													value="<%=ownerUser.getoUserID()%>"> <input
													type="submit" class="btn btn-primary btn-sm" value="返回">
												<i class="fa fa-dot-circle-o"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>

	<script
		src="<%=request.getContextPath()%>/backEnd-Website/js/pic_uplaod.js"></script>
	<!-- Jquery JS-->
	<script
		src="<%=request.getContextPath()%>/backEnd-Website/vendor/jquery-3.2.1.min.js"></script>
	<!-- proper.min.js first, then bootstrap.min.js -->
	<script
		src="<%=request.getContextPath()%>/backEnd-Website/vendor/bootstrap-4.1/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/backEnd-Website/vendor/bootstrap-4.1/bootstrap.min.js"></script>
	<!-- Vendor JS       -->
	<script
		src="<%=request.getContextPath()%>/backEnd-Website/vendor/slick/slick.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/backEnd-Website/vendor/wow/wow.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/backEnd-Website/vendor/animsition/animsition.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/backEnd-Website/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/backEnd-Website/vendor/counter-up/jquery.waypoints.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/backEnd-Website/vendor/counter-up/jquery.counterup.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/backEnd-Website/vendor/circle-progress/circle-progress.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/backEnd-Website/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script
		src="<%=request.getContextPath()%>/backEnd-Website/vendor/chartjs/Chart.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/backEnd-Website/vendor/select2/select2.min.js"></script>
	<!-- Main JS-->
	<script src="<%=request.getContextPath()%>/backEnd-Website/js/main.js"></script>
</body>
</html>