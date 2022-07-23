<%-- 
    Document   : ProductList.jsp
    Created on : Jun 12, 2022, 9:20:57 AM
    Author     : Vu Dai Luong
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Shopping online</title>

        <!-- Custom fonts for this template -->
        <link href="View/marketing/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template -->

        <link href="View/marketing/css/sb-admin-2.min.css" rel="stylesheet" type="text/css"/>
        <!-- Custom styles for this page -->
        <link href="View/marketing/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <!--        <script>
                    function chooseFile(fileInput) {
                        if (fileInput.files && fileInput.files[0]) {
                            var reader = new FileReader();
        
                            reader.onload = function (e) {
                                $('#image').attr('src', e.target.result);
                            }
                            reader.readAsDataURL(fileInput.files[0])
                        }
                    }
                </script>-->
        <script>
            $(document).ready(function () {
                var x_timer;
                $('#phone').keyup(function (e) {
                    clearTimeout(x_timer);
                    var phone = $("#phone").val();
                    x_timer = setTimeout(function () {
                        saveBtn();
                    }, 1000);
                });
                function saveBtn() {
                    $('#saveBtn').html('<button type="submit" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body mb-2">Save</button>');
                }
            });
        </script>

    </head>

    <body id="page-top">
        <!-- Page Wrapper -->
        <div id="wrapper">
            <ul class="navbar-nav bg-gradient-info sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="Homepage">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Shopping Online</div>
                </a>
                <hr class="sidebar-divider d-none d-md-block">


                <!-- Nav Item - Pages Collapse Menu -->

                

                <!-- Divider -->
                

                <li class="nav-item active">
                    <a class="nav-link" href="ProductMarketing?service=list">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Product List</span></a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="marketing/post">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Post</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="customers">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Customer</span></a>
                </li>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="sliders">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Slider list</span></a>
                </li>
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

            </ul>
            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <form class="form-inline">
                            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                                <i class="fa fa-bars"></i>
                            </button>
                        </form>
                        <ul class="navbar-nav ml-auto">
                            <!-- Nav Item - Messages -->

                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>

                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Settings
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-2 text-gray-800">Customer List</h1>
                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <button  class="btn btn-outline-primary ms-lg-2 " data-bs-toggle="modal" data-bs-target="#CreateFormLabel">
                                    Create
                                </button>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Full name</th>
                                                <th>Gender</th>
                                                <th>Email</th>
                                                <th>Phone Number</th>      
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>ID</th>
                                                <th>Full name</th>
                                                <th>Gender</th>
                                                <th>Email</th>
                                                <th>Phone Number</th>      
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <c:forEach items="${requestScope.user}" var="user">
                                                <tr>
                                                    <td>${user.userID}</td>

                                                    <td>${user.name}</td>
                                                    <td >${user.gender == "true" ? "male" :"female" }</td>

                                                    <td>${user.email}</td>
                                                    <td>${user.phone}</td>
                                                    <td>


                                                        <a href="customer/change-status?id=${user.userID}&status=${user.status.settingID}">${user.status.name}</a></td>

                                                    <!--                                                    
                                                    -->                                                    <td>
                                                        <input type="radio" class="btn-check" name="options-outlined" id="danger-outlined" autocomplete="off">
                                                        <a class="btn btn-outline-primary " href="editcustomer?id=${user.userID}">
                                                            edit
                                                        </a>


                                                        <input type="radio" class="btn-check" name="options-outlined" id="danger-outlined" autocomplete="off">
                                                        <a class="btn btn-outline-info" for="infor-outlined" href="customerdetai?id=${user.userID}">View</a>
                                                    </td>
                                                </tr>

