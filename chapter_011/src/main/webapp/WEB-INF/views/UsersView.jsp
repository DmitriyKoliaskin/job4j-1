
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Users list</title>
</head>
<body>

<table style="border: 1px solid black" cellpadding="10" cellspacing="0" border="1">
    <caption><h3>User list</h3></caption>
    <tr>
        <th>id</th>
        <th>photo</th>
        <th>name</th>
        <th>login</th>
        <th>email</th>
        <th>created date</th>
        <th>password</th>
        <th>role</th>
        <th>action</th>
        <th>action</th>
    </tr>
    <%--<c:forEach items="${requestScope.users}" var="user">--%>
    <c:forEach items="${users}" var="user">
    <tr>
        <%--<td><c:out value="${user.id}"/></td>--%>
        <td>${user.id}</td>
        <td>
            <c:choose>
                <c:when test="${not empty user.photoId}">
                    <img src="${pageContext.servletContext.contextPath}/download?name=${user.photoId}"
                         width="100px" height="100px"/></br>
                    <a href="${pageContext.servletContext.contextPath}/download?name=${user.photoId}">Download</a>
                </c:when>
                <c:otherwise>no image</c:otherwise>
            </c:choose>
        </td>
        <td>${user.name}</td>
        <td>${user.login}</td>
        <td>${user.email}</td>
        <td>${user.createDate}</td>
        <td>${user.password}</td>
        <td>${user.role}</td>
        <td>
            <form action="${pageContext.servletContext.contextPath}/update" method="get">
                <input type="hidden" name="id" value="${user.id}"/>
                <input type="submit" value="update"/>
            </form>
        </td>
        <td>
            <form action="${pageContext.servletContext.contextPath}/delete" method="post">
                <input type="hidden" name="id" value="${user.id}"/>
                <input type="submit" value="delete"/>
            </form>
        </td>
    </tr>
    </c:forEach>
</table>
<br>
<form action="${pageContext.servletContext.contextPath}/create" method="get">
    <input type="submit" value="Create new user"/>
</form>
<form action="${pageContext.servletContext.contextPath}/signout" method="get">
    <input type="submit" value="Exit" style="background-color: darkgrey"/>
    <%--<button type="submit" class="btn btn-default" style="background-color: darkgrey">Exit</button>--%>
</form>

</body>
</html>