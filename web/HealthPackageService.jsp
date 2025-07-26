<%-- 
    Document   : HealthPackageService
    Created on : 19 Jul 2025, 22:03:59
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html lang="en">
    <jsp:include page="layout/head.jsp"/>
    <body>
        <jsp:include page="layout/menu_white.jsp"/>
        <section class=" bg-half-50 d-table w-100" style="background: url('assets/images/bg/banner4.png') center; margin-top: 70px">

            <div class="container">
                <div class="row mt-5 mt-lg-0">
                    <div class="row mt-5 mt-lg-0">
                        <div class="col-12">
                            <div class="heading-title mb-4">
                                <div class="row align-items-center">
                                    <!-- Nội dung bên trái -->
                                    <div class="col-md-7">
                                        <div class="p-4  shadow"  style="background-color:white; border-radius: 20px;">
                                            <h3 class="fw-bold mb-3" style="color: #00b4d8;">GÓI KHÁM SỨC KHỎE</h3>
                                            <ul class="mb-4" style="list-style: none; padding-left: 0;">
                                                <li>✔️Chủ động tìm hiểu, lựa chọn gói khám phù hợp với nhu cầu</li>
                                                <li>✔️ Được hoàn phí khám nếu hủy phiếu</li>
                                                <li>✔️ Được hưởng chính sách hoàn tiền khi đặt lịch trên doctris</li>
                                                <li>✔Giảm thiểu việc chờ đợi đối với các csyt đông người</li>
                                                <li>✔️ Có chuyên gia y tế tư vấn cho bạn gói khám phù hợp khi bạn cần</li>
                                            </ul>
                                            <div class="d-flex align-items-center flex-wrap gap-2 mb-3">
                                                <p class="mb-0 fw-medium">
                                                    Liên hệ <span class="fw-bold">chuyên gia</span> để tư vấn thêm:
                                                </p>
                                                <a href="tel:19002115" class="text-primary fw-bold" style="font-size: 1.1rem;">📞 19002115</a>
                                                <span>hoặc</span>
                                                <a href="#" class="btn btn-warning text-white fw-bold">💬 Chat ngay</a>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Ảnh bên phải -->
                                    <div class="col-md-5 text-center">
                                        <img src="assets/images/bg/banner5.png" alt="Gọi video với bác sĩ" class="img-fluid" style="max-width: 100%;margin-bottom:-90px">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <section class="section">
            <div class="container">
                <div class="row gx-4" style="justify-content:center">
                    <!-- DANH SÁCH DỊCH VỤ (8 cột) -->
                    <div class="col-lg-6 col-md-12">
                        <c:if test="${empty listS}">
                            <div class="text-center">
                                <h5 class="mt-3 text-muted">Không tìm thấy kết quả</h5>
                                <img src="assets/images/norecords/norecords.png" alt="Không có dữ liệu" style="width: 200px; height:200px;">
                            </div>
                        </c:if>

                        <c:forEach items="${listS}" var="s">

                            <div class="card shadow-sm p-3 mb-3 rounded-4" style="position: relative;">
                                <div class="row g-3">
                                    <div class="col-auto">
                                        <img src="assets/images/services/defaultService.png" alt="Stomach Icon" width="60" height="60">
                                    </div>
                                    <div class="col">
                                        <h5 class="mb-1 fw-semibold">${s.service_name}</h5>
                                        <div class="text-muted small d-flex align-items-center">
                                            <i class="fa-solid fa-hospital opacity"></i> <span style="margin-left: 5px">Bệnh Viện Đa Khoa - Đại Học FPT</span>

                                        </div>
                                        <div class="d-flex justify-content-between align-items-center mt-2">
                                            <div class="text-warning fw-bold fs-6">Giá: <span><fmt:formatNumber value="${s.fee}" pattern="#,##0"/> đ</span></div>
                                            <div class="d-flex gap-2">
<!--                                                <button class="btn btn-outline-primary btn-sm rounded-pill">Xem chi tiết</button>-->
                                                <a href="booking.HealthPackage?stepName=dateTime&service_id=${s.service_id}&categoryService_id=${s.category_service_id}" class="btn btn-info text-white fw-bold px-4 py-2 rounded-pill">Đặt khám ngay</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </c:forEach>
                    </div>


                    <div class="col-lg-3 col-md-12 mt-3 pt-2">
                        <div class="card border-0 sidebar sticky-bar rounded shadow">
                            <div class="card-body">
                                <h4 class="fw-bold mb-3" style="color: #00b4d8;">GÓI KHÁM SỨC KHỎE</h4>
                                <img src="assets/images/bg/banner7.png" alt="Gọi video với bác sĩ" class="img-fluid" style="max-width: 100%; height: 300px">
                            </div>
                        </div>
                    </div>

                    <c:set var="page" value="${page}"/>
                    <div class="row text-center">
                        <div class="col-12 mt-4">
                            <div class="d-md-flex align-items-center text-center" style="justify-content: center">
                                <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                                    <c:choose>
                                        <c:when test="${page < numPageDisplay  && num < numPageDisplay  }">
                                            <c:forEach begin="${1}" end="${num}" var="i">
                                                <li class="page-item ${i==page?"active":""}"><a class="page-link" href="${url}&page=${i}">${i}</a></li>
                                                </c:forEach>

                                        </c:when>

                                        <c:when test="${page < numPageDisplay  && num > numPageDisplay  }">
                                            <c:forEach begin="${1}" end="${numPageDisplay}" var="i">
                                                <li class="page-item ${i==page?"active":""}"><a class="page-link" href="${url}&page=${i}">${i}</a></li>
                                                </c:forEach>

                                        </c:when>


                                        <c:when test="${(num - page + 1 ) <= numPageDisplay && num >= numPageDisplay}">
                                            <li class="page-item"><a class="page-link" href="${url}&page=${page-1}">Prev</a></li>
                                                <c:forEach begin="${num - (numPageDisplay-1)}" end="${num}" var="i">
                                                <li class="page-item ${i==page?"active":""}"><a class="page-link" href="${url}&page=${i}">${i}</a></li>
                                                </c:forEach>

                                        </c:when>   


                                        <c:otherwise >
                                            <li class="page-item"><a class="page-link" href="${url}&page=${page-1}">Prev</a></li>
                                                <c:forEach begin="${page-(numPageDisplay/2)+1}" end="${page+(numPageDisplay/2)}" var="i">
                                                <li class="page-item ${i==page?"active":""}"><a class="page-link" href="${url}&page=${i}">${i}</a></li>
                                                </c:forEach>
                                            <li class="page-item"><a class="page-link" href="${url}&page=${page+1}">Next</a></li>  
                                            </c:otherwise>      

                                    </c:choose>


                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>



        <jsp:include page="layout/footer.jsp"/>



        <jsp:include page="layout/search.jsp"/>
        <jsp:include page="layout/facebookchat.jsp"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/feather.min.js"></script>
        <script src="assets/js/app.js"></script>
        <style>
            .section{
                padding: 50px;
            }
            @media (min-width: 1400px) {
                .container {
                    max-width: 1400px !important;
                }
            }
        </style>

    </body>

</html>