<!--                                            <div class="modal fade" id="EditForm${Prm.productID}" tabindex="-1" aria-labelledby="CreateFormLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="card">
                                                            <div class="modal-header" style="background-color:#36b9cc">
                                                                <h5 class="modal-title" id="registerFormLabel" style="color: white;">Edit</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="card-body p-4">                 
                                                                <form action="update" method="POST">                        
                                                                    <div class="form-floating">
                                                                        <input type="text" class="form-control mb-2" id="name" readonly placeholder="Your name" name="ID" value="${Prm.productID}">
                                                                        <label for="Id">ID</label>
                                                                    </div>
                                                                    <div class="form-floating"> 

                                                                        <img src="View/Img/${Prm.thumbnail}" alt="" id="image" width="50" height="50" >
                                                                        <input type="file" name="thumbnaill" value="View/Img/${Prm.thumbnail}" id="imageFile" onchange="chooseFile(this)"
                                                                               accept="image/gif, image/jpeg, image/png">
                                                                    </div>

                                                                    <label for="Title">Category</label>
                                                                    <div class="form-floating"> 
                                                                        <select class="form-select form-select-sm form-control mb-2" aria-label=".form-select-sm example" name="category">

                                                <c:forEach items="${requestScope.CATE}" var="cate">
                                                    <option value="${cate.getSettingID()}" ${Prm.category.settingID == cate.getSettingID() ? "selected" :"" }>${cate.getName()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <label for="Title">Status</label>
                                        <div class="form-floating"> 
                                            <select class="form-select form-select-sm form-control mb-2" aria-label=".form-select-sm example" name="status">
                                                <c:forEach items="${requestScope.status}" var="stt">
                                                    <option value="${stt.getSettingID()}" ${Prm.status.settingID == stt.getSettingID() ? "selected" :"" }>${stt.getName()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="form-floating">
                                            <input type="Title" class="form-control mb-2" id="email"  placeholder="name@example.com" name="title" value="${Prm.title}">
                                            <label for="Title">Title</label>
                                        </div>
                                        <div class="form-floating">
                                            <input type="text" class="form-control mb-2" id="Price"  placeholder="Price" name="price" value="${Prm.price}">
                                            <label for="Price"> Price</label>
                                        </div>
                                        <div class="form-floating">

                                            <input type="discount" class="form-control mb-2" id="discount" placeholder="discount" name="discount" value="${Prm.discount}">
                                            <label for="discount">discount</label>
                                        </div>
                                        <div class="form-floating">
                                            <input type="Title" class="form-control mb-2" id="email"  placeholder="name@example.com" name="quantity" value="${Prm.quantity}">
                                            <label for="Title">Quantity</label>
                                        </div>
                                        <div class="form-floating">
                                            <input type="info" class="form-control mb-2" id="Price" placeholder="Brief info" name="summary" value="${Prm.summary}">
                                            <label for=" info">Brief info</label>
                                        </div>

                                        <button type="submit" class="btn btn-outline-success justify-content-center">Save</button>
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>-->

                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.container-fluid -->

                </div>


                <!-- Footer -->
                <%@include file="../component/Footer.jsp" %>
                <!-- End of Footer -->

            </div>

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <a class="btn btn-primary" href="login.html">Logout</a>
                    </div>
                </div>
            </div>
        </div>
        <!--        model-Create-->
        <div class="modal fade" id="CreateFormLabel" tabindex="-1" aria-labelledby="CreateFormLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="card">
                        <div class="modal-header" style="background-color:#36b9cc">
                            <h5 class="modal-title" id="registerFormLabel" style="color: white;">Create</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="card-body p-4">                 
                            <form action="create_customer" method="POST">
                                <c:if test="${error!=null}">
                                    <div class="p-4 mb-4 text-sm text-red-700 bg-red-100 rounded-lg" role="alert">
                                        <span class="font-medium">Error!</span> ${error}
                                    </div>
                                </c:if>
                                <div class="form-floating">
                                    <input type="Text" class="form-control mb-2" id="email"  placeholder="name@example.com" name="Name">
                                    <label for="Name">Name</label>
                                </div>
                                <div class="form-floating">
                                    <input type="email" class="form-control mb-2" id="Price" placeholder="Email" name="Email">
                                    <label for="Email"> Email</label>
                                </div>
                                <div class="form-floating">
                                    <input type="number" class="form-control mb-2" id="phone" placeholder="Phone" name="Phone">
                                    <label for="Phone">Phone</label>
                                </div>
                                <label for="Title">Gender</label>
                                <div class="form-floating">
                                    <input class="form-check-input" type="radio" name="gender" value="true"  checked="checked" Male  </br>
                                    <input class="form-check-input" type="radio" name="gender" value="false" checked="checked" Female
                                </div>
                                <label for="Title">Status</label>
                                <div class="form-floating"> 
                                    <select class="form-select form-select-sm form-control mb-2" aria-label=".form-select-sm example" name="status">
                                        <c:forEach items="${requestScope.status}" var="stt">
                                            <option    value="${stt.getSettingID()}" >${stt.getName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>                                
                                <div id="saveBtn" class="d-flex justify-content-center mt-2">

                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!--        model-Edit-->


        <!-- Bootstrap core JavaScript-->
        <script src="View/marketing/vendor/jquery/jquery.min.js"></script>
        <script src="View/marketing/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="View/marketing/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="View/marketing/js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="View/marketing/vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="View/marketing/vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="View/marketing/js/demo/datatables-demo.js"></script>

    </body>

</html>
