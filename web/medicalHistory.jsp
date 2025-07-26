<%-- 
    Document   : medicalHistory
    Created on : 8 Jul 2025, 04:28:05
    Author     : DELL
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <jsp:include page="layout/head.jsp"/>
    <body>
        <jsp:include page="layout/menu_white.jsp"/>
        <section class="bg-dashboard">
            <div class="con" style="margin-right: 150px;margin-left: 150px;padding-top: 10px">
                <div class="row">
                    <!-- Bên trái: Menu -->
                    <div class="col-md-3 mb-4" style="margin-top: 24px;">
                        <div class="rounded shadow overflow-hidden sticky-bar">
                            <div class="text-center avatar-profile margin-nagative mt-n5 position-relative pb-4 border-bottom">
                                <br><br><br><br>

                                <c:if test="${sessionScope.user.getImg() != 'default'}">
                                    <img src="${sessionScope.user.getImg()}" class="rounded-circle shadow-md avatar avatar-md-md" alt="">
                                </c:if>
                                <c:if test="${sessionScope.user.getImg() == 'default'}">
                                    <img src="assets/images/avata.png" class="rounded-circle shadow-md avatar avatar-md-md" alt="">
                                </c:if>

                                <h5 class="mt-3 mb-1">${sessionScope.user.getName()}</h5>
                                <p class="text-muted mb-0">${sessionScope.user.getUsername()}</p>
                            </div>

                            <ul class="list-unstyled sidebar-nav mb-0">
                                <li class="navbar-item">
                                    <a href="profile" class="navbar-link">
                                        <i class="ri-airplay-line align-middle navbar-icon"></i> Dashboard
                                    </a>
                                </li>

                                <c:if test="${sessionScope.user.getRole() == 4}">
                                    <li class="navbar-item">
                                        <a href="myFeedback?action=myfeedback" class="navbar-link">
                                            <i class="ri-chat-1-line align-middle navbar-icon"></i> Phản hồi
                                        </a>
                                    </li>
                                    <li class="navbar-item">
                                        <a href="myPatient?action=mypatient" class="navbar-link">
                                            <i class="ri-empathize-line align-middle navbar-icon"></i> Bệnh nhân của tôi
                                        </a>
                                    </li>
                                    <li class="navbar-item">
                                        <a href="myAppointment?action=all" class="navbar-link">
                                            <i class="ri-calendar-check-line align-middle navbar-icon"></i> Lịch hẹn
                                        </a>
                                    </li>
                                    <li class="navbar-item">
                                        <a href="myWorkingSchedule" class="navbar-link">
                                            <i class="ri-empathize-line align-middle navbar-icon"></i> Lịch làm việc
                                        </a>
                                    </li>
                                </c:if>

                                <c:if test="${sessionScope.user.getRole() == 5}">
                                    <li class="navbar-item">
                                        <a href="records" class="navbar-link">
                                            <i class="ri-calendar-check-line align-middle navbar-icon"></i> Hồ sơ khám bệnh
                                        </a>
                                    </li>
                                    <li class="navbar-item">
                                        <a href="bills" class="navbar-link">
                                            <i class="ri-calendar-check-line align-middle navbar-icon"></i> Phiếu khám bệnh
                                        </a>
                                    </li>
                                    <li class="navbar-item"><a href="medicalHistory" class="navbar-link"><i class="ri-calendar-check-line align-middle navbar-icon"></i>Lịch sử khám bệnh</a></li>
                                    </c:if>
                            </ul>
                        </div>
                    </div>


                    <div class="col-md-9">
                        <div class="rounded shadow mt-4">
                            <div class="layout-specing">
                                <h3 class="mb-4">📋 Lịch sử khám bệnh</h3>

                                <c:forEach var="record" items="${records}" varStatus="loop">
                                    <div class="card mb-4 shadow-sm">
                                        <div class="card-header bg-secondary text-white fw-bold">
                                            🗓️ <fmt:formatDate value="${record.visitDate}" pattern="dd/MM/yyyy" />
                                        </div>

                                        <div class="card-body">

                                            <!-- 1. Thông tin bệnh nhân -->
                                            <div class="row mb-3">
                                                <div class="col-md-6">👤 <strong>Họ tên:</strong> ${record.patient.patientName}</div>
                                                <div class="col-md-6">🎂 <strong>Ngày sinh:</strong> 
                                                    <fmt:formatDate value="${record.patient.dob}" pattern="dd/MM/yyyy"/>
                                                </div>
                                                <div class="col-md-6">📞 <strong>Điện thoại:</strong> ${record.patient.phone}</div>
                                                <div class="col-md-6">📍 <strong>Địa chỉ:</strong> ${record.patient.address}</div>
                                            </div>

                                            <!-- 2. Thông tin bác sĩ khám -->
                                            <div class="row mb-3">
                                                <div class="col-md-6">🧑‍⚕️ <strong>Bác sĩ khám:</strong> ${record.doctorName}</div>
                                                <div class="col-md-6">🏥 <strong>Chuyên khoa:</strong> ${record.departmentName}</div>
                                            </div>

                                            <!-- 3. Nội dung khám -->
                                            <div class="mb-3">
                                                <p><strong>🔍 Triệu chứng:</strong> ${record.symptoms}</p>
                                                <p><strong>🧪 Chẩn đoán:</strong> ${record.diagnosis}</p>
                                                <p><strong>📝 Kết luận:</strong> ${record.conclusion}</p>
                                            </div>

                                            <!-- 4. Thuốc kê đơn -->
                                            <div class="mb-3">
                                                <h6 class="fw-bold text-success">💊 Danh sách thuốc đã kê:</h6>
                                                <c:choose>
                                                    <c:when test="${empty record.medicines}">
                                                        <p class="text-muted">Không có thuốc nào được kê trong lần khám này.</p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <table class="table table-bordered table-striped">
                                                            <thead>
                                                                <tr>
                                                                    <th>STT</th>
                                                                    <th>Tên thuốc</th>
                                                                    <th>Đơn vị</th>
                                                                    <th>Công dụng</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:forEach var="m" items="${record.medicines}" varStatus="idx">
                                                                    <tr>
                                                                        <td>${idx.index + 1}</td>
                                                                        <td>${m.medicineName}</td>
                                                                        <td>${m.unit}</td>
                                                                        <td>${m.usage}</td>
                                                                    </tr>
                                                                </c:forEach>
                                                            </tbody>
                                                        </table>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>

                                            <!-- 5. Hướng dẫn và ghi chú -->
                                            <div class="mb-3">
                                                <p><strong>📘 Hướng dẫn dùng thuốc:</strong> ${record.instruction}</p>
                                                <p><strong>📌 Ghi chú thêm:</strong> ${record.note}</p>
                                            </div>
                                            <c:if test="${not empty token}">
                                                6. Đánh giá bác sĩ 
                                                <div class="mb-3">
                                                    <h6 class="fw-bold text-primary">⭐ Đánh giá bác sĩ</h6>

                                                    <c:choose>
                                                        <c:when test="${record.instruction}">
                                                            <p>🔢 <strong>Số sao:</strong> 
                                                                <c:forEach begin="1" end="5" var="i">
                                                                    <i class="fa${i <= record.instruction ? 's' : 'r'} fa-star text-warning"></i>
                                                                </c:forEach>
                                                                (${record.instruction}/5)
                                                            </p>
                                                            <p>💬 <strong>Phản hồi:</strong> ${record.instruction}</p>
                                                        </c:when> 
                                                        <c:otherwise>
                                                            <form action="rateDoctor" method="post">
                                                                <input type="hidden" name="doctorId" value="${record.doctorId}" />
                                                                <input type="hidden" name="patientId" value="${record.patient.patientId}" />
                                                                <input type="hidden" name="recordId" value="${record.recordId}" />

                                                                <div class="mb-2">
                                                                    <label for="star">Chọn số sao:</label>
                                                                    <select name="star" class="form-select" style="width: 150px; display: inline-block;">
                                                                        <option value="5">5 - Xuất sắc</option>
                                                                        <option value="4">4 - Tốt</option>
                                                                        <option value="3">3 - Bình thường</option>
                                                                        <option value="2">2 - Kém</option>
                                                                        <option value="1">1 - Rất tệ</option>
                                                                    </select>
                                                                </div>
                                                                <div class="mb-2">
                                                                    <textarea name="feedback" class="form-control" rows="2" placeholder="Nhận xét về bác sĩ..."></textarea>
                                                                </div>
                                                                <button type="submit" class="btn btn-success btn-sm">Gửi đánh giá</button>
                                                            </form>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </c:if>

                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </section>
        <jsp:include page="layout/footer.jsp"/>

        <jsp:include page="layout/search.jsp"/>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>



        <style>
            #selectedMedicineList {
                min-height: 100px;
                margin-top: 10px;

                padding: 10px;
                background-color: #fff;
                color: #000;
            }

        </style>

    </body>

</html>
