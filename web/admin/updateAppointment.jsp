<%-- 
    Document   : updateAppointent
    Created on : 1 Jul 2025, 14:36:12
    Author     : DELL
--%>


<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
    <jsp:include page="../admin/layout/adminhead.jsp"/>
    <body>
        <div class="page-wrapper doctris-theme toggled">
            <jsp:include page="../admin/layout/menu.jsp"/>
            <main class="page-content bg-light">
                <jsp:include page="../admin/layout/headmenu.jsp"/>
                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="mb-4">
                            <h4 class="fw-bold text-primary">📝 Chỉnh sửa lịch hẹn</h4>
                        </div>

                        <c:set var="a" value="${appointmentView}" />

                        <form action="updateAppoitment" method="post">
                            <div class="card shadow border-0">
                                <div class="card-body p-4">

                                    <div class="text-center mb-4">
                                        <h5 class="mb-0">Mã phiếu khám: 
                                            <span class="text-danger fw-bold">${a.appointment_code}</span>
                                        </h5>
                                    </div>


                                    <div class="row g-3">

                                        <div class="col-md-6">
                                            <label class="form-label fw-semibold text-secondary">Tên bệnh nhân</label>
                                            <div class="form-control bg-light">${a.patient.patientName}</div>
                                        </div>


                                        <div class="col-md-6">
                                            <label class="form-label fw-semibold text-secondary">Bác sĩ khám</label>
                                            <div class="form-control bg-light">
                                                <c:if test="${not empty a.doctorName}">${a.doctorName}</c:if>
                                                <c:if test="${ empty a.doctorName}">#</c:if>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <label class="form-label fw-semibold text-secondary">Ngày sinh</label>
                                                <div class="form-control bg-light">${a.patient.dob}</div>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label fw-semibold text-secondary">Chuyên khoa</label>
                                            <div class="form-control bg-light">
                                                <c:if test="${not empty a.departmentName}">${a.departmentName}</c:if>
                                                <c:if test="${ empty a.departmentName}">#</c:if>

                                                </div>
                                            </div>


                                            <div class="col-md-6">
                                                <label class="form-label fw-semibold text-secondary">Số điện thoại</label>
                                                <div class="form-control bg-light">${a.patient.phone}</div>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label fw-semibold text-secondary">Dịch vụ</label>
                                            <div class="form-control bg-light">${a.serviceName}</div>
                                        </div>

                                        <div class="col-md-6">
                                            <label class="form-label fw-semibold text-secondary">Ngày khám</label>
                                            <c:if test="${not empty a.dateBooking}">
                                                <div class="form-control bg-light"><fmt:formatDate value="${a.dateBooking}" pattern="dd/ MM/ yyyy"/></div>
                                            </c:if>
                                            <c:if test="${ empty a.dateBooking}">
                                                <div class="form-control bg-light">#</div>
                                            </c:if>  

                                        </div>


                                        <div class="col-md-6">
                                            <label class="form-label fw-semibold text-secondary">Giờ khám dự kiến</label>
                                            <c:if test="${not empty a.slotStart}">
                                                <div class="form-control bg-light"><fmt:formatDate value="${a.slotStart}" pattern="HH:mm"/></div>
                                            </c:if>
                                            <c:if test="${ empty a.dateBooking}">
                                                <div class="form-control bg-light">#</div>
                                            </c:if> 

                                        </div>

                                    </div>
                                    <input type="hidden" name="appointmentId" value="${a.appointmentId}" />
                                    <input type="hidden" name="appointmentCode" value="${a.appointment_code}" />
                                    <input type="hidden" name="doctorId_reDoctorName" value="${a.doctorId}_${a.doctorName}" />
                                    <input type="hidden" name="currentDoctorName" value="${a.doctorName}" />
                                    <input type="hidden" name="patientName" value="${a.patient.patientName}" />
                                    <input type="hidden" name="slotId" value="${a.slotId}" />
                                    <input type="hidden" name="slotIdReqChange" value="${a.slotIdReqChange}" />
                                    <input type="hidden" name="dateBooking" value="${a.dateBooking}" />
                                    <input type="hidden" name="slotEnd" value="${a.slotEnd}" />
                                    <input type="hidden" name="slotStart" value="${a.slotStart}" />
                                    <input type="hidden" name="departmentName" value="${a.departmentName}" />


                                    <div class="mt-5 d-flex justify-content-center gap-4">
                                        <c:if test="${not empty a.dateBooking}">
                                            <button type="submit" name="action" value="reschedule" class="btn btn-info px-4 py-2">
                                                <i class="fa-solid fa-calendar-days me-1"></i> Dời lịch hẹn
                                            </button>
                                        </c:if>

                                        <c:if test="${a.paymentStatus == 'success'}">
                                            <button type="submit" name="action" value="refund" class="btn btn-light px-4 py-2">
                                                <i class="fa-solid fa-money-bill-wave me-1"></i> Hoàn tiền
                                            </button>
                                        </c:if>

                                        <button type="button" class="btn btn-danger px-4 py-2" data-bs-toggle="modal" data-bs-target="#confirmCancelModal">
                                            <i class="fa-solid fa-money-bill-wave me-1"></i> Hủy lịch
                                        </button>


                                       <button type="submit" name="action" value="refund" class="btn btn-danger px-4 py-2">
                                            <i class="fa-solid fa-money-bill-wave me-1"></i> Hoàn tiền
                                        </button>

                                    </div>
                                </div>
                            </div>
                            <div class="modal fade" id="confirmCancelModal" tabindex="-1" aria-labelledby="confirmCancelModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header bg-danger text-white">
                                            <h5 class="modal-title" id="confirmCancelModalLabel">Xác nhận hủy lịch</h5>
                                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Đóng"></button>
                                        </div>
                                        <div class="modal-body">
                                            Bạn có chắc chắn muốn <strong>hủy lịch khám</strong> này không?
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                                            <button type="submit" name="action" value="cancelAppointment" class="btn btn-danger">
                                                Xác nhận hủy
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>

                <jsp:include page="../admin/layout/footer.jsp"/>
            </main>
        </div>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/simplebar.min.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/select2.init.js"></script>
        <script src="assets/js/flatpickr.min.js"></script>
        <script src="assets/js/flatpickr.init.js"></script>
        <script src="assets/js/jquery.timepicker.min.js"></script> 
        <script src="assets/js/timepicker.init.js"></script> 
        <script src="assets/js/feather.min.js"></script>
        <script src="assets/js/app.js"></script>

    </body>

</html>



<style>
    .modal-backdrop.show {
        opacity: 0 !important;
    }
    .margin5px{
        margin-bottom: 5px;
    }
    .minw{
        display: inline-block;
        min-width: 150px;
    }
    .minwi{
        min-width: 20px;
    }
    .modal-content{
        width: 80%;
    }
    p{
        margin-bottom: 1.5rem;
    }

    .opacit{
        opacity: 0.6;
    }

    .card .card-body {
        padding: 1.5rem  1.5rem  0rem  1.5rem;
    }
</style>

