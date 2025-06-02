
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
                    <h5>Thêm Dịch vụ Mới</h5>
                    <form action="${pageContext.request.contextPath}/servicemanage?action=add" method="POST">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Tên dịch vụ</label>
                                <input type="text" name="service_name" class="form-control" required>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label">Có BHYT</label>
                                <select name="is_bhyt" class="form-control">
                                    <option value="1">Có</option>
                                    <option value="0">Không</option>
                                </select>
                            </div>

                            <div class="col-md-12 mb-3">
                                <label class="form-label">Mô tả</label>
                                <textarea name="description" class="form-control" rows="3"></textarea>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label">Thể loại</label>
                                <select name="category_service_id" class="form-control">
                                    <c:forEach items="${category}" var="cat">
                                                <option value="${cat.id}" <c:if test="${editService.category_service.id == cat.id}">selected</c:if>>${cat.name}</option>
                                            </c:forEach>
                                </select>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label">Khoa</label>
                                <select class="form-select" name="department" id="department">
                                    <c:forEach var="d" items="${department}">
                                                <option  <c:if test="${d.id==editService.department_id}">selected</c:if> value="${d.id}">${d.department_name}</option>
                                            </c:forEach>
                                </select>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label">Phí</label>
                                <input type="number" name="fee" class="form-control" required>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label">Giảm giá</label>
                                <input type="number" name="discount" class="form-control" value="0">
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label">Phương thức thanh toán</label>
                                <select name="payment_type_id" class="form-control">
                                    
                                        <option value="1" <c:if test="${editService.payment_type_id == 1}">selected</c:if>>Thanh toán tại bệnh viện</option>
                                            <option value="2" <c:if test="${editService.payment_type_id == 2}">selected</c:if>>Thanh toán online</option>
                                    
                                </select>
                            </div>

                            <div class="mt-3">
                                <button type="submit" class="btn btn-primary">Thêm</button>
                                <a href="${pageContext.request.contextPath}/servicemanage" class="btn btn-secondary">Hủy</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </div>
</body>
</html>
