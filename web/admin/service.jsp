

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
                        <div class="row">
                            <div class="col-md-6 row">
                                <div class="col-md-4">
                                    <h5 class="mb-0">Services</h5>
                                </div>
                                <div class="col-md-7">
                                    <div class="search-bar p-0 d-lg-block ms-2">                                                        
                                        <div id="search" class="menu-search mb-0">
                                            <form action="servicemanage?action=search" method="POST" id="searchform" class="searchform">
                                                <div>
                                                    <input type="text" class="form-control border rounded-pill" name="txt" id="s" placeholder="Tìm kiếm tên dịch vụ...">
                                                    <input type="submit" id="searchsubmit" value="Search">
                                                </div>
                                            </form>






                                        </div>
                                    </div> 
                                </div>
                            </div>
                            <div class="col-md-4">
                                <form action="servicemanage?action=filter" method="POST" onSubmit="document.getElementById('submit').disabled = true;">
                                    <div class="justify-content-md-end row">
                                        <div class="col-md-10 row align-items-center">
                                            <div class="col-md-4">
                                                <label class="form-label">Chuyên môn</label>
                                            </div>
                                            <div class="col-md-7">
                                                <select name="category" class="form-select">
                                                    <option <c:if test="${category1 == 'all'}"> selected </c:if> value="all">Tất cả</option>
                                                    <c:forEach items="${category}" var="s">
                                                        <option <c:if test="${category1 == s.id}"> selected </c:if> value="${s.service_id}">${s.name}</option>
                                                    </c:forEach>
                                                </select>  
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <button type="submit" class="btn btn-primary">Lọc</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="col-md-2">
                                <a href="servicemanage?action=add"><button class="btn btn-primary">Thêm mới</button></a>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="table-responsive bg-white shadow rounded">
                                    <table class="table mb-0 table-center">
                                        <thead>
                                            <tr>
                                        <table class="table table-hover table-striped table-bordered mt-4 align-middle text-center shadow-sm">
                                            <thead class="table-primary">
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Tên dịch vụ</th>
                                                    <th scope="col">Thể loại</th>
                                                    <th scope="col">Phí</th>
                                                    <th scope="col">Giảm giá</th>
                                                    <th scope="col">BHYT</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="s" items="${listS}">
                                                    <tr>
                                                        <td>${s.service_id}</td>
                                                        <td class="text-start">${s.service_name}</td>
                                                        <td>${s.category_service.name}</td>
                                                        <td><fmt:formatNumber value="${s.fee}" pattern="#,##0.00"/> đ</td>

                                                        <td>${s.discount}%</td>
                                                        <td>
                                                            <span class="badge bg-${s.is_bhyt ? 'success' : 'secondary'}">
                                                                <c:choose>
                                                                    <c:when test="${s.is_bhyt}">Có</c:when>
                                                                    <c:otherwise>Không</c:otherwise>
                                                                </c:choose>
                                                            </span>
                                                        </td>
                                                        <td>
                                                            <a href="servicemanage?action=edit&id=${s.service_id}"class="btn btn-sm btn-warning me-1">Sửa</a>
                                                            <a href="servicemanage?action=delete&id=${s.service_id}" class="btn btn-sm btn-danger" onclick="return confirm('Bạn chắc chắn muốn xóa?');">Xóa</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${service}" var="s">
                                                <tr>
                                                    <td class="p-3" ondblclick="window.location.href = 'servicemanage?action=viewfeedback&id=${s.service_id}'">${s.service_id}</td>
                                                    <td class="p-3" ondblclick="window.location.href = 'servicemanage?action=viewfeedback&id=${s.service_id}'">${s.service_name}</td>
                                                    <td class="p-3">${s.category_service.name}</td>
                                                    <td class="p-3"><fmt:formatNumber pattern="#,###,###,###" value="${s.fee}"/> đ</td>
                                                    <td class="p-3">${s.is_bhyt ? 'Có BHYT' : 'Không BHYT'}</td>
                                                    <td class="text-center p-3">
                                                        <a href="servicemanage?action=edit&id=${s.service_id}" class="btn btn-info">Sửa</a>
                                                        <button class="btn btn-danger delete" type="button" value="${s.service_id}">Xóa</button>
                                                        <a href="servicemanage?action=detail&id=${s.service_id}" class="btn btn-info">Chi tiết</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <c:set var="page" value="${page}"/>
                        <div class="row text-center">
                            <div class="col-12 mt-4">
                                <div class="d-md-flex align-items-center text-center justify-content-between">
                                    <ul class="pagination justify-content-center mb-0 mt-3 mt-sm-0">
                                        <c:forEach begin="${1}" end="${num}" var="i">
                                            <li class="page-item ${i==page?'active':''}"><a class="page-link" href="${url}&page=${i}">${i}</a></li>
                                            </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <jsp:include page="../admin/layout/footer.jsp"/>
            </main>
        </div>

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
        <script src="assets/js/sweetalert.min.js"></script>
        <script>
                                                        $(document).ready(jQuery(function () {
                                                            // Handle delete action
                                                            jQuery(".delete").click(function () {
                                                                swal({
                                                                    title: "Cảnh báo",
                                                                    text: "Bạn có chắc chắn muốn xóa dịch vụ này?",
                                                                    buttons: ["Hủy bỏ", "Đồng ý"],
                                                                })
                                                                        .then((willDelete) => {
                                                                            if (willDelete) {
                                                                                window.location = "servicemanage?action=delete&id=" + $(this).attr("value");
                                                                                swal("Đã xóa thành công.!", {});
                                                                            }
                                                                        });
                                                            });
                                                        }));
        </script>
    </body>
</html>