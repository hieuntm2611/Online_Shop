<%-- 
    Document   : BlogDetail
    Created on : May 29, 2022, 9:50:51 PM
    Author     : Vu Dai Luong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Blog Post - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="../component/Navbar.jsp" %>
        <!-- Page content-->
        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Post content-->
                    <article>
                        <!-- Post header-->
                        <header class="mb-4">
                            <!-- Post title-->
                            <h1 class="fw-bolder mb-1">${blog.postTitle}</h1>
                            <!-- Post meta content-->
                            <div class="text-muted fst-italic mb-2">Post Date:${blog.postDate}</div>
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                <div class="ms-3">
                                    <div class="fw-bold ">${blog.author.name}</div>
                                </div>
                            </div>

                        </header>
                        <!-- Preview image figure-->
                        <figure class="mb-4"><img class="img-fluid rounded" src="View/imgpost/${blog.thumbnail}" alt="..." /></figure>
                        <!-- Post content-->
                        <section class="mb-5">
                            <p> ${blog.postContent} </p>
                        </section>
                    </article>
                    <!-- Comments section-->
                    
                </div>
                <div class="col-lg-4">      
                    <!-- Categories widget-->
                    <div class="position-sticky" style="top: 5rem;">
                        <!-- Search widget-->
                        <form action="BlogSearch">
                            <div class="card mb-4">
                                <div class="card-header">Search</div>
                                <div class="card-body">
                                    <div class="input-group">
                                        <input class="form-control" type="search" placeholder="Enter search term..." aria-label="Enter search term..." aria-describedby="button-search" name="keyword" />
                                        <button class="btn btn-primary" id="button-search" type="submit">Go!</button>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <!-- Categories widget-->
                        <div class="card mb-4">
                            <div class="card-header">Categories</div>
                            <div class="card-body">
                                <div class="row">
                                    <c:forEach items="${st}" var="c">
                                        <div class="col-sm-6">
                                            <ul class="list-unstyled mb-0">
                                                <li><a href="BlogListCategory?categoryID=${c.settingID}">${c.name}</a></li>
                                            </ul>
                                        </div>   
                                    </c:forEach>        
                                </div>
                            </div>
                        </div>
                        <!-- Side widget-->
                        <div class="card mb-4">
                        <div class="card-header">Lastest Post</div>
                        <div class="card-body">
                            <div class="row">                       
                                <ul class="list-unstyled mb-0">
                                    <c:forEach items="${requestScope.lposts}" var="p">
                                        <li class="list-group-item" >
                                            <a href="BlogDetail?blogID=${p.postId}">${p.postTitle}</a>
                                            <div class="small text-muted">${p.postDate}</div>
                                        </li>
                                    </c:forEach>                          
                                </ul>                                     
                            </div>
                        </div>
                    </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- Footer-->
        
        <%@include file="../component/Footer.jsp" %>
    </body>
</html>
