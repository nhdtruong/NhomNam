<%-- 
    Document   : menu
    Created on : 13 May 2025, 23:41:42
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <header id="topnav" class="navigation sticky">
        <div class="container">

            <div>
                <a class="logo" href="home">
                    <img src="assets/images/logo-light.png" height="24" class="l-light" alt="">
                    <img src="assets/images/logo-dark.png" class="l-dark" height="24" alt="">
                </a>
            </div>

            <div class="menu-extras">
                <div class="menu-item">
                    <a class="navbar-toggle" id="isToggle" onclick="toggleMenu()">
                        <div class="lines">
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                    </a>
                </div>
            </div>

            <ul class="dropdowns list-inline mb-0">

                <li class="list-inline-item mb-0 ms-1">
                    <a href="javascript:void(0)" class="btn btn-icon btn-pills btn-primary" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">
                        <i class="uil uil-search"></i>
                    </a>
                </li>

                <li class="list-inline-item mb-0 ms-1">
                    <div class="dropdown dropdown-primary">
                        <c:if test="${sessionScope.user != null}">
                                <c:if test="${!sessionScope.user.getImg() == 'default'}">
                                <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="${sessionScope.user.getImg()}" class="avatar avatar-ex-small rounded-circle" alt=""></button> 
                                </c:if>
                                <c:if test="${sessionScope.user.getImg() == 'default'}">
                                <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="assets/images/avata.png" class="avatar avatar-ex-small rounded-circle" alt=""></button>
                                </c:if>
                        </c:if> <!-- chưa xong cái img -->

                        <c:if test="${sessionScope.user == null}">
                            <button class="btn btn-primary p-1" onclick="window.location.href = 'login?action=login'">Login</button>
                        </c:if>
                        <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                            <c:if test="${sessionScope.user.username != null}">
                                <a class="dropdown-item d-flex align-items-center text-" href="#">
                                    <c:if test="${!sessionScope.user.getImg() == 'default'}">
                                        <img src="" class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                    </c:if>
                                    <c:if test="${sessionScope.user.getImg() == 'default'}">
                                        <img src="assets/images/avata.png" class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                    </c:if>
                                    <div class="flex-1 ms-2">
                                        <span class="d-block mb-1">${sessionScope.user.username}</span>
                                    </div>                     
                                </a>
                            </c:if>
                            <div class="dropdown-divider border-top"></div>
                                  <c:if test="${sessionScope.user != null}">
                                      <a class="dropdown-item text-" href="user?action=profile"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Tài khoản của tôi</a>
                                  </c:if>
                                    <c:if test="${sessionScope.user != null}">
                                        <a class="dropdown-item text-" href="logout?action=logout"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Đăng xuất</a>
                                    </c:if>
                                    <c:if test="${sessionScope.user == null}">
                                       <a class="dropdown-item text-" href="user?action=login"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Đăng Nhập</a>
                                    </c:if>
                                    
                                       <c:if test="${sessionScope.user != null}">
                                        <c:if test="${sessionScope.user.getRole()== 1 }">
                                    <a class="dropdown-item text-" href="dashboard"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Quản lý</a>
                                        </c:if>
                                        <c:if test="${sessionScope.user.getRole()== 4}">
                                    <a class="dropdown-item text-" href="doctormanage?action=all"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Quản lý</a>
                                        </c:if>
                                        <c:if test="${sessionScope.user.getRole()== 2}">
                                    <a class="dropdown-item text-" href="appointmentmanage?action=all"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Quản lý</a>
                                        </c:if>
                                  </c:if>
                                    
                                    <!-- theem iff vao day-->
                                    
                                    
                        </div>
                    </div>
                </li>

            </ul>

            <div id="navigation">

                <ul class="navigation-menu nav-left nav-light">
                    <li><a href="home" class="sub-menu-item">Trang chủ</a></li>
                    <li><a href="doctor?action=all" class="sub-menu-item">Bác sĩ</a></li>
                    <li><a href="service" class="sub-menu-item">Dịch vụ y tế</a></li> 
                    <li><a href="contact" class="sub-menu-item">Liên hệ</a></li>
                    <li><a href="blogs" class="sub-menu-item">Tin tức & chủ đề</a></li>
                </ul>

            </div>
        </div>
    </header>
    </body>
</html>
