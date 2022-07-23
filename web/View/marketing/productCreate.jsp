<%-- 
    Document   : productCreate
    Created on : Jul 20, 2022, 8:48:49 PM
    Author     : Hieuhihi
--%>

<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.4.7/dist/flowbite.min.css" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/View/marketing/richtexteditor/rte_theme_default.css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/View/marketing/richtexteditor/rte.js"></script>
        <script>RTE_DefaultConfig.url_base = '${pageContext.request.contextPath}/View/marketing/richtexteditor/richtexteditor'</script>
        <script type="text/javascript" src='${pageContext.request.contextPath}/View/marketing/richtexteditor/plugins/all_plugins.js'></script>
    </head>
    <body>
        <div class="max-w-2xl mx-auto">
            <div class="mx-auto p-5">
                <div class="mb-3 flex justify-between items-center">
                    <h1 class="text-xl font-medium">Product create</h1>
                </div>
                <form class="mt-5" method="POST" enctype="multipart/form-data" id="form-post">
                    <c:if test="${error!=null}">
                        <div class="p-4 mb-4 text-sm text-red-700 bg-red-100 rounded-lg" role="alert">
                            <span class="font-medium">Error!</span> ${error}
                        </div>
                    </c:if>
                    <div>
                        <div class="mb-6">
                            <label for="title" class="block mb-2 text-sm font-medium text-gray-900">Title</label>
                            <input type="text" id="title" name="title" value="${title}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"  >
                        </div>
                        <div class="mb-6">
                            <div>
                                <label for="category" class="block mb-2 text-sm font-medium text-gray-900">Category</label>
                            </div>
                            <select id="category" name="category"
                                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"  >
                                <c:forEach items="${categories}" var="item">
                                    <option value="${item.settingID}" ${category==item.settingID ? "selected": ""}>${item.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div>
                                <label for="category" class="block mb-2 text-sm font-medium text-gray-900">Status</label>
                            </div>
                        <div class="flex items-center mb-4">
                            <c:forEach items="${status}" var="item">
                                <div class="mr-3 flex items-center">
                                    <input name="status" id="status-${item.settingID}" type="radio" value="${item.settingID}" class="w-4 h-4 text-blue-600 bg-gray-100 rounded border-gray-300 focus:ring-blue-500 focus:ring-2">
                                    <label for="status-${item.settingID}" class="ml-2 text-sm font-medium text-gray-900">${item.name}</label>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="mb-6">
                            <div class="flex justify-center items-center w-full">
                                <label for="thumbnail" class="flex flex-col justify-center items-center w-full h-64 bg-gray-50 rounded-lg border-2 border-gray-300 border-dashed cursor-pointer hover:bg-gray-100">
                                    <div class="flex flex-col justify-center items-center pt-5 pb-6">
                                        <div class="max-w-[400px] max-h-[240px]">
                                            <img id="image-preview" class="w-full h-full"/>
                                        </div>
                                        <div id="icon-upload" class="flex items-center flex-col justify-center">
                                            <svg class="mb-3 w-10 h-10 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"></path></svg>
                                            <p class="mb-2 text-sm text-gray-500 "><span class="font-semibold">Click to upload</span> or drag and drop</p>
                                        </div>
                                    </div>
                                    <input id="thumbnail" name="thumbnail" type="file" accept="image/*" class="hidden" />
                                </label>
                            </div> 
                        </div>
                        <div class="mb-6">
                            <label for="title" class="block mb-2 text-sm font-medium text-gray-900">Summary</label>
                            <input type="text" id="summary" name="summary" value="${summary}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"  >
                        </div>
                        <div class="mb-6">
                            <label for="title" class="block mb-2 text-sm font-medium text-gray-900">Price</label>
                            <input type="text" id="price" name="price" value="${price}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"  >
                        </div>
                        <div class="mb-6">
                            <label for="title" class="block mb-2 text-sm font-medium text-gray-900">Discount</label>
                            <input type="text" id="discount" name="discount" value="${discount}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"  >
                        </div>
                        <div class="mb-6">
                            <label for="title" class="block mb-2 text-sm font-medium text-gray-900">Quantity</label>
                            <input type="text" id="quantity" name="quantity" value="${quantity}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"  >
                        </div>
                    </div>
                    <button type="submit" class="mt-5 ml-auto text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center">Create</button>
                </form>
            </div>
        </div>
        <script src="https://unpkg.com/flowbite@1.4.7/dist/flowbite.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/View/marketing/js/postCreate.js"></script>
    </body>
</html>