

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                        <h5>Chỉnh sửa Dịch vụ</h5>
                        <form action="servicemanage?action=edit" method="POST">
                            <input type="hidden" name="id" value="${editService.service_id}">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">ID</label>
                                        <input type="text" name="id" class="form-control" value="${editService.service_id}" disabled>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Tên dịch vụ</label>
                                        <input type="text" name="service_name" class="form-control" value="${editService.service_name}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Có BHYT</label>
                                        <select name="is_bhyt" class="form-select">
                                            <option value="true" <c:if test="${editService.is_bhyt}">selected</c:if>>Có</option>
                                            <option value="false" <c:if test="${!editService.is_bhyt}">selected</c:if>>Không</option>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Mô tả</label>
                                            <textarea name="description" class="form-control">${editService.description}</textarea>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Thể loại</label>
                                        <select name="category_service_id" class="form-select" required>

                                            <c:forEach items="${category}" var="cat">
                                                <option value="${cat.id}" <c:if test="${editService.category_service.id == cat.id}">selected</c:if>>${cat.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Phí (VNĐ)</label>
                                        <input type="number" name="fee" class="form-control" value="${editService.fee}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Giảm giá (VNĐ)</label>
                                        <input type="number" name="discount" class="form-control" value="${editService.discount}">
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Loại thanh toán</label>
                                        <select name="payment_type_id" class="form-select" required>
                                            <option value="1" <c:if test="${editService.payment_type_id == 1}">selected</c:if>>Thanh toán tại bệnh viện</option>
                                            <option value="2" <c:if test="${editService.payment_type_id == 2}">selected</c:if>>Thanh toán online</option>
                                            </select>
                                        </div>

                                        <div class="mb-3">
                                            <label for="department" class="form-label">Khoa</label>
                                            <select class="form-select" name="department" id="department">
                                            <c:forEach var="d" items="${department}">
                                                <option  <c:if test="${d.id==editService.department_id}">selected</c:if> value="${d.id}">${d.department_name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Lưu</button>
                            <a href="servicemanager" class="btn btn-secondary">Hủy</a>
                        </form>
                    </div>
                </div>
            </main>
        </div>


        <jsp:include page="../admin/layout/footer.jsp"/>

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