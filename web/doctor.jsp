
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
                                            <h3 class="fw-bold mb-3" style="color: #00b4d8;">ĐẶT KHÁM THEO BÁC SĨ</h3>
                                            <ul class="mb-4" style="list-style: none; padding-left: 0;">
                                                <li>✔ Chủ động chọn bác sĩ tin tưởng, đặt càng sớm càng tốt</li>
                                                <li>✔ Đặt khám theo giờ, không cần chờ lấy số thứ tự, chờ thanh toán</li>
                                                <li>✔ Được hoàn phí khám nếu hủy phiếu</li>
                                                <li>✔️Được hưởng chính sách hoàn tiền khi đặt lịch trên Doctris</li>
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
                                        <img src="assets/images/bg/banner6.png" alt="Gọi video với bác sĩ" class="img-fluid" style="max-width: 100%;margin-bottom:-90px">
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
                <div class="row">
                    <div class="col-lg-9 col-lg-9 row align-items-center">
                        <c:if test="${numberPage== 0}">
                            <div class="alert alert-warning text-center" style="width: 100%;">
                                Không có bác sĩ nào phù hợp với bộ lọc của bạn.
                            </div>
                        </c:if>
                        <c:forEach items="${doctor}" var="d">
                            <div class="col-xl-4 col-lg-4 col-md-6 mt-2 pt-2 d-flex">
                                <div class="card team border-0 rounded shadow overflow-hidden d-flex flex-column w-100 h-100">
                                    <div style="display: none">${d.doctor_id}</div>
                                    <c:if test="${d.img!='default'}" >
                                        <!-- Avatar -->
                                        <div class="team-person text-center mt-3">
                                            
                                            <img src="${d.img}" style="width: 80px; height: 80px; border-radius: 50%;" class="img-fluid" alt="">
                                        </div>
                                    </c:if>
                                    <c:if test="${d.img == 'default'}" >
                                        <!-- Avatar -->
                                        <div class="team-person text-center mt-3">
                                            <img src="assets/images/avata.png" style="width: 80px; height: 80px; border-radius: 50%;" class="img-fluid" alt="">
                                        </div>
                                    </c:if>
                                 
                                    <div class="card-body text-center flex-grow-1 d-flex flex-column justify-content-center">
                                        <a href="#" class="title text-dark h5 d-block mb-0">${d.doctor_name}</a>
                                        <small class="text-muted speciality" style="min-height: 36px; display: block;">Chuyên môn: ${d.department_name}</small>
                                        <small class="text-muted speciality" style="min-height: 36px; display: block;">Chức vụ: ${d.position.getName()}</small>
                                        <p class="text-muted mb-0">${d.number_rate_star} feedbacks</p>
                                    </div>

                                    <!-- Button footer -->
                                    <div class="pt-2 pb-3 text-center">
                                        <button class="btn btn-soft-primary me-1" 
                                                onclick="window.location.href = 'booking?stepName=service&doctorId=${d.doctor_id}&doctorName=${d.doctor_name}&departmentName=${d.department_name}&departmentId=${d.deparment_id}&chuyenkhoaTypeDoctor=chuyenkhoaTypeDoctor'">
                                            Đặt lịch
                                        </button>
                                        <button class="btn btn-soft-primary" onclick="window.location.href = 'doctor?action=detail&id=${d.doctor_id}'">Chi tiết</button>  
                                    </div>
                                </div>
                            </div>

                        </c:forEach>
                        <div style="
                             text-align: center;
                             margin-top: 20px;
                             font-size: 18px;
                             font-weight: 500;
                             color: #333;
                             font-family: 'Segoe UI', sans-serif;
                             ">
                            <a style="
                               cursor: pointer;
                               padding: 5px 10px;
                               border-radius: 5px;
                               background-color: #f0f0f0;
                               margin-right: 8px;
                               transition: background-color 0.2s ease;
                               " href="doctor?gender=${gender}&speciality=${speciality}&SortType=${sort}&pagIndex=${pagIndex-1}">&lt;</a>

                            <span style="font-weight: bold; color: #007bff;">${pagIndex}</span>/<span style="color: #555;">${numberPage}</span>

                            <a style="
                               cursor: pointer;
                               padding: 5px 10px;
                               border-radius: 5px;
                               background-color: #f0f0f0;
                               margin-left: 8px;
                               transition: background-color 0.2s ease;
                               " href="doctor?gender=${gender}&speciality=${speciality}&SortType=${sort}&pagIndex=${pagIndex+1}" >&gt;</a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-3 mt-3 pt-2">
                        <div class="card border-0 sidebar sticky-bar rounded shadow">
                            <div class="card-body">
                                <form action="doctor?action=filter" method="get" onSubmit="document.getElementById('submit').disabled = true;">
                                    <div class="widget mb-4 pb-2">
                                        <h5 class="widget-title">Lọc</h5>
                                        <div class="row align-items-center">
                                            <div class="col-md-12">
                                                <label class="form-label">Giới tính</label>
                                            </div>
                                            <div class="col-md-12">
                                                <select name="gender" class="form-select">
                                                    <option <c:if test="${gender == 'all'}"> selected </c:if> value="all">Tất cả</option>
                                                    <option <c:if test="${gender == 'true'}"> selected </c:if> value="true">Nam</option>
                                                    <option <c:if test="${gender == 'false'}"> selected </c:if> value="false">Nữ</option>
                                                    </select>  
                                                </div>
                                            </div>
                                            <br>
                                            <div class="row align-items-center">
                                                <div class="col-md-12">
                                                    <label class="form-label">Chuyên môn</label>
                                                </div>
                                                <div class="col-md-12">
                                                    <select name="speciality" class="form-select">
                                                        <option <c:if test="${speciality == 'all'}"> selected </c:if> value="all">Tất cả</option>
                                                    <c:forEach items="${listDepartment}" var="s">
                                                        <option <c:if test="${speciality == s.id}"> selected </c:if> value="${s.id}">${s.department_name}</option>
                                                    </c:forEach>
                                                </select>  
                                            </div>
                                        </div>
                                        <br>
                                        <div class="widget mb-4 pb-2">
                                            <h5 class="widget-title">Sắp xếp</h5>
                                            <div class="row align-items-center">
                                                <div class="col-md-12">
                                                    <select name="SortType" class="form-select">
                                                        <option <c:if test="${sort == 'all'}"> selected </c:if> value="all">Tất cả</option>
                                                        <option <c:if test="${sort == 'star'}"> selected </c:if> value="star">Star</option>
                                                        <option <c:if test="${sort == 'latest'}"> selected </c:if> value="latest">Mới nhất</option>
                                                        <option <c:if test="${sort == 'popular'}"> selected </c:if> value="popular">Phổ biến</option>
                                                        </select>  
                                                    </div>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Lọc</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <c:set var="page" value="${page}"/>
            <div class="row text-center">
                <div class="col-12 mt-4">
                    <div class="d-md-flex align-items-center text-center justify-content-between">
                        <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                            <c:forEach begin="${1}" end="${num}" var="i">
                                <li class="page-item ${i==page?"active":""}"><a class="page-link" href="${url}&page=${i}">${i}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="layout/footer.jsp"/>

    <a href="#" onclick="topFunction()" id="back-to-top" class="btn btn-icon btn-pills btn-primary back-to-top"><i data-feather="arrow-up" class="icons"></i></a>

    <jsp:include page="layout/search.jsp"/>
    <jsp:include page="layout/facebookchat.jsp"/>

    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/feather.min.js"></script>
    <script src="assets/js/app.js"></script>
    <script>
        function Sort(type) {
            window.location.href = "doctor?action=sort&type=" + type;
        }
    </script>
</body>

</html>