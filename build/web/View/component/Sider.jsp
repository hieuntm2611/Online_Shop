<%-- 
    Document   : Sider
    Created on : Jun 10, 2022, 1:49:43 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

        <link href="View/Public/css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!--        <div class="position-sticky" style="top: 5rem;">
                    <form class="d-flex mb-3" action="ProductList" method="GET">
                        <input type="search" name="service" value="search" hidden>
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="keyword" value="${requestScope.keyword}">
                        <input type="search" name="cateID" value="${requestScope.cateId}" hidden>
                        <input type="search" name="orderBy" value="1" hidden>
                        <input type="search" name="sortBy" value="c" hidden>
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                    <div class="mb-3">
                        <h4>Category</h4>
                        <div class="row gx-4 gx-lg-5 row-cols-1 row-cols-md-2 row-cols-xl-1 justify-content-center">
                            <c:forEach items="${requestScope.cate}" var="category">
                                <div class = "col">
                                    <a href="ProductList?service=search&cateID=${category.getSettingID()}&orderBy=0&keyword=${requestScope.keyword}">${category.getName()} </a>               
                                </div>
                            </c:forEach>  
                        </div>
                    </div>
                    <div class="col">                           
                        <h4>Lastest Product</h4>
                        <c:forEach items="${requestScope.latestProduct}" var="p">
                            <div class="col mb-5">
                                <div class="card h-70 w-70">
                                     Product image
                                    <div class="card-header bg-transparent border-bottom-0 h-50">
                                        <c:if test="${p.thumbnail != null}">
                                            <img class="card-img-top h-100" src="View/Img/${p.thumbnail}" alt="..." />
                                        </c:if>
                                        <c:if test="${p.thumbnail == null}">
                                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                                        </c:if>
                                    </div>
        
                                     Product details
                                    <div class="card-body mt-5">
                                        <div class="text-center">
                                             Product name
                                            <h5 class="fw-bolder">${p.title}</h5>
                                            <div class="d-flex justify-content-center">
                                                <p class="text-decoration-line-through"> ${p.price}$</p> 
                                                <p class="ms-3">
                                                <fmt:formatNumber value = "${p.price*((100 - (p.discount))/100)}" type = "number"/>$
                                                </p>
                                            </div>
                                            <p><i class="bi bi-eye ms-3">${p.view}</i></p>
                                        </div>
                                    </div>
                                     Product actions
                                    <div class="card-footer border-top-0 bg-transparent">
                                        <a class="btn btn-outline-dark mt-auto me-2" href="ProductDetail?pid=${p.productID}">View Details</a>
                                        <a class="btn btn-outline-dark mt-auto" href="AddToCart?pid=${p.productID}"><i class="bi-cart-fill me-1"></i>Add To Cart</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>-->

        <div class="position-sticky" style="top: 5rem;" >   
            <div class="mb-4">
                <div class="row">
                    <div class="col-md-12 mb-3">
                        <form class="mb-3" action="ProductList" method="GET">
                            <input type="search" name="service" value="search" hidden>
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="keyword" value="${requestScope.keyword}">
                            <input type="search" name="cateID" value="${requestScope.cateId}" hidden>
                            <input type="search" name="orderBy" value="1" hidden>
                            <input type="search" name="sortBy" value="c" hidden>
                            
                            <button class="btn btn-primary mt-2 mb-2 w-100" type="submit">Search</button>
                            
                        </form>
                    </div>

                    <div class="accordion mb-3" id="accordionExample">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingOne">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <strong>Category</strong>
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                <div class="accordion-body">
                                    <div class="form-check">
                                        <c:forEach items="${sessionScope.cate}" var="category">
                                            <div class = "col">
                                                <a class="text-decoration-none" style="color: black" href="ProductList?service=search&cateID=${category.getSettingID()}&orderBy=1&sortBy=c&keyword=${requestScope.keyword}">${category.getName()} </a>               
                                            </div>
                                        </c:forEach>  
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <h3 class="mb-3">Latest Product</h3>
            <c:forEach items="${sessionScope.latestProduct}" var="p">
                <div class="card mb-3" style="max-width: 540px;">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <div class="badge bg-transparent text-white position-absolute">                                              
                                <img src="View/Img/c338c3_a71d72719cdb46f1adfbdd414f524d8f_mv2.gif" height="30" alt=""/>
                            </div>  
                            <img src="View/Img/${p.thumbnail}" class="img-fluid rounded-start h-100" alt="...">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <h5 class="card-title">${p.title}</h5>
                                <a href="ProductDetail?pid=${p.productID}" class="stretched-link"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <style>
            .card:hover{
                transform: scale(1.0);
                box-shadow: 0 0 8px;
            }
            .card{
                transition: transform .5s;
            }
        </style>
    </body>
</html>
